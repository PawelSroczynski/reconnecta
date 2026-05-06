#!/usr/bin/env bash
# Reconnecta — example deploy script
# Edit the three variables below for your host, then run.

set -euo pipefail

# 1. Where the source lives (this repo's landing/ directory)
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")/../landing" && pwd)"

# 2. Where to copy it on your server
#    Examples:
#      DST_USER=root@reconnecta.world:/var/www/reconnecta
#      DST_USER=/var/www/reconnecta            (local server)
DST="/var/www/reconnecta"

# 3. URL to verify after the upload
URL="https://reconnecta.world/"

# ---

if [[ ! -d "$SRC" ]]; then
  echo "✗ landing/ missing at $SRC" >&2
  exit 1
fi

echo "→ deploying $SRC/  →  $DST/"

# Local copy (uncomment for local server)
sudo mkdir -p "$DST"
sudo rsync -a --delete --exclude='.*' "$SRC"/ "$DST"/

# Remote copy (uncomment & adjust for ssh-based deploy)
# rsync -avz --delete --exclude='.*' "$SRC"/ "$DST"/

echo "→ verifying $URL"
CODE=$(curl -s -o /dev/null -w "%{http_code}" -L "$URL" || echo "000")

if [[ "$CODE" == "200" ]]; then
  echo "✓ HTTP 200 — live"
else
  echo "✗ HTTP $CODE — check nginx, DNS, firewall" >&2
  exit 2
fi
