#!/bin/sh
# Build index.html (a complete, standalone web page) from cv-primer.html.
# cv-primer.html is the source: edit that file, then run `sh build.sh`.
# It holds page content only (the claude.ai artifact publisher adds the
# document wrapper itself), so this script adds the wrapper for web hosting.
set -e
cd "$(dirname "$0")"
SRC=cv-primer.html
OUT=index.html
SITE="https://sunitathyagarajan.github.io/cyclic-voltammetry/"
DESC="Interactive pre-lab module on cyclic voltammetry: an introduction to electrochemical reactions, potentiometry and voltammetry, Nernst thermodynamics, reversible, quasi-reversible and irreversible electron transfer, two-electron transfers, concentration and scan-rate dependence, adsorbed versus diffusing species, and a 10-question plot-based quiz."
# Inline SVG favicon (a small voltammogram), so browsers don't request a missing favicon.ico.
ICON="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='7' fill='%231C5CAB'/%3E%3Cpath d='M4 17 C12 17 13 6 17 6 C21 6 21 13 28 13 M28 13 C21 13 21 26 16 26 C11 26 12 17 4 17' fill='none' stroke='white' stroke-width='2.4' stroke-linecap='round'/%3E%3C/svg%3E"

# Everything up to and including the first </style> belongs in <head>.
split=$(grep -n '^</style>' "$SRC" | head -n 1 | cut -d: -f1)
[ -n "$split" ] || { echo "build.sh: no </style> line found in $SRC" >&2; exit 1; }

{
  printf '%s\n' '<!doctype html>' '<html lang="en">' '<head>' \
    '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">' \
    "<meta name=\"description\" content=\"$DESC\">" \
    '<meta property="og:type" content="website">' \
    '<meta property="og:title" content="Cyclic Voltammetry Primer">' \
    "<meta property=\"og:description\" content=\"$DESC\">" \
    "<meta property=\"og:url\" content=\"$SITE\">" \
    "<link rel=\"canonical\" href=\"$SITE\">" \
    "<link rel=\"icon\" href=\"$ICON\">" \
    '<style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>'
  head -n "$split" "$SRC"
  printf '%s\n' '</head>' '<body>'
  tail -n "+$((split + 1))" "$SRC"
  printf '%s\n' '</body>' '</html>'
} > "$OUT"

echo "Wrote $OUT from $SRC"
