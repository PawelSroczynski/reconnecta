#!/usr/bin/env bash
# Reconnecta — rebuild the downloadable PDF from landing/index.html
#
# Requires WeasyPrint:
#   sudo apt install weasyprint     # Debian/Ubuntu
#   pip install weasyprint          # any Python env
#   brew install weasyprint         # macOS
#
# Output: landing/reconnecta-whitepaper.pdf

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/landing/index.html"
OUT="$ROOT/landing/reconnecta-whitepaper.pdf"

if ! command -v weasyprint >/dev/null 2>&1; then
  echo "✗ weasyprint not installed — see this script's header for install commands" >&2
  exit 1
fi

if [[ ! -f "$SRC" ]]; then
  echo "✗ source not found: $SRC" >&2
  exit 2
fi

echo "→ rendering $SRC  →  $OUT"
weasyprint -m print -p "$SRC" "$OUT" 2>&1 | grep -v "^WARNING" || true

if [[ -f "$OUT" ]]; then
  SIZE=$(du -h "$OUT" | cut -f1)
  echo "✓ wrote $OUT ($SIZE)"
else
  echo "✗ PDF was not produced" >&2
  exit 3
fi
