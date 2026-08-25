# Ecart Pay plugin

Official [Ecart Pay](https://ecartpay.com) agent plugin for **Cursor**, **Claude Code**, and **ChatGPT Work mode / Codex**.

One shared plugin body (`skills`, MCP, commands) with host-specific manifests — so agents integrate payments against [docs.ecartpay.com](https://docs.ecartpay.com) instead of inventing APIs.

## Features

- **Docs-first** — [`llms.txt`](https://docs.ecartpay.com/llms.txt) + ReadMe MCP
- **Authenticate** — Cursor button on `ecartpay-api` (`https://mcp.ecartpay.com/mcp`); merchant login on `https://ecartpay.com`
- **OAuth connect** — skill `oauth-connect` for partner apps that onboard merchants
- **Live actions** — slash commands via `ecartpay-api` when authenticated, else MCP `execute-request` (`ECARTPAY_MODE` sandbox or production)
- **Mexico** — MSI, CLABE/transfers, billing/facturación, integration planner (skills)
- **Skills** — pay-ins, webhooks (HMAC), SDK / checkout / 3DS / wallets, WhatsApp
- **Commands** — `/setup-auth`, `/connect-oauth`, `/create-order`, `/create-subscription`, `/create-payment-link`, `/create-checkout`, `/whatsapp-status`, `/send-whatsapp-payment`, `/get-order`, `/refund-order`
- **Cursor rules** — auth, sandbox vs production, MCP write safety
- **MCP** — `ecartpay` (`https://docs.ecartpay.com/mcp`) for docs; `ecartpay-api` (`https://mcp.ecartpay.com/mcp`) for Authenticate and live API tools

## Install

### Cursor

1. Install from the Cursor Marketplace when published, **or** import this repo as a **Team Marketplace** (Dashboard → Plugins → Import from Repo).
2. Enable the `ecart-pay` plugin and MCP servers.
3. Enable MCP: Authenticate on `ecartpay-api`. Optional Configure: `ECARTPAY_MODE` (`sandbox` default / `production`), API keys as fallback, and for partner Connect `ECARTPAY_CLIENT_ID` / `ECARTPAY_CLIENT_SECRET` / `ECARTPAY_REDIRECT_URI`.
4. Validate from a clone:

```bash
node scripts/validate-template.mjs
```

**Local test (this machine only):**

```bash
./scripts/install-local.sh
# then: Developer: Reload Window
```

Do not use **+ Add → From Local Repo** on the parent `ecartpay-plugin` folder — use the script above. Local installs are for skills/MCP testing; the custom green “e” logo usually only appears via Team or Public Marketplace (see [docs/marketplace-submission.md](docs/marketplace-submission.md)).

Submit / request listing: Cursor team Slack or `kniparko@anysphere.com` with this repository URL.

### Claude Code

```shell
/plugin marketplace add envia-ep/ecartpay-plugin
/plugin install ecart-pay@ecartpay
/reload-plugins
```

Validate:

```bash
claude plugin validate .
claude plugin validate ./plugins/ecart-pay
```

### ChatGPT Work mode / Codex

Plugins apply in **Work mode** or **Codex** (not Chat mode / mobile).

```bash
codex plugin marketplace add envia-ep/ecartpay-plugin
```

Or open Plugins in the ChatGPT desktop app (Work mode / Codex), add this marketplace, and install **Ecart Pay**.

Repo marketplace catalog: [`.agents/plugins/marketplace.json`](.agents/plugins/marketplace.json).

## Repository layout

```text
.cursor-plugin/marketplace.json      # Cursor catalog
.claude-plugin/marketplace.json      # Claude Code catalog
.agents/plugins/marketplace.json     # ChatGPT / Codex catalog
plugins/ecart-pay/
  .cursor-plugin/plugin.json
  .claude-plugin/plugin.json
  .codex-plugin/plugin.json
  mcp.json                           # Cursor
  .mcp.json                          # Claude + Codex
  rules/                             # Cursor
  skills/
  commands/
```

## Quick agent prompts

- “Send a WhatsApp payment request to this phone via Ecart Pay.”
- “Create a payment link for 500 MXN and give me the URL.”
- “Add an Ecart Pay webhook receiver with HMAC verification.”
- “Which integration should I use — API order, checkout, or payment link?”
- “Implement MSI 3 months / CLABE pay-in for Mexico.”

## Docs

- [Developer documentation](https://docs.ecartpay.com)
- [OAuth](https://docs.ecartpay.com/docs/oauth-ecart-pay)
- [Authorization token](https://docs.ecartpay.com/docs/authorization-token)
- [Backend integration](https://docs.ecartpay.com/docs/backend-integration)
- [Webhooks](https://docs.ecartpay.com/docs/webhooks-in-ecart-pay)
- [MCP setup](https://docs.ecartpay.com/docs/mcp)

## License

MIT — see [plugins/ecart-pay/LICENSE](plugins/ecart-pay/LICENSE).
