---
name: create-order
description: Scaffold or run a minimal authenticated Ecart Pay sandbox create-order flow
---

# Create a sandbox order

Build a minimal pay-in against sandbox using official docs only. Prefer live MCP when credentials exist (`sandbox-live`).

## Prerequisites

- Sandbox JWT from `/setup-auth` or OAuth merchant keys (valid ~1 hour)
- Docs: https://docs.ecartpay.com/docs/backend-integration · https://docs.ecartpay.com/llms.txt
- Optional: plugin variables `ECARTPAY_PUBLIC_KEY` / `ECARTPAY_PRIVATE_KEY` / `ECARTPAY_BASE_URL`

## Flow

1. If MCP + keys are available, follow skill `sandbox-live` (`execute-request` sequence).
2. Otherwise scaffold the same HTTP flow for the user's stack:

   - `POST /api/customers`
   - `POST /api/customers/{customer_id}/cards` (sandbox test card from https://docs.ecartpay.com/docs/test-cards-1)
   - `POST /api/tokens` with card id
   - `POST /api/orders` with `customer_id`, `currency`, `items`, `token`, optional `notify_url`

Base URL: `https://sandbox.ecartpay.com` (or sandbox `ECARTPAY_BASE_URL`).

## Output

- Exact request bodies for the user's language/stack, or MCP call results
- No invented fields — verify against the API reference / MCP before finalizing
- Note webhook/notify_url follow-up and token expiry
- Refuse to default to production hosts or live keys
