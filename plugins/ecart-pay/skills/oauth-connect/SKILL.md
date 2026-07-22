---
name: oauth-connect
description: >-
  Connect a platform or partner app to Ecart Pay with OAuth 2.0 Authorization Code —
  create an OAuth application, redirect merchants, exchange the code for merchant
  public_id/private_id, and store credentials securely. Use when building Connect-style
  integrations, marketplace onboarding, or when the user mentions OAuth, client_id,
  or linking merchant accounts.
---

# Ecart Pay OAuth (platform connect)

Docs: https://docs.ecartpay.com/docs/oauth-ecart-pay · Index: https://docs.ecartpay.com/llms.txt · MCP: `ecartpay`

Prefer this flow over asking merchants to paste API keys into the IDE. Keys from the code exchange are used for the standard Basic → JWT API (see `sandbox-live` / `integrate-payments`).

## Environments

| | Sandbox | Production |
|---|---|---|
| Base | `https://sandbox.ecartpay.com` | `https://ecartpay.com` |
| OAuth entry | `{base}/oauth?client_id=…&redirect_uri=…&state=…` | same path on prod |

Default all new work to **sandbox**.

## Flow

1. **Create OAuth application** (once) with a dashboard token that has `write_oauth_applications`:

```bash
curl -X POST "https://sandbox.ecartpay.com/api/oauth/applications" \
  -H "Authorization: Bearer <DASHBOARD_TOKEN>" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Your App",
    "description": "Shown on the consent screen",
    "logo_url": "https://cdn.yourapp.com/logo.png",
    "redirect_url": "https://yourapp.com/oauth/callback",
    "scopes": ["read_orders", "write_orders"],
    "onboarding": {
      "headline": "Connect with Ecart Pay",
      "permissions_summary": ["View and create orders"]
    }
  }'
```

Response includes `client_id` and `client_secret` (secret shown once — store server-side only). `read_credentials` is always included.

2. **Redirect the merchant** to:

```text
https://sandbox.ecartpay.com/oauth?client_id=<CLIENT_ID>&redirect_uri=<REDIRECT_URI>&state=<STATE>
```

Merchant signs in, completes KYC if needed, grants consent.

3. **Callback** receives `?code=…&state=…`. Verify `state`. Code is single-use and expires in ~5 minutes.

4. **Exchange the code** (backend only):

```bash
curl -X POST "https://sandbox.ecartpay.com/api/oauth/token?client_id=<CLIENT_ID>" \
  -H "Authorization: <CODE>" \
  -H "x-secret: <CLIENT_SECRET>" \
  -H "Content-Type: application/json" \
  -d '{
    "grant_type": "authorization_code",
    "redirect_url": "https://yourapp.com/oauth/callback"
  }'
```

Response:

```json
{
  "account_id": "…",
  "public_id": "pub_…",
  "private_id": "prv_…",
  "scope": "read_orders,write_orders,read_credentials"
}
```

5. Store `public_id` / `private_id` encrypted. Use them with `POST /api/authorizations/token` (Basic) for the 1-hour JWT — never put `client_secret` or `private_id` in browser code or agent chat logs.

## Scopes

| Scope | Grants |
|---|---|
| `read_credentials` | Merchant keys (always added) |
| `read_orders` | Read orders |
| `write_orders` | Create / update orders |

Request only what you need. Confirm current scope names via docs MCP before coding.

## Security

- HTTPS redirect URIs only; exact match required
- Never commit `client_secret` or `private_id`
- Prefer OAuth over pasting keys into Cursor plugin Configure
- After keys exist, use the `sandbox-live` skill for MCP live sandbox calls

## Deliverables

When implementing for the user:

1. Sandbox OAuth app creation request
2. Minimal backend callback (Node or their stack) that exchanges the code
3. Next step: create JWT and a test order via `sandbox-live` / `/create-order`
4. Cite https://docs.ecartpay.com/docs/oauth-ecart-pay
