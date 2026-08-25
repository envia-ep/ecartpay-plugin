#!/usr/bin/env bash
# Install the local Cursor plugin pointed at a local MCP HTTP server, then print
# the remaining manual Authenticate steps. Does not start the server (needs your
# OAuth app client_id / client_secret).
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
mcp_dir="${ECARTPAY_MCP_DIR:-${repo_root}/../payments/ecart-payment/mcp}"
port="${MCP_HTTP_PORT:-8080}"
public_url="${MCP_PUBLIC_URL:-http://127.0.0.1:${port}}"
callback="${public_url}/oauth/ecartpay/callback"

"${repo_root}/scripts/install-local.sh" --local-mcp

cat <<EOF

=== Manual Authenticate (local) ===

1) Create a production OAuth app ONCE (dashboard JWT with write_oauth_applications).
   redirect_url must match exactly:

     ${callback}

   Example:

     curl -X POST "https://ecartpay.com/api/oauth/applications" \\
       -H "Authorization: <DASHBOARD_JWT>" \\
       -H "Content-Type: application/json" \\
       -d '{
         "name": "Ecart Pay Cursor MCP (local)",
         "description": "Local Authenticate for Cursor",
         "redirect_url": "${callback}",
         "scopes": ["read_orders","write_orders","read_orders_subscription","read_customers","write_customers","read_products","write_products","read_paylinks","write_paylinks","write_checkouts","read_subscriptions","write_subscriptions","read_single_subscription","read_subscriptions_template","write_subscriptions_template","read_billings","write_billings","read_chargebacks","write_chargebacks","read_transactions","read_whatsapp","write_whatsapp"]
       }'

   Save client_id and client_secret (secret is shown once).

2) Start the MCP HTTP server (leave this terminal open):

     cd "${mcp_dir}"
     export MCP_HTTP_PORT=${port}
     export MCP_HTTP_HOST=127.0.0.1
     export MCP_PUBLIC_URL=${public_url}
     export ECARTPAY_AUTH_BASE_URL=https://ecartpay.com
     export ECARTPAY_MCP_CLIENT_ID='<client_id from step 1>'
     export ECARTPAY_MCP_CLIENT_SECRET='<client_secret from step 1>'
     export ECARTPAY_MCP_REDIRECT_URI='${callback}'
     npx tsx src/http.ts

   You should see: Ecart Pay MCP listening on 127.0.0.1:${port}

3) In Cursor: Command Palette → "Developer: Reload Window"

4) Cursor Settings → Tools & MCP (or Plugins → Ecart Pay)
   - MCP "ecartpay" = docs (ReadMe). No Authenticate.
   - MCP "ecartpay-api" = ${public_url}/mcp → Needs authentication / Authenticate
   Click Authenticate (or the "Needs authentication" label).

5) Browser opens Ecart Pay login (accounts.ecart.com). Sign in as the merchant,
   consent, wait for redirect back to Cursor.

6) ecartpay-api should show tools. In chat: "usa ecartpay_session" or /setup-auth.

If Authenticate does nothing, Output panel → MCP:ecartpay-api and copy the
authorize URL into the browser.

EOF
