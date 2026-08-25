---
name: get-order
description: Fetch a live Ecart Pay order by id and summarize status
---

# Get order (live)

Look up an order after a pay-in, payment link, checkout, or WhatsApp send.

## Host and auth

Prefer authenticated `ecartpay-api`. If not authenticated, docs MCP `ecartpay` `get-endpoint` + `execute-request`. On `ecartpay-api`, pass `x-ecartpay-mode`.

## Steps

1. Ask for `order_id` if the user did not provide one (use the last order created in this chat if available).
2. MCP `ecartpay`: `get-endpoint` for `GET /api/orders/:id`, then `execute-request`.
3. Summarize id, status, amount, currency, customer, and payment method fields present in the response. Do not invent statuses.

## Output

Human-readable order status. Suggest `/refund-order` only if the order is refundable per the response.
