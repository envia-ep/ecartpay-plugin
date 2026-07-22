---
name: connect-oauth
description: Scaffold an Ecart Pay sandbox OAuth Authorization Code callback (partner connect)
---

# Connect OAuth (sandbox)

Scaffold a partner backend that connects merchants via Ecart Pay OAuth.

Docs: https://docs.ecartpay.com/docs/oauth-ecart-pay

## Prerequisites

- Sandbox partner account and dashboard token with `write_oauth_applications` (or an existing sandbox `client_id` / `client_secret`)
- HTTPS redirect URI (use a tunnel in local dev if needed)

## Scaffold

1. Default base URL: `https://sandbox.ecartpay.com`
2. If the user has no app yet, show `POST /api/oauth/applications` to create one; remind them to store `client_secret` once.
3. Provide a minimal Node (Express) example:

- `GET /connect` — generate `state`, redirect to `{base}/oauth?client_id&redirect_uri&state`
- `GET /oauth/callback` — verify `state`, `POST /api/oauth/token` with `Authorization: <code>`, `x-secret: <client_secret>`, body `{ grant_type, redirect_url }`
- Persist `account_id`, `public_id`, `private_id` encrypted — do not print secrets

4. Env vars: `ECARTPAY_CLIENT_ID`, `ECARTPAY_CLIENT_SECRET`, `ECARTPAY_REDIRECT_URI`, `ECARTPAY_BASE_URL` (default sandbox).
5. After a successful exchange, point them to `/setup-auth` or the `sandbox-live` skill to create a JWT and a test order.
6. Refuse to default redirect or token exchange to production unless the user explicitly asks.
