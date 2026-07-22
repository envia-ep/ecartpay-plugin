# Marketplace submission checklist

Repo: https://github.com/envia-ep/ecartpay-plugin

Local install (`~/.cursor/plugins/local/ecart-pay`) only works on your machine. Others install via Public Marketplace or Team Marketplace below.

## Checklist

- [x] `.cursor-plugin/marketplace.json` valid
- [x] `plugins/ecart-pay/.cursor-plugin/plugin.json` valid (kebab-case `ecart-pay`)
- [x] Rules / skills / commands have required frontmatter
- [x] Square Ecart Pay “e” logo at `plugins/ecart-pay/assets/logo.png` (+ `logo.svg`)
- [x] `node scripts/validate-template.mjs` passes
- [x] OAuth + sandbox-live + Mexico skills (v1.1.0)
- [ ] Deploy `ecart-payment` MCP process to `mcp.ecartpay.com` (see `ecart-payment/mcp/README.md`)
- [ ] Submit for Public Cursor Marketplace review (below)
- [ ] Import into Tendencys Team Marketplace and verify green “e” logo (below)

## Local testing (this machine only)

Cursor’s documented path is a copy under `~/.cursor/plugins/local/` — not “Add from Local Repo” on the parent marketplace folder.

```bash
./scripts/install-local.sh
# then: Developer: Reload Window
```

Requirements:

- Target: `~/.cursor/plugins/local/ecart-pay/`
- Manifest at `…/ecart-pay/.cursor-plugin/plugin.json` (plugin root, not nested)
- Do **not** pick the parent `ecartpay-plugin` folder in **+ Add → From Local Repo** — that often toasts “added” without listing under Installed
- Uninstalling from the UI deletes `~/.cursor/plugins/local/ecart-pay`; re-run the script to restore

### Logo expectations

| Install method | Shows in Installed | Custom logo |
|---|---|---|
| `./scripts/install-local.sh` (Local) | Yes (Local badge) | Often no (generic blue book) |
| Team Marketplace import | Yes | Yes (green “e”) |
| Public Marketplace | Yes | Yes (green “e”) |

Relative `"logo": "assets/logo.svg"` resolves via `raw.githubusercontent.com` using the install’s repo + commit. Pure Local disk installs have no GitHub commit context, so Cursor falls back to the blue book even when `assets/logo.svg` exists on disk. Use Team Marketplace (or Public Marketplace) to QA the green “e”.

## Public Cursor Marketplace (anyone)

1. Open [cursor.com/marketplace/publish](https://cursor.com/marketplace/publish), **or** email `kniparko@anysphere.com` / Cursor Slack.
2. Submit:
   - Repo: `https://github.com/envia-ep/ecartpay-plugin`
   - Marketplace name: `ecartpay`
   - Plugin name: `ecart-pay`
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

## Team Marketplace (Tendencys — logo QA + teammates)

If you have admin access on the Tendencys Cursor team. This is the correct path to verify the green “e” avatar (GitHub-backed logo resolution).

### Import checklist

- [ ] Open Cursor **Dashboard → Plugins**
- [ ] Under **Team Marketplaces**, click **Add Marketplace** → **Import from Repo**
- [ ] Import `envia-ep/ecartpay-plugin` (or `https://github.com/envia-ep/ecartpay-plugin`)
- [ ] Add / review the `ecart-pay` plugin
- [ ] Set Marketplace Access and install mode (Default Off / Default On / Required)
- [ ] Optionally enable Auto Refresh (requires Cursor GitHub App on the repo)
- [ ] In Cursor **Customize → Plugins**, install **Ecart Pay** from the team marketplace (**not** Local)
- [ ] Confirm the avatar is the green “e” (not the blue book)
- [ ] Confirm MCP `ecartpay` and skills/commands load

Team Marketplace loads from GitHub — it does not use `~/.cursor/plugins/local/`. If you still have a Local install, uninstall it first so you are testing the team marketplace copy.

## Claude Code

Self-serve git marketplace:

```shell
/plugin marketplace add envia-ep/ecartpay-plugin
/plugin install ecart-pay@ecartpay
```

## ChatGPT Work / Codex

Self-serve (Work mode / Codex only — not Chat mode):

```bash
codex plugin marketplace add envia-ep/ecartpay-plugin
```

Catalog: `.agents/plugins/marketplace.json` includes required `policy` + `category`.
