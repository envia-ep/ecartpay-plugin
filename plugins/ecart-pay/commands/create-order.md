---
name: create-order
description: Create a live customer, token, and order via authenticated MCP or docs execute-request
---

# Create order (live)

Run the canonical pay-in on the selected API host. Prefer authenticated MCP `ecartpay-api` tools (`customers.create`, `orders.create`, …). If that server is not authenticated, use docs MCP `ecartpay` `get-endpoint` + `execute-request`. If the user asks for MSI / installments, add official tokenize fields from docs — do not invent them.

## Host and auth

Authenticate login stays on production. Resolve API host from `ECARTPAY_BASE_URL` or `ECARTPAY_MODE` (default sandbox). Confirm production writes. On `ecartpay-api`, pass `x-ecartpay-mode`. JWT from `/setup-auth` only when using the docs MCP.

## Sequence

Confirm shapes with `get-endpoint` before each call:

1. `POST /api/customers`
2. `POST /api/customers/{customer_id}/cards` — sandbox test card from https://docs.ecartpay.com/docs/test-cards-1 when mode is sandbox
3. `POST /api/tokens` — card `id` (+ `cvc` when required)
4. `POST /api/orders` — `customer_id`, `currency`, `items`, `token`, optional `notify_url`

## Output

Order id, status, and amount. No secrets, PAN, or full JWT. Suggest `/get-order` or `/refund-order` next.
