---
name: create-checkout
description: Create a live hosted Ecart Pay checkout and return the checkout URL
---

# Create checkout (live)

Create a hosted checkout and print the URL the customer can open.

## Host and auth

Prefer authenticated `ecartpay-api`. If not authenticated, docs MCP `ecartpay` `get-endpoint` + `execute-request`. Confirm production writes. On `ecartpay-api`, pass `x-ecartpay-mode`.

## Steps

1. MCP `ecartpay`: `get-endpoint` for `POST /api/checkouts`.
2. `execute-request` with the required body from the spec (currency, amounts/items as documented). Ask the user for amount/title if missing.
3. Build or copy the hosted checkout URL from the response (do not invent SDK method names or path shapes).

## Output

Checkout id and customer-facing URL. Suggest `/get-order` after payment.
