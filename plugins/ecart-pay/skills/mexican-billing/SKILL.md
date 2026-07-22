---
name: mexican-billing
description: >-
  Handle Ecart Pay billing information and Mexican invoicing (facturación) —
  billing_information APIs and related webhooks. Use when the user mentions
  factura, CFDI, billing_information, or tax invoice Mexico.
---

# Mexican billing / facturación

Docs index: https://docs.ecartpay.com/llms.txt · Webhooks: https://docs.ecartpay.com/docs/webhooks-in-ecart-pay · Events: https://docs.ecartpay.com/docs/webhook-events · MCP: `ecartpay`

## Rules

1. Discover `billing_information` (and related) endpoints via MCP — do not invent CFDI field names.
2. Subscribe only to real event names from the webhook events docs (e.g. billing_information updates when listed).
3. Verify every webhook with HMAC before updating local invoice state (`webhooks` skill).
4. Sandbox for integration tests; warn before production tax documents.

## Implementation checklist

1. Collect required fiscal fields from the official API schema
2. Create / update billing information on the correct resource (customer/order per docs)
3. Register webhooks for billing lifecycle events
4. Map statuses to the merchant's ERP / invoice system with idempotency keys

## Deliverables

- API + webhook handler outline for the user's stack
- Cited docs URLs for every field and event used
