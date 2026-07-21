---
name: sdk-checkout
description: Build browser checkout experiences with Ecart Pay — hosted checkouts, payment links, SDK JS, 3DS redirects, Apple Pay, and Google Pay. Use when the user is integrating a frontend or hosted payment page rather than pure server API orders.
---

# Ecart Pay SDK and checkout

Docs index: https://docs.ecartpay.com/llms.txt · MCP: `ecartpay`

## Choose the right surface

| Need | Docs |
|---|---|
| Hosted / custom checkout API | https://docs.ecartpay.com/docs/checkout |
| Advanced checkout ops | https://docs.ecartpay.com/docs/advanced-operations-with-checkouts |
| Payment links | https://docs.ecartpay.com/docs/payment-links |
| SDK JS (ES module) | https://docs.ecartpay.com/docs/sdks |
| 3DS redirect flow | https://docs.ecartpay.com/docs/3d-secure-3ds-payment-flow |
| Google Pay | https://docs.ecartpay.com/docs/google-paytm-integration-guide |
| Apple Pay | https://docs.ecartpay.com/docs/apple-pay-tm-integation-guide |
| Tokenization via SDK | https://docs.ecartpay.com/docs/tokenization |

## Auth and environment

- Server-side API calls still need the Basic → JWT token flow (1 hour).
- Default to `https://sandbox.ecartpay.com` and sandbox keys.
- Frontend should never embed Private keys. Use public identifiers / server-issued tokens as docs prescribe.

## Implementation guidance

1. Confirm whether the user wants **hosted checkout link**, **payment link template**, or **SDK-embedded** card / wallet UI.
2. Pull the exact install/config snippets from the SDK or checkout docs — do not invent SDK method names.
3. For 3DS, follow the redirect return-URL flow in the 3DS guide.
4. Wire `notify_url` / webhooks for asynchronous confirmation; use the `webhooks` skill for signature verification.
5. Test with sandbox cards: https://docs.ecartpay.com/docs/test-cards-1

## Security

- PCI: keep PAN/CVC out of your application logs; prefer Ecart Pay SDK / tokenization.
- Never commit keys or checkout secrets.
- Warn before production domain allowlists (Apple Pay / Google Pay) or live keys.
