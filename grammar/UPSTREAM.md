# Zed

Zed does not load the grammar's upstream query files, and it cannot build the
grammar from `extensions/tree-sitter-salam`, because that directory does not
commit the generated `src/parser.c`. This extension therefore vendors the
grammar (generated with `tree-sitter generate` from upstream `grammar.js`) and
points `[grammars.salam]` at itself.

Grammar source: https://github.com/SalamLang/Salam/tree/main/extensions/tree-sitter-salam

## Local fix: `type_alias`

A type may own methods (`type Meters: int`, then `func` definitions, then `end`).
Upstream marks the alias `prec.right`, which forced the optional method body to
be taken whenever a function followed the alias. A plain alias followed by a
top-level function therefore parsed as a body and asked for a second `end`
(`MISSING "end"` at end of file), and every later declaration landed inside the
alias.

The body is now an unresolved conflict (`conflicts` lists `[$.type_alias]`) with
`prec.right` removed, so the parser keeps the error-free parse: the body when
its closing `end` exists, a separate function otherwise. Regenerating from
upstream `grammar.js` reintroduces the bug — re-apply this before committing
new generated files.
