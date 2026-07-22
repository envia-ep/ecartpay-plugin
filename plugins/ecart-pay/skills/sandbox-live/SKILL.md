---
name: sandbox-live
description: >-
  Create a live sandbox payment in chat via the ecartpay MCP execute-request tool —
  Basic auth to JWT, then customer, card, tokenize, and order using test cards. Use when
  the user wants a real sandbox order without inventing API fields, or after OAuth
  connect returns merchant keys.
---

# Live sandbox via MCP

Docs index: https://docs.ecartpay.com/llms.txt · Backend flow: https://docs.ecartpay.com/docs/backend-integration · Test cards: https://docs.ecartpay.com/docs/test-cards-1 · MCP: `ecartpay`

## Credentials (priority order)

1. Merchant `public_id` / `private_id` from a completed OAuth exchange (`oauth-connect`) — prefer this.
2. Plugin Configure variables: `ECARTPAY_PUBLIC_KEY`, `ECARTPAY_PRIVATE_KEY`, optional `ECARTPAY_BASE_URL` (default `https://sandbox.ecartpay.com`).
3. If neither is available: run `/setup-auth` or `/connect-oauth` first — do not invent keys.

Never use production hosts or live keys unless the user explicitly confirms.

## MCP write path

Use the `ecartpay` MCP tools. Discover exact shapes with `search-endpoints` / `get-endpoint` before each call. Then `execute-request` with HAR payloads.

Base URL must be `https://sandbox.ecartpay.com` (or `ECARTPAY_BASE_URL` if it is clearly sandbox).

### 1. Authorization token

`POST {base}/api/authorizations/token`

- Header: `Authorization: Basic base64(publicKey:privateKey)`
- Response: `{ "token": "…" }` — valid ~1 hour
- Subsequent calls: `Authorization: <token>` (not Bearer unless the docs for that endpoint say otherwise — confirm via MCP)

### 2. Pay-in sequence

Follow https://docs.ecartpay.com/docs/backend-integration (confirm fields via MCP):

1. `POST /api/customers`
2. `POST /api/customers/{customer_id}/cards` — sandbox test card from docs
3. `POST /api/tokens` — card `id` (+ `cvc` when required)
4. `POST /api/orders` — `customer_id`, `currency`, `items`, `token`, optional `notify_url`

Do not invent fields. If MCP returns a validation error, fix from the error + `get-endpoint`.

## Safety

- Confirm with the user before any `execute-request` whose URL host is `ecartpay.com` without `sandbox.`
- Do not log full private keys, Basic headers, or JWTs
- Prefer sandbox test cards only
- After success, summarize order id/status and link webhook follow-up (`webhooks` skill)

## Output

1. Which credential source you used (OAuth vs Configure)
2. Which MCP tools/docs pages you used
3. Resulting sandbox customer/order identifiers (not secrets)
