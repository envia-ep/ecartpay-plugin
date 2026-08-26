# Changelog

## 1.3.2 — 2026-08-25

- `create_invoice`, `add_order_items`, and `set_default_price` now expose the API body fields (billing_information, line-item objects, price_id)
- `debug_payment` / `investigate_transaction` use allowlisted `list_transactions` and `retrieve_transaction`
- Subscription plan links: `create_subscription_template`, `list_subscription_templates`, `retrieve_subscription_template` (`payment_link`). `retrieve_balance` is Business Payments only; otherwise use `list_transactions`.`current`

## 1.3.1 — 2026-08-25

- Authenticate OAuth app must request the allowlist scopes (not only orders); merchants re-consent after a scope change
- Public `ecartpay-api` tool names match Stripe verb_resource (`create_order`, `create_subscription`, `create_refund`, …)
- Skill `subscriptions` + router rows for billing, catalog, invoices, chargebacks
- Command `/create-subscription` (job, not 1:1 with every tool)
- `ecartpay-api` auth documented as JWT mint, not Basic on every request

## 1.3.0 — 2026-08-21

- MCP `ecartpay-api` at `https://mcp.ecartpay.com/mcp` — Cursor Authenticate (OAuth 2.1 + PKCE). Login on `https://ecartpay.com`. Docs stay on ReadMe `ecartpay`.
- Live commands prefer authenticated `ecartpay-api` curated tools (Stripe-sized allowlist plus WhatsApp send/status/orders, not every API route); docs MCP `execute-request` remains the fallback. Documentation search stays on ReadMe `ecartpay`.

## 1.2.1 — 2026-08-21

- Live `/connect-oauth`: Ecart Pay merchant Connect (`POST /api/oauth/applications`, `{host}/oauth`, `POST /api/oauth/token`) via MCP `execute-request`
- Configure: `ECARTPAY_CLIENT_ID`, `ECARTPAY_CLIENT_SECRET`, `ECARTPAY_REDIRECT_URI`

## 1.2.0 — 2026-08-21

- MCP URL: `https://docs.ecartpay.com/mcp` (same ReadMe-hosted server, Ecart Pay custom domain)
- Commands are live API actions only: `/setup-auth`, `/create-order`, `/create-payment-link`, `/create-checkout`, `/whatsapp-status`, `/send-whatsapp-payment`, `/get-order`, `/refund-order`
- Configure `ECARTPAY_MODE` (`sandbox` | `production`); dashboard/OAuth stay on production; API token and writes use the selected host
- Drop scaffold slash commands (skills remain): `choose-integration`, `integrate-payments`, `sdk-checkout`, `webhooks`, `mexican-billing`, `bank-transfer-clabe`, `msi-installments`, `sandbox-live`, `connect-oauth`

## 1.1.2 — 2026-08-21

- Commands: add slash commands for every skill (`sandbox-live`, `integrate-payments`, `webhooks`, `sdk-checkout`, `choose-integration`, `msi-installments`, `bank-transfer-clabe`, `mexican-billing`)

## 1.1.1 — 2026-08-21

- MCP: drop first-party `ecartpay-api` (`mcp.ecartpay.com`). Use the ReadMe MCP (`ecartpay`) for docs and sandbox `execute-request`.

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
