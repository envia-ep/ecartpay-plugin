# Marketplace submission checklist

## Cursor Marketplace

Repo: https://github.com/envia-ep/ecartpay-plugin

- [x] `.cursor-plugin/marketplace.json` valid
- [x] `plugins/ecartpay/.cursor-plugin/plugin.json` valid (kebab-case `ecartpay`)
- [x] Rules / skills / commands have required frontmatter
- [x] Logo at `plugins/ecartpay/assets/logo.svg`
- [x] `node scripts/validate-template.mjs` passes
- [ ] Email Cursor: `kniparko@anysphere.com` (or Slack) with repo URL + plugin name `ecartpay`

Suggested message:

```text
Subject: Ecart Pay Cursor Marketplace plugin submission

Hi — we'd like to list the Ecart Pay plugin on the Cursor Marketplace.

Repo: https://github.com/envia-ep/ecartpay-plugin
Marketplace name: ecartpay
Plugin name: ecartpay
Description: Integrate Ecart Pay payments, checkouts, webhooks, and SDK using official docs + MCP (https://ecartpay.readme.io/mcp).

Validation: node scripts/validate-template.mjs passes.
```

## Claude Code

Self-serve (no Anthropic store submission required for a git marketplace):

```shell
/plugin marketplace add envia-ep/ecartpay-plugin
/plugin install ecartpay@ecartpay
```

`claude plugin validate .` and `claude plugin validate ./plugins/ecartpay` pass.

## ChatGPT Work / Codex

Self-serve git marketplace (Work mode / Codex only — not Chat mode):

```bash
codex plugin marketplace add envia-ep/ecartpay-plugin
```

Catalog: `.agents/plugins/marketplace.json` includes required `policy` + `category`.

Apps SDK / public ChatGPT Apps Directory UI (`.app.json`) is intentionally out of v1.
