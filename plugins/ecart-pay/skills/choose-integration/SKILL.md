---
name: choose-integration
description: >-
  Recommend the right Ecart Pay integration surface — server API orders, hosted
  checkout, payment links, or SDK / wallets. Use when the user is starting a new
  integration, unsure between checkout vs API, or asks how to accept payments.
---

# Choose an Ecart Pay integration

Docs index: https://docs.ecartpay.com/llms.txt · MCP: `ecartpay`

## Decision table

| Need | Start here | Skill / docs |
|---|---|---|
| Server-side card pay-in, full control | Backend API (customer → card → token → order) | `integrate-payments`, `sandbox-live` · https://docs.ecartpay.com/docs/backend-integration |
| Hosted payment page | Checkout API | `sdk-checkout` · https://docs.ecartpay.com/docs/checkout |
| Shareable pay link | Payment links | `sdk-checkout` · https://docs.ecartpay.com/docs/payment-links |
| Embedded browser SDK / 3DS / wallets | SDK JS, Apple Pay, Google Pay | `sdk-checkout` · https://docs.ecartpay.com/docs/sdks |
| Platform connects merchants | OAuth Authorization Code | `oauth-connect` · https://docs.ecartpay.com/docs/oauth-ecart-pay |
| Mexico MSI | API + installment fields | `msi-installments` |
| CLABE / bank transfer | Transfers | `bank-transfer-clabe` |
| Facturación | Billing information + webhooks | `mexican-billing` |
| Async confirmation | Webhooks HMAC | `webhooks` |

## Process

1. Ask what they are building (marketplace, single merchant, hosted vs API) — one clarifying question if needed.
2. Pick **one** primary surface from the table; mention webhooks as a follow-up when money moves.
3. Default sandbox; cite the docs URL for the chosen path.
4. Hand off to the matching skill for implementation — do not mix Stripe Checkout / PaymentIntent patterns.

## Output

- Recommended surface + why
- First three implementation steps
- Doc links and next skill to invoke
