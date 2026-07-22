---
name: setup-auth
description: Walk through Ecart Pay sandbox credentials and create a 1-hour authorization token
---

# Setup Ecart Pay auth (sandbox)

Help the user create a working sandbox Authorization token.

Prefer **OAuth** when they are a platform connecting merchants (`/connect-oauth`, skill `oauth-connect`). Use dashboard keys or plugin Configure variables as a fallback for direct merchant sandbox work.

## Steps

1. Confirm they will use **sandbox** (not production).
2. Obtain keys (first match):
   - Merchant `public_id` / `private_id` from OAuth code exchange
   - Plugin Configure: `ECARTPAY_PUBLIC_KEY` / `ECARTPAY_PRIVATE_KEY`
   - Dashboard: Sandbox toggle on → Integrations → API
3. Create a token:

```bash
# base64 of "publicKey:privateKey"
curl --request POST \
  --url https://sandbox.ecartpay.com/api/authorizations/token \
  --header "accept: application/json" \
  --header "authorization: Basic <base64(publicKey:privateKey)>"
```

Or use MCP `execute-request` (skill `sandbox-live`) when the `ecartpay` MCP is available.

4. Expect `{ "token": "..." }`. Explain the token lasts **1 hour**.
5. Show how to call a simple authenticated endpoint next (e.g. create customer/order) with `Authorization: <token>`.
6. Link docs: https://docs.ecartpay.com/docs/authorization-token · https://docs.ecartpay.com/docs/api-keys-sandbox · https://docs.ecartpay.com/docs/oauth-ecart-pay
7. Remind them never to commit keys or tokens.
