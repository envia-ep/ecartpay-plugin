# Changelog

## 1.1.0 — 2026-07-21

- OAuth-first: skill `oauth-connect`, command `/connect-oauth`
- Live sandbox: skill `sandbox-live` (MCP `execute-request`)
- Plugin Configure fallback variables: `ECARTPAY_PUBLIC_KEY`, `ECARTPAY_PRIVATE_KEY`, `ECARTPAY_BASE_URL`
- Rules: MCP writes sandbox-only; prefer OAuth over pasted keys
- Mexico skills: `msi-installments`, `bank-transfer-clabe`, `mexican-billing`, `choose-integration`
- MCP: Keep ReadMe docs MCP (`ecartpay`); add first-party `ecartpay-api` → `https://mcp.ecartpay.com/mcp`

## 1.0.2 — 2026-07-21

- Relative `assets/logo.svg` for local + marketplace logos

## 1.0.0 — 2026-07-21

- Initial release of the Ecart Pay plugin for Cursor, Claude Code, and ChatGPT Work / Codex
- Rules: docs-first, auth/security, sandbox vs production
- Skills: integrate-payments, webhooks, sdk-checkout
- Commands: setup-auth, create-order
- MCP: `https://ecartpay.readme.io/mcp`
