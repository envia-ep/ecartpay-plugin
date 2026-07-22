---
name: bank-transfer-clabe
description: >-
  Implement Ecart Pay bank transfer / CLABE / SPEI-style pay-ins — create transfer
  payment methods, present CLABE instructions, and confirm via webhooks. Use when
  the user mentions CLABE, SPEI, bank transfer, or transferencia.
---

# Bank transfer and CLABE

Docs: https://docs.ecartpay.com/docs/transfers · Index: https://docs.ecartpay.com/llms.txt · MCP: `ecartpay`

## Choose the surface

Confirm the current transfer / CLABE endpoints and payloads with MCP before coding. Start from the transfers guide — do not invent SPEI field names from other processors.

## Typical flow

1. Sandbox auth JWT
2. Create the payment / transfer object per docs (customer, amount, currency MXN when applicable)
3. Present CLABE / reference / expiration to the payer from the API response only
4. Confirm asynchronously via `notify_url` / webhooks — verify HMAC (`webhooks` skill)
5. Idempotent status handling (pending → paid / expired / cancelled)

## Security

- Sandbox first; warn before production
- Do not log full account numbers beyond what support needs
- Never invent test CLABEs — use sandbox fixtures from docs

## Deliverables

- Scaffold for create + status polling or webhook handler
- Links to transfers + webhook-events docs used
