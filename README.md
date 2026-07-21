# Ecart Pay plugin

Official [Ecart Pay](https://ecartpay.com) agent plugin for **Cursor**, **Claude Code**, and **ChatGPT Work mode / Codex**.

One shared plugin body (`skills`, MCP, commands) with host-specific manifests — so agents integrate payments against [docs.ecartpay.com](https://docs.ecartpay.com) instead of inventing APIs.

## Features

- **Docs-first** — always start from [`llms.txt`](https://docs.ecartpay.com/llms.txt)
- **MCP** — `https://ecartpay.readme.io/mcp` ([MCP guide](https://docs.ecartpay.com/docs/mcp))
- **Skills** — pay-ins, webhooks (HMAC), SDK / checkout / 3DS / wallets
- **Commands** — `/setup-auth`, `/create-order`
- **Cursor rules** — auth, sandbox vs production, never invent endpoints

## Install

### Cursor

1. Install from the Cursor Marketplace when published, **or** add this repo as a plugin marketplace source.
2. Enable the `ecartpay` plugin and the `ecartpay` MCP server.
3. Validate locally from a clone:

```bash
node scripts/validate-template.mjs
```

Submit / request listing: Cursor team Slack or `kniparko@anysphere.com` with this repository URL.

### Claude Code

```shell
/plugin marketplace add envia-ep/ecartpay-plugin
/plugin install ecartpay@ecartpay
/reload-plugins
```

Validate:

```bash
claude plugin validate .
claude plugin validate ./plugins/ecartpay
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
plugins/ecartpay/
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

- “Create a sandbox authorization token and a minimal create-order flow.”
- “Add an Ecart Pay webhook receiver with HMAC verification.”
- “Integrate hosted checkout / payment links with sandbox test cards.”

## Docs

- [Developer documentation](https://docs.ecartpay.com)
- [Authorization token](https://docs.ecartpay.com/docs/authorization-token)
- [Backend integration](https://docs.ecartpay.com/docs/backend-integration)
- [Webhooks](https://docs.ecartpay.com/docs/webhooks-in-ecart-pay)
- [MCP setup](https://docs.ecartpay.com/docs/mcp)

## License

MIT — see [plugins/ecartpay/LICENSE](plugins/ecartpay/LICENSE).
