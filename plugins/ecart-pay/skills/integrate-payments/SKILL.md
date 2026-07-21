---
name: integrate-payments
description: Build or debug Ecart Pay server-side pay-in flows — auth, customers, cards, tokenization, and orders. Use when integrating payments, creating orders, refunds, or payment links via the API.
---

# Integrate Ecart Pay payments

Use official docs only. Index: https://docs.ecartpay.com/llms.txt · MCP: `ecartpay` (`https://ecartpay.readme.io/mcp`).

## Auth (required first)

1. Sandbox keys from dashboard (Sandbox toggle on) → Integrations → API.
2. `POST https://sandbox.ecartpay.com/api/authorizations/token`
   - Header: `Authorization: Basic base64(publicKey:privateKey)`
3. Use response `token` as `Authorization: <token>` for ~1 hour.
4. Docs: https://docs.ecartpay.com/docs/authorization-token

## Canonical backend pay-in flow

Follow https://docs.ecartpay.com/docs/backend-integration:

1. **Create customer** — `POST /api/customers`
2. **Create customer card** — `POST /api/customers/{customer_id}/cards`
3. **Tokenize** — `POST /api/tokens` with card `id` (+ `cvc` when required); optional MSI / fixed installments fields
4. **Create order** — `POST /api/orders` with `customer_id`, `currency`, `items`, `token`, optional `notify_url`

Do not invent fields. Confirm request/response shapes in the API reference before coding.

## Related surfaces

| Goal | Start here |
|---|---|
| Refunds | https://docs.ecartpay.com/docs/refunds |
| Payment links | https://docs.ecartpay.com/docs/payment-links |
| Checkouts | https://docs.ecartpay.com/docs/checkout |
| Bank transfer / CLABE | https://docs.ecartpay.com/docs/transfers |
| Errors / HTTP status | https://docs.ecartpay.com/docs/error-reference-guide |

## Security checklist

- Sandbox by default (`sandbox.ecartpay.com` + sandbox keys)
- No keys/tokens/PAN in git or logs
- Prefer env vars for credentials
- Warn before any production host or live key usage

## Output expectations

When implementing:

1. State which docs page you used.
2. Show sandbox base URL and auth step.
3. Produce minimal, working request examples (cURL or the user's stack).
4. Call out token expiry and webhook/notify_url next steps when relevant.
