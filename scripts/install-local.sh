#!/usr/bin/env bash
# Copy the Cursor plugin into ~/.cursor/plugins/local for this machine only.
# Do NOT use Customize → + Add → From Local Repo on the parent marketplace folder
# (ecartpay-plugin) — that often toasts "added" without showing under Installed.
# Prefer this script, then Developer: Reload Window.
#
#   ./scripts/install-local.sh              # marketplace URLs (mcp.ecartpay.com)
#   ./scripts/install-local.sh --local-mcp  # Authenticate against http://127.0.0.1:8080/mcp
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
source_dir="${repo_root}/plugins/ecart-pay"
target_dir="${HOME}/.cursor/plugins/local/ecart-pay"
local_mcp=0
mcp_url="http://127.0.0.1:8080/mcp"

if [[ "${1:-}" == "--local-mcp" ]]; then
  local_mcp=1
fi

if [[ ! -f "${source_dir}/.cursor-plugin/plugin.json" ]]; then
  echo "error: missing ${source_dir}/.cursor-plugin/plugin.json" >&2
  exit 1
fi

mkdir -p "${HOME}/.cursor/plugins/local"
rm -rf "${target_dir}"
cp -R "${source_dir}" "${target_dir}"

if [[ "${local_mcp}" -eq 1 ]]; then
  python3 - "${target_dir}" "${mcp_url}" <<'PY'
import json, sys
from pathlib import Path
root = Path(sys.argv[1])
url = sys.argv[2]
for name in ("mcp.json", ".mcp.json"):
    path = root / name
    if not path.exists():
        continue
    data = json.loads(path.read_text())
    servers = data.setdefault("mcpServers", {})
    servers["ecartpay-api"] = {"type": "http", "url": url}
    path.write_text(json.dumps(data, indent=2) + "\n")
PY
fi

echo "Installed Local plugin at ${target_dir}"
if [[ "${local_mcp}" -eq 1 ]]; then
  echo "ecartpay-api → ${mcp_url} (this copy only; repo still points at mcp.ecartpay.com)"
  echo "Start the MCP HTTP server before Reload Window (see script output after this)."
else
  echo "ecartpay-api → https://mcp.ecartpay.com/mcp"
fi
echo "Next: Developer: Reload Window"
echo "Note: Local installs often show the generic blue-book icon."
echo "      Verify the green e logo via Team Marketplace (see docs/marketplace-submission.md)."
