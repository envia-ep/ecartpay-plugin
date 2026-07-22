#!/usr/bin/env bash
# Copy the Cursor plugin into ~/.cursor/plugins/local for this machine only.
# Do NOT use Customize → + Add → From Local Repo on the parent marketplace folder
# (ecartpay-plugin) — that often toasts "added" without showing under Installed.
# Prefer this script, then Developer: Reload Window.
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
source_dir="${repo_root}/plugins/ecart-pay"
target_dir="${HOME}/.cursor/plugins/local/ecart-pay"

if [[ ! -f "${source_dir}/.cursor-plugin/plugin.json" ]]; then
  echo "error: missing ${source_dir}/.cursor-plugin/plugin.json" >&2
  exit 1
fi

mkdir -p "${HOME}/.cursor/plugins/local"
rm -rf "${target_dir}"
cp -R "${source_dir}" "${target_dir}"

echo "Installed Local plugin at ${target_dir}"
echo "Next: Developer: Reload Window"
echo "Note: Local installs often show the generic blue-book icon."
echo "      Verify the green e logo via Team Marketplace (see docs/marketplace-submission.md)."
