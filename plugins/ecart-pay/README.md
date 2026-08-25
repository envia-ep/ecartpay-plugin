# Ecart Pay plugin

Official agent plugin for [Ecart Pay](https://ecartpay.com) integrations.

Helps Cursor, Claude Code, and ChatGPT Work / Codex agents build payment flows using:

- Official docs: [docs.ecartpay.com](https://docs.ecartpay.com) · [`llms.txt`](https://docs.ecartpay.com/llms.txt)
- MCP: `https://docs.ecartpay.com/mcp` (docs) and `https://mcp.ecartpay.com/mcp` (Authenticate + live API)

## What’s included

| Component | Purpose |
|---|---|
| Rules (Cursor) | Docs-first, auth/security, sandbox vs production |
| Skills | `integrate-payments`, `subscriptions`, `webhooks`, `sdk-checkout`, `oauth-connect`, `sandbox-live`, `choose-integration`, `msi-installments`, `bank-transfer-clabe`, `mexican-billing` |
| Commands | Live jobs: `/setup-auth`, `/connect-oauth`, `/create-order`, `/create-subscription`, `/create-payment-link`, `/create-checkout`, `/whatsapp-status`, `/send-whatsapp-payment`, `/get-order`, `/refund-order` |
| MCP | `ecartpay` ReadMe docs MCP; `ecartpay-api` first-party HTTP MCP with Authenticate |

## Install

See the [repository README](https://github.com/envia-ep/ecartpay-plugin) for Cursor Marketplace, Claude Code, and ChatGPT / Codex install steps.

## Security

- Default API host from `ECARTPAY_MODE` (`sandbox` → `https://sandbox.ecartpay.com`)
- Never commit API keys, JWTs, or webhook secrets
- Verify webhook HMAC signatures before processing events
