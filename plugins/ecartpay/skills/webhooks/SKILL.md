---
name: webhooks
description: Register and verify Ecart Pay webhooks — event subscriptions, HMAC signature verification, retries, and secure receiver endpoints. Use when adding notify_url handlers or webhook integrations.
---

# Ecart Pay webhooks

Docs index: https://docs.ecartpay.com/llms.txt · Overview: https://docs.ecartpay.com/docs/webhooks-in-ecart-pay · Auth: https://docs.ecartpay.com/docs/webhook-authentication · Events: https://docs.ecartpay.com/docs/webhook-events

## Register a webhook

`POST /api/webhooks` with Authorization JWT:

```json
{
  "url": "https://your-server.com/webhook",
  "events": ["billing_information.updated", "billing_information.deleted"]
}
```

Choose real event names from https://docs.ecartpay.com/docs/webhook-events — do not invent them.

## Verify every delivery

Headers:

- `x-pay-timestamp` — ms UTC
- `x-pay-signature` — `SHA256=<hex>`
- `x-pay-webhook-id` — unique id

Base string:

```text
{timestamp}.{webhook_id}.{JSON.stringify(body.data)}
```

HMAC-SHA256 with the account webhook secret, then compare to `x-pay-signature` (ignore the `SHA256=` prefix when comparing digests carefully; match the documented format).

Reject with `401` on mismatch. Always use HTTPS receivers. Keep the secret in env vars.

## Implementation rules

1. Verify signature **before** business logic.
2. Respond quickly with `2xx` after accept; do heavy work async if needed.
3. Handle retries — see https://docs.ecartpay.com/docs/notification-retrie
4. Idempotency: key off `x-pay-webhook-id` or event ids when available.
5. Never log the raw secret or full signed payloads with PII beyond what you need for debugging.

## Deliverables

Provide:

1. Registration request against sandbox
2. Receiver handler with signature verification for the user's stack
3. Links to the event list and retry docs used
