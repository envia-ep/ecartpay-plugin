---
name: send-whatsapp-payment
description: Send a live WhatsApp payment request (flow) to a customer phone
---

# Send WhatsApp payment (live)

Hero action: charge a customer in WhatsApp via `POST /api/whatsapp/flows/send`.

## Host and auth

Prefer authenticated `ecartpay-api` (`whatsapp_status`, `send_whatsapp_payment`). If not authenticated, docs MCP `ecartpay` `get-endpoint` + `execute-request`. Confirm production writes. On `ecartpay-api`, pass `x-ecartpay-mode`.

## Steps

1. Run the `/whatsapp-status` flow first (`GET /api/whatsapp/status`). If WhatsApp is not connected, **stop** and tell the user to connect it in the dashboard. Do not call Meta/WhatsApp APIs directly.
2. Require `phone` or `customer_id`. Ask for amount/concept/items if missing.
3. MCP `ecartpay`: `get-endpoint` for `POST /api/whatsapp/flows/send`, then `execute-request` with the documented body (`phone` or `customer_id`, optional `items` / `total_amount` / `concept` / `template_id` / `order_id` / `payment_link`).
4. Do not invent template names, Flow IDs, or WhatsApp Cloud API calls.

## Output

What was sent (phone, amount/concept) and any order / conversation / payment-link ids from the response. Suggest `/get-order` if an order id is returned.
