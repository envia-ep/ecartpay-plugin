---
name: setup-auth
description: Confirm Ecart Pay auth — Authenticate on ecartpay-api, or mint a JWT via docs MCP
---

# Setup auth (live)

Prefer Cursor **Authenticate** on MCP `ecartpay-api` (`https://mcp.ecartpay.com/mcp`). That logs the merchant in on `https://ecartpay.com` and stores keys server-side. Do not ask the user to paste keys if Authenticate already succeeded.

## Host

1. Dashboard / Authenticate login: always `https://ecartpay.com`.
2. API writes: `ECARTPAY_BASE_URL` if set, else `ECARTPAY_MODE=production` → `https://ecartpay.com`, else `https://sandbox.ecartpay.com`.
3. Never mix sandbox keys with production. Before any write to a non-sandbox host, get explicit confirmation.

## Steps

1. If `ecartpay-api` is connected: call `ecartpay_session`. Authenticated session is enough — the HTTP MCP mints a JWT with `POST /api/authorizations/token` (Basic `public_id`/`private_id` from the OAuth session) and sends that JWT on API calls. Send `x-ecartpay-mode` matching `ECARTPAY_MODE`. Sandbox on this server only works when sandbox keys are linked; otherwise say so and use Configure sandbox keys + docs MCP `ecartpay`.
2. Else keys (first match): merchant `public_id` / `private_id` from `/connect-oauth` in this session, then Configure `ECARTPAY_PUBLIC_KEY` / `ECARTPAY_PRIVATE_KEY`. Do not invent keys.
3. Docs MCP `ecartpay`: `get-endpoint` for `POST /api/authorizations/token`, then `execute-request` with `Authorization: Basic base64(publicKey:privateKey)`.
4. Expect `{ "token": "..." }` (~1 hour) only on the docs-MCP path. Do not log the full JWT.
5. Output: mode, API host, auth path (`ecartpay-api` session vs JWT), and `scope`. If scope is only orders, the OAuth app needs the Authenticate allowlist scopes and a new consent — subscriptions/customers/WhatsApp tools will 403 until then.
6. Next: `/create-order`, `/create-subscription`, or `/create-payment-link`.
