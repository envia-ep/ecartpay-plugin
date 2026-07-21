# Add a plugin

This repository ships one plugin today: `plugins/ecart-pay`.

To add another pack (for example POS or subscriptions-focused):

1. Create `plugins/my-new-plugin/` with the component folders you need (`skills/`, `rules/`, `commands/`, MCP files).
2. Add host manifests:
   - `plugins/my-new-plugin/.cursor-plugin/plugin.json`
   - `plugins/my-new-plugin/.claude-plugin/plugin.json` (if Claude should load it)
   - `plugins/my-new-plugin/.codex-plugin/plugin.json` (if Codex / ChatGPT Work should load it)
3. Register the plugin in each marketplace catalog:
   - [`.cursor-plugin/marketplace.json`](../.cursor-plugin/marketplace.json)
   - [`.claude-plugin/marketplace.json`](../.claude-plugin/marketplace.json)
   - [`.agents/plugins/marketplace.json`](../.agents/plugins/marketplace.json) (include `policy` + `category`)
4. Validate:

```bash
node scripts/validate-template.mjs
claude plugin validate .
```

Keep skill bodies shared when possible; only manifests and marketplace entries should diverge per host.
