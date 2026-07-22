---
name: msi-installments
description: >-
  Implement Mexico MSI or fixed installment payments with Ecart Pay — tokenize and
  create orders with installment fields. Use when the user mentions MSI, meses sin
  intereses, installments, or cuota.
---

# MSI and installments (Mexico)

Docs index: https://docs.ecartpay.com/llms.txt · MCP: `ecartpay` · Backend: https://docs.ecartpay.com/docs/backend-integration

## Rules

1. Confirm installment field names and allowed values with MCP `get-endpoint` / docs before coding — do not invent MSI parameters.
2. Default to sandbox + test cards: https://docs.ecartpay.com/docs/test-cards-1
3. Installments are usually set at **tokenize** and/or **order** time; verify which endpoints accept MSI / fixed installment fields for the merchant's gateway.
4. Never assume Stripe-style `payment_method_options` — use Ecart Pay shapes only.

## Implementation checklist

1. Auth JWT (sandbox) via `setup-auth` / `sandbox-live`
2. Create customer + card
3. Tokenize with installment options from the official API reference
4. Create order with the token; surface installment count in the UI only after the API accepts it
5. Handle declines and webhook confirmation (`webhooks` skill)

## Deliverables

- Request examples for the user's stack with cited docs URLs
- Clear note that MSI availability depends on BIN / affiliation / gateway config
