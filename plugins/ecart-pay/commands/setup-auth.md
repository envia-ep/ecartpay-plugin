---
name: setup-auth
description: Walk through Ecart Pay sandbox API keys and create a 1-hour authorization token
---

# Setup Ecart Pay auth (sandbox)

Help the user create a working sandbox Authorization token.

## Steps

1. Confirm they will use **sandbox** (not production).
2. Instruct them to open Ecart Pay → enable Sandbox → Integrations → API, and copy Public + Private keys.
3. Create a token:

```bash
# base64 of "publicKey:privateKey"
curl --request POST \
  --url https://sandbox.ecartpay.com/api/authorizations/token \
  --header "accept: application/json" \
  --header "authorization: Basic <base64(publicKey:privateKey)>"
```

4. Expect `{ "token": "..." }`. Explain the token lasts **1 hour**.
5. Show how to call a simple authenticated endpoint next (e.g. create customer/order) with `Authorization: <token>`.
6. Link docs: https://docs.ecartpay.com/docs/authorization-token and https://docs.ecartpay.com/docs/api-keys-sandbox
7. Remind them never to commit keys or tokens.
