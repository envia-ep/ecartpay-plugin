---
name: create-order
description: Scaffold a minimal authenticated Ecart Pay sandbox create-order flow
---

# Create a sandbox order

Build a minimal pay-in against sandbox using official docs only.

## Prerequisites

- Sandbox JWT from `/setup-auth` (valid ~1 hour)
- Docs: https://docs.ecartpay.com/docs/backend-integration and create-order reference via https://docs.ecartpay.com/llms.txt

## Flow to scaffold

1. `POST /api/customers`
2. `POST /api/customers/{customer_id}/cards` (sandbox test card from https://docs.ecartpay.com/docs/test-cards-1)
3. `POST /api/tokens` with card id
4. `POST /api/orders` with `customer_id`, `currency`, `items`, `token`, optional `notify_url`

Base URL: `https://sandbox.ecartpay.com`

## Output

- Exact request bodies for the user's language/stack
- No invented fields — verify against the API reference before finalizing
- Note webhook/notify_url follow-up and token expiry
- Refuse to default to production hosts or live keys
