# Zed

Zed does not load the grammar's upstream query files, and it cannot build the
grammar from `extensions/tree-sitter-salam`, because that directory does not
commit the generated `src/parser.c`. This extension therefore vendors the
grammar (generated with `tree-sitter generate` from upstream `grammar.js`) and
points `[grammars.salam]` at itself.

Grammar source: https://github.com/SalamLang/Salam/tree/main/extensions/tree-sitter-salam
