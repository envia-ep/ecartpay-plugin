---
name: subscriptions
description: >-
  Implement or create Ecart Pay recurring billing — customers, subscription
  amounts/intervals, catalog-backed plans, update and cancel. Use when the user
  asks for subscriptions, recurring charges, create a subscription, cancel
  subscription, or billing cycles.
---

# Ecart Pay subscriptions

Docs: https://docs.ecartpay.com/docs/subscriptions · Templates: https://docs.ecartpay.com/docs/subscription-templates · Management: https://docs.ecartpay.com/docs/subscriptions-management · Catalog plans: https://docs.ecartpay.com/docs/advanced-subscriptions · Index: https://docs.ecartpay.com/llms.txt

**Implementing in another system:** write code from these docs (`get-endpoint` before each call). **Doing it now in chat:** Authenticate on `ecartpay-api` and use `create_subscription` (command `/create-subscription`). Docs MCP `execute-request` is the fallback.

Do not invent fields. Do not use Stripe Subscription / Price / PaymentIntent names.

## Canonical create (fixed amount)

Follow https://docs.ecartpay.com/docs/subscriptions. Confirm the body with `get-endpoint` `POST /api/subscriptions`.

1. **Customer** — `POST /api/customers` (`create_customer`) if you do not already have `customer_id`.
2. **Subscription** — `POST /api/subscriptions` (`create_subscription`). Required: `customer_id`. Typical: `amount`, `currency`, `interval` (`daily` \| `weekly` \| `monthly` \| `quarterly` \| `semiannual` \| `yearly`), `frequency`, `service`.
3. Without `card_ids`, the API usually creates the subscription and invites the customer to add a payment method — it does **not** charge a card in that path. Confirm from the response; do not assume a charge.
4. Optional from docs only: `trial_period_days`, `end_date`, `benefits`, `billing_cycle`, `merchant_management` + `notify_url`.

## Reusable template + shareable link

Follow https://docs.ecartpay.com/docs/subscription-templates. Confirm with `get-endpoint` `POST /api/subscriptions-template`.

1. **Template** — `create_subscription_template` (`service`, `frequency`, `interval`, `currency`, `amount`). Response includes `id` and `payment_link` (`{host}/subscription_payment_link/{id}`) when `link_enabled` is not false.
2. **Share** that `payment_link` so a customer starts checkout and a subscription from the plan.
3. **Subscribe in API** — `create_subscription` with `customer_id` + `template_id` (optional amount override). Docs: https://docs.ecartpay.com/docs/subscriptions

List/retrieve: `list_subscription_templates`, `retrieve_subscription_template`.

## Catalog-backed / usage plans

If they need products, prices, or usage billing, use https://docs.ecartpay.com/docs/advanced-subscriptions. Confirm `items[]` / `template_id` via `get-endpoint`. Do not invent price snapshot fields.

## Manage

| Action | Endpoint | Live tool |
|---|---|---|
| List | `GET /api/subscriptions` | `list_subscriptions` |
| Retrieve | `GET /api/subscriptions/:id` | `retrieve_subscription` |
| Update (status, `card_ids`) | `PUT /api/subscriptions/:id` | `update_subscription` |
| Cancel | documented cancel/remove on that resource | `cancel_subscription` |

Confirm cancel vs `status: cancelled` on update with `get-endpoint`. Do not invent a Stripe-like `cancel_at_period_end` unless it appears in the spec.

## Output

- When implementing: docs URL used, sandbox host, minimal request example.
- When live: subscription `id`, `status`, `interval`, `amount` / currency. Suggest `list_subscriptions` or `cancel_subscription` next. No secrets or full JWT.
