# Marketplace submission checklist

Repo: https://github.com/envia-ep/ecartpay-plugin

Local install (`~/.cursor/plugins/local/ecartpay`) only works on your machine. Others install via Public Marketplace or Team Marketplace below.

## Checklist

- [x] `.cursor-plugin/marketplace.json` valid
- [x] `plugins/ecartpay/.cursor-plugin/plugin.json` valid (kebab-case `ecartpay`)
- [x] Rules / skills / commands have required frontmatter
- [x] Square Ecart Pay “e” logo at `plugins/ecartpay/assets/logo.png` (+ `logo.svg`)
- [x] `node scripts/validate-template.mjs` passes
- [ ] Submit for Public Cursor Marketplace review (below)
- [ ] Optional: import into Tendencys Team Marketplace (below)

## Public Cursor Marketplace (anyone)

1. Open [cursor.com/marketplace/publish](https://cursor.com/marketplace/publish), **or** email `kniparko@anysphere.com` / Cursor Slack.
2. Submit:
   - Repo: `https://github.com/envia-ep/ecartpay-plugin`
   - Marketplace name: `ecartpay`
   - Plugin name: `ecartpay`
3. Cursor manually reviews (repo is public MIT — required).
4. After listing, users install via **Browse Marketplace** → search “Ecart Pay”.

Suggested email:

```text
Subject: Ecart Pay Cursor Marketplace plugin submission

Hi — we'd like to list the Ecart Pay plugin on the Cursor Marketplace.

Repo: https://github.com/envia-ep/ecartpay-plugin
Marketplace name: ecartpay
Plugin name: ecartpay
Description: Integrate Ecart Pay payments, checkouts, webhooks, and SDK using official docs + MCP (https://ecartpay.readme.io/mcp).

Validation: node scripts/validate-template.mjs passes.
```

## Team Marketplace (Tendencys — faster for teammates)

If you have admin access on the Tendencys Cursor team:

1. Open Cursor **Dashboard → Plugins**.
2. Under **Team Marketplaces**, click **Add Marketplace** → **Import from Repo**.
3. Import `envia-ep/ecartpay-plugin` (or the full GitHub URL).
4. Add / review the `ecartpay` plugin; set Marketplace Access and install mode (Default Off / Default On / Required).
5. Optionally enable Auto Refresh (requires Cursor GitHub App on the repo).
6. Teammates find it under **Customize** without waiting for public review.

Team Marketplace loads from GitHub — it does not use `~/.cursor/plugins/local/`.

## Claude Code

Self-serve git marketplace:

```shell
/plugin marketplace add envia-ep/ecartpay-plugin
/plugin install ecartpay@ecartpay
```

## ChatGPT Work / Codex

Self-serve (Work mode / Codex only — not Chat mode):

```bash
codex plugin marketplace add envia-ep/ecartpay-plugin
```

Catalog: `.agents/plugins/marketplace.json` includes required `policy` + `category`.
