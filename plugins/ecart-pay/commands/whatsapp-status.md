---
name: whatsapp-status
description: Check whether Ecart Pay WhatsApp is connected for this account
---

# WhatsApp status (live)

Gate for `/send-whatsapp-payment`. Uses `GET /api/whatsapp/status`.

## Host and auth

Prefer authenticated `ecartpay-api`. If not authenticated, docs MCP `ecartpay` `get-endpoint` + `execute-request`. On `ecartpay-api`, pass `x-ecartpay-mode`.

## Steps

1. MCP `ecartpay`: `get-endpoint` for `GET /api/whatsapp/status`.
2. `execute-request`.
3. Summarize connected / phone configured / catalog / flow ready using fields from the response. Do not invent Meta APIs.

## Output

Whether WhatsApp is ready to send a payment. If not connected, tell the user to connect WhatsApp in the Ecart Pay dashboard — then stop.
