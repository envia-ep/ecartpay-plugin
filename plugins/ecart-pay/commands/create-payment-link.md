---
name: create-payment-link
description: Create a live Ecart Pay payment link (template) and return the shareable URL
---

# Create payment link (live)

Create a pay-link template and print the URL the merchant can share.

## Host and auth

Prefer authenticated `ecartpay-api` (`create_payment_link`). If not authenticated, docs MCP `ecartpay` `get-endpoint` + `execute-request`. Confirm production writes. On `ecartpay-api`, pass `x-ecartpay-mode`.

## Steps

1. MCP `ecartpay`: `get-endpoint` for `POST /api/templates` (`write_paylinks`).
2. `execute-request` with currency + at least one item (and any other required fields from the spec). Ask the user for amount/concept if missing.
3. Read `payment_link` (or equivalent URL field) from the response. Do not invent the URL path.

## Output

The shareable payment link URL and template id. Suggest `/get-order` after someone pays.
