# Security

Report plugin or integration security issues to [support@ecartpay.com](mailto:support@ecartpay.com). Do not file public GitHub issues for secrets, card data, or exploitable bugs.

If you find a problem in a Cursor Marketplace listing, you can also write [security-reports@cursor.com](mailto:security-reports@cursor.com).

## Defaults

- Live slash commands and new integrations default to **sandbox** (`ECARTPAY_MODE=sandbox` → `https://sandbox.ecartpay.com`).
- Dashboard login and OAuth stay on `https://ecartpay.com`.
- Do not mix sandbox keys with the production API host (or the reverse).

## Secrets

- Never commit API keys, JWTs, webhook secrets, `client_secret`, or card data.
- Store secrets in environment variables, a secrets manager, or Cursor **Plugins → Configure**. Plugin Configure values (`ECARTPAY_PUBLIC_KEY`, `ECARTPAY_PRIVATE_KEY`, `ECARTPAY_CLIENT_SECRET`, and related) are **skill / command fallbacks**. They are not `${VAR}` substitutions in `mcp.json`.
- Do not log full PANs, CVCs, or raw `Authorization` headers.

## Payments and webhooks

- Prefer tokenization / SDK flows for card capture.
- Verify webhook `x-pay-signature` (HMAC-SHA256) before processing events. Docs: https://docs.ecartpay.com/docs/webhook-authentication

## MCP

- Docs: `https://docs.ecartpay.com/mcp` (`ecartpay`).
- Authenticate + live API: `https://mcp.ecartpay.com/mcp` (`ecartpay-api`). Tokens last about one hour; refresh before expiry.
