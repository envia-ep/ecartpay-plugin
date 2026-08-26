---
name: create-subscription
description: Create a live Ecart Pay subscription (recurring billing) via authenticated MCP or docs execute-request
---

# Create subscription (live)

Create a recurring subscription on the selected API host. Prefer authenticated `ecartpay-api` tools (`create_customer`, `create_subscription`). If that server is not authenticated, use docs MCP `ecartpay` `get-endpoint` + `execute-request`. Do not invent fields. Docs: https://docs.ecartpay.com/docs/subscriptions

This is a **job**, not a 1:1 wrapper. List/update/cancel use tools (`list_subscriptions`, `update_subscription`, `cancel_subscription`) — do not add extra slash commands.

## Host and auth

Authenticate login stays on production. Resolve API host from `ECARTPAY_BASE_URL` or `ECARTPAY_MODE` (default sandbox). Confirm production writes. On `ecartpay-api`, pass `x-ecartpay-mode`. JWT from `/setup-auth` only when using the docs MCP.

## Sequence

Confirm shapes with `get-endpoint` before each call:

1. `POST /api/customers` (`create_customer`) unless the user already has a `customer_id`.
2. `POST /api/subscriptions` (`create_subscription`) — at least `customer_id`. Ask for `amount`, `currency`, `interval`, and `service` if missing. Optional `trial_period_days` / `card_ids` only if present in the spec and the user asked.
3. Without a card, expect an invitation / unpaid setup — do not claim a charge happened unless the response shows it.

For catalog-backed plans (`items` / `template_id`), confirm https://docs.ecartpay.com/docs/advanced-subscriptions via `get-endpoint` first.

## Output

Subscription id, status, interval, and amount. No secrets or full JWT. Suggest `list_subscriptions` or `cancel_subscription` next (not `/get-order` unless an order id is in the response).
