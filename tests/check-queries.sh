#!/bin/sh
# Fails if a grammar change breaks the sample parse, or if any query under
# languages/salam/ stops compiling or matching. Run from the repo root.
set -eu
cd "$(dirname "$0")/.."
ts="npx --yes tree-sitter-cli@0.25.10" # same version that generated src/parser.c

cd grammar
$ts parse --quiet ../tests/sample.salam

for query in ../languages/salam/*.scm; do
  out=$($ts query "$query" ../tests/sample.salam)
  matches=$(printf '%s\n' "$out" | grep -c 'capture:' || true)
  [ "$matches" -gt 0 ] || { echo "$query: no matches"; exit 1; }
  echo "$query: $matches matches"
done
