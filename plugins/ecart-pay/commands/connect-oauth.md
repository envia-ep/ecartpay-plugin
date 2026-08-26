---
name: connect-oauth
description: Connect a merchant via Ecart Pay OAuth Authorization Code and obtain public_id/private_id
---

# Connect OAuth (live)

Use the Ecart Pay **partner Connect** API in `ecart-payment` (`/oauth`, `POST /api/oauth/applications`, `POST /api/oauth/token`). This is not Cursor’s MCP Authenticate button.

This links a **merchant account** and returns API keys (`public_id` / `private_id`). Then `/setup-auth` mints the 1-hour JWT.

## Host

Same rule as other live commands: `ECARTPAY_BASE_URL`, else `ECARTPAY_MODE=production` → `https://ecartpay.com`, else `https://sandbox.ecartpay.com`. Confirm production. Authorize URL is `{host}/oauth?...` on that host.

## Credentials

1. Partner OAuth app: Configure `ECARTPAY_CLIENT_ID`, `ECARTPAY_CLIENT_SECRET`, `ECARTPAY_REDIRECT_URI` (must match the app’s allowed redirect).
2. If those are missing and the user is a partner with `write_oauth_applications`, create an app first: JWT from `/setup-auth` (partner keys) → MCP `get-endpoint` + `execute-request` `POST /api/oauth/applications`. Show `client_id` / `client_secret` once; do not log the secret after.
3. Do not invent client ids, scopes, or redirect URIs.

## Steps

1. Confirm `redirect_uri` and generate a random `state`.
2. Ask the user to open:

```text
{host}/oauth?client_id={CLIENT_ID}&redirect_uri={REDIRECT_URI}&state={STATE}
```

They sign in, consent, and land on the callback with `?code=&state=`.
3. They paste the full callback URL (or `code` + `state`) into chat. Verify `state`. Code is single-use and short-lived.
4. MCP `ecartpay`: `get-endpoint` for `POST /api/oauth/token`. Then `execute-request` with query `client_id`, header `Authorization: {code}`, header `x-secret: {client_secret}`, JSON body `{ "grant_type": "authorization_code", "redirect_url": "{redirect_uri}" }` — confirm the exact header/body names via `get-endpoint` before sending.
5. Expect `account_id`, `public_id`, `private_id` (and `scope` if present). Do not print `private_id` or `client_secret` in full.
6. Use those merchant keys with `/setup-auth` / `/create-order`. Prefer them over pasted Configure API keys for this session.

## Output

Merchant `account_id`, that keys were obtained (yes/no), scopes, next command `/setup-auth` then a live pay-in. Cite https://docs.ecartpay.com/docs/oauth-ecart-pay.
