---
name: refund-order
description: Refund a live Ecart Pay order
---

# Refund order (live)

Reverse a demo or real payment on the selected API host.

## Host and auth

Prefer authenticated `ecartpay-api`. If not authenticated, docs MCP `ecartpay` `get-endpoint` + `execute-request`. Confirm production writes. On `ecartpay-api`, pass `x-ecartpay-mode`.

## Steps

1. Require `order_id`. Prefer `GET /api/orders/:id` first so you refund the right amount/status.
2. MCP `ecartpay`: `get-endpoint` for `POST /api/orders/:order_id/refund` (fallback `POST /api/refunds` if that is the documented path).
3. `execute-request` with the documented body. Ask before a partial vs full refund if the spec allows both.
4. Confirm production refunds explicitly.

## Output

Refund id/status and remaining order status. No secrets.
