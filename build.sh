#!/bin/sh
# Build index.html (a complete, standalone web page) from cv-primer.html.
# cv-primer.html is the source: edit that file, then run `sh build.sh`.
# It holds page content only (the claude.ai artifact publisher adds the
# document wrapper itself), so this script adds the wrapper for web hosting.
set -e
cd "$(dirname "$0")"
SRC=cv-primer.html
OUT=index.html

# Everything up to and including the first </style> belongs in <head>.
split=$(grep -n '^</style>' "$SRC" | head -n 1 | cut -d: -f1)
[ -n "$split" ] || { echo "build.sh: no </style> line found in $SRC" >&2; exit 1; }

{
  printf '%s\n' '<!doctype html>' '<html lang="en">' '<head>' \
    '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">' \
    '<style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>'
  head -n "$split" "$SRC"
  printf '%s\n' '</head>' '<body>'
  tail -n "+$((split + 1))" "$SRC"
  printf '%s\n' '</body>' '</html>'
} > "$OUT"

echo "Wrote $OUT from $SRC"
