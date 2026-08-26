# Publication roadmap

What is left to ship the Ecart Pay plugin for Cursor, Claude Code, and ChatGPT Work / Codex.

Repo: https://github.com/envia-ep/ecartpay-plugin (already **public**).

The plugin body is largely done. `node scripts/validate-template.mjs` passes. Live API calls prefer `ecartpay-api` when Authenticate succeeds; docs MCP `ecartpay` remains the fallback. Remaining work is repo polish, Team Marketplace QA, and public listings.

Related: [marketplace-submission.md](./marketplace-submission.md) (how to submit).

## Current status

| Area | Status |
|---|---|
| Public GitHub repo | Done |
| Cursor / Claude / Codex manifests (`1.3.2`) | Done |
| Skills, commands, rules, logos | Done |
| Template validator | Passes |
| MCP (`https://docs.ecartpay.com/mcp`) | Live — docs + `execute-request` |
| First-party `mcp.ecartpay.com` | Implemented in `ecart-payment/mcp` (OAuth 2.1 Authenticate) — deploy DNS/TLS + OAuth app |
| Cursor Public Marketplace | Not submitted |
| Claude plugin directory | Not submitted |
| Tendencys Team Marketplace | Not imported |

---

## Phase 0 — MCP story

- [x] Docs MCP: `ecartpay` (`https://docs.ecartpay.com/mcp`) for search / `get-endpoint` / `execute-request` fallback.
- [x] First-party `ecartpay-api` (`https://mcp.ecartpay.com/mcp`) for Cursor Authenticate (OAuth 2.1). Implemented in `ecart-payment/mcp`. Deploy separately.
- [x] Skills (`sandbox-live`, etc.) target MCP `ecartpay` for docs; live actions prefer `ecartpay-api` when authenticated.

---

## Phase 1 — Repo polish (before Submit)

None of this fails the local validator. Reviewers and GitHub still see it.

- [ ] LICENSE file skipped: Cursor lists `license` as optional; Help only requires public open source, not a `LICENSE` file.
- [x] Sync `plugins/ecart-pay/README.md` with the root README (live action commands, `ECARTPAY_MODE`, ReadMe MCP).
- [x] Add `SECURITY.md`: sandbox by default, never commit keys, HMAC on webhooks, how to report issues.
- [ ] GitHub about: topics (`cursor-plugin`, `claude-code`, `mcp`, `payments`), homepage `https://docs.ecartpay.com`.
- [ ] Tag and GitHub Release `v1.3.2`.
- [x] Add `.github/workflows/` that runs `node scripts/validate-template.mjs` on push/PR.
- [x] Fix the sample email in [marketplace-submission.md](./marketplace-submission.md): plugin name is `ecart-pay`, not `ecartpay`.
- [x] Document that plugin Configure variables (`ECARTPAY_PUBLIC_KEY`, `ECARTPAY_PRIVATE_KEY`, `ECARTPAY_BASE_URL`) are **skill fallbacks**, not `${VAR}` substitutions in `mcp.json`.

---

## Phase 2 — Internal QA (Team Marketplace)

Local install (`./scripts/install-local.sh`) does not prove the green “e” logo.

- [ ] Cursor Dashboard → Plugins → Import from Repo: `envia-ep/ecartpay-plugin`.
- [ ] Uninstall any Local copy first so you are testing the GitHub-backed install.
- [ ] Confirm avatar is the green “e”, not the blue book.
- [ ] Enable MCP server `ecartpay`.
- [ ] Smoke prompts:
  - Connect a partner app with OAuth in sandbox.
  - Create a sandbox customer/order via `ecartpay-api` when Authenticate works (docs MCP `execute-request` as fallback).
  - Add a webhook receiver with HMAC verification.

---

## Phase 3 — Public listings

### Cursor

- [ ] Submit at [cursor.com/marketplace/publish](https://cursor.com/marketplace/publish) (or Cursor Slack / `kniparko@anysphere.com`).
  - Repo: `https://github.com/envia-ep/ecartpay-plugin`
  - Marketplace name: `ecartpay`
  - Plugin name: `ecart-pay`
- [ ] After listing: search **Browse Marketplace** → “Ecart Pay” and install from there.

### Claude Code

Git install already works:

```shell
/plugin marketplace add envia-ep/ecartpay-plugin
/plugin install ecart-pay@ecartpay
```

For Discover / official directory:

- [ ] Run `claude plugin validate .` and `claude plugin validate ./plugins/ecart-pay`.
- [ ] Submit [platform.claude.com/plugins/submit](https://platform.claude.com/plugins/submit) (or the claude.ai directory form).

### ChatGPT Work / Codex

Self-serve; no extra public directory.

```bash
codex plugin marketplace add envia-ep/ecartpay-plugin
```

- [ ] Confirm install in **Work mode / Codex** (not Chat mode) and that the logo/name show as Ecart Pay.

---

## Phase 4 — Optional

- [ ] `CONTRIBUTING.md` (how to add a skill / run the validator).
- [ ] List on [cursor.directory](https://cursor.directory) if Cursor review is slow.
- [ ] Screenshots of the plugin in Customize → Plugins for the submission form.

---

## Suggested order

```text
Phase 1  README / SECURITY / CI / tag
    → Phase 2  Team Marketplace + logo QA
        → Phase 3  Cursor submit, then Claude directory, then Codex smoke
```

Owner split: Phase 1 is this repo. Phases 2–3 are marketplace forms and team admin.
