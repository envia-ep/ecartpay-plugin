# Ecart Pay plugin

Official agent plugin for [Ecart Pay](https://ecartpay.com) integrations.

Helps Cursor, Claude Code, and ChatGPT Work / Codex agents build payment flows using:

- Official docs: [docs.ecartpay.com](https://docs.ecartpay.com) · [`llms.txt`](https://docs.ecartpay.com/llms.txt)
- MCP: `https://ecartpay.readme.io/mcp`

## What’s included

| Component | Purpose |
|---|---|
| Rules (Cursor) | Docs-first, auth/security, sandbox vs production |
| Skills | `integrate-payments`, `webhooks`, `sdk-checkout` |
| Commands | `setup-auth`, `create-order` |
| MCP | ReadMe-hosted Ecart Pay MCP server |

## Install

See the [repository README](https://github.com/envia-ep/ecartpay-plugin) for Cursor Marketplace, Claude Code, and ChatGPT / Codex install steps.

## Security

- Default to sandbox: `https://sandbox.ecartpay.com`
- Never commit API keys, JWTs, or webhook secrets
- Verify webhook HMAC signatures before processing events
