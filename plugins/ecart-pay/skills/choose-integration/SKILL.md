---
name: choose-integration
description: >-
  Recommend the right Ecart Pay integration surface — server API orders, hosted
  checkout, payment links, subscriptions, catalog, invoices, or SDK / wallets.
  Use when the user is starting a new integration, unsure between checkout vs
  API, recurring billing, or asks how to accept payments.
---

# Choose an Ecart Pay integration

Docs index: https://docs.ecartpay.com/llms.txt · Docs MCP: `ecartpay` · Live tools: `ecartpay-api`

**This skill is for choosing how to implement** (write code against docs). If the user wants you to **do it now** in this chat (create an order, subscription, link), use Authenticate + `ecartpay-api` tools (or the matching slash command). Do not mix Stripe PaymentIntent / Checkout Session names.

## Decision table

| Need | Implement with | Live now (if Authenticate) | Docs |
|---|---|---|---|
| Server-side card pay-in | `integrate-payments`, `sandbox-live` | `create_customer` → `create_order` or `/create-order` | https://docs.ecartpay.com/docs/backend-integration |
| Hosted payment page | `sdk-checkout` | `create_checkout` or `/create-checkout` | https://docs.ecartpay.com/docs/checkout |
| Shareable pay link | `sdk-checkout` | `create_payment_link` or `/create-payment-link` | https://docs.ecartpay.com/docs/payment-links |
| Recurring billing / subscriptions | `subscriptions` | `create_subscription` or `/create-subscription` | https://docs.ecartpay.com/docs/subscriptions |
| Reusable subscription plan + shareable link | `subscriptions` | `create_subscription_template` | https://docs.ecartpay.com/docs/subscription-templates |
| Product catalog / prices | `subscriptions` (advanced plans) + docs | `create_product`, `create_price`, `list_products` | https://docs.ecartpay.com/docs/advanced-subscriptions |
| Invoices (`billings`) | `mexican-billing` when CFDI; else docs | `create_invoice`, `list_invoices` | Confirm with `get-endpoint` `POST /api/billings` |
| Chargebacks | docs + webhooks | `list_chargebacks`, `retrieve_chargeback` | Confirm with `get-endpoint` `GET /api/chargebacks` |
| How much money is in the account | docs | `retrieve_balance` (Business Payments / `b2b` only). Else `list_transactions` and read the latest `current` | Confirm with `get-endpoint` `GET /api/transactions/balance-details` |
| Embedded SDK / 3DS / wallets | `sdk-checkout` | — | https://docs.ecartpay.com/docs/sdks |
| Platform connects merchants | `oauth-connect` | `/connect-oauth` (partner Connect, not Authenticate) | https://docs.ecartpay.com/docs/oauth-ecart-pay |
| Mexico MSI | `msi-installments` | tokenize fields on `/create-order` | docs + `get-endpoint` |
| CLABE / bank transfer | `bank-transfer-clabe` | — | https://docs.ecartpay.com/docs/transfers |
| Facturación / CFDI | `mexican-billing` | — | billing + webhooks |
| Async confirmation | `webhooks` | — | https://docs.ecartpay.com/docs/webhook-authentication |

## Process

1. Ask what they are building (marketplace, single merchant, one-time vs recurring) — one clarifying question if needed.
2. Pick **one** primary surface from the table.
3. If they asked to **create/list/cancel something now**, hand off to the live tool or command. If they asked to **integrate**, hand off to the skill and cite the docs URL.
4. Default sandbox; never invent fields.

## Output

- Recommended surface + why
- First three implementation steps **or** the live tool/command to run
- Doc links and next skill to invoke
