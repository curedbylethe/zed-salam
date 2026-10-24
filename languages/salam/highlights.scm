; Salam highlights for Zed.
; Generated from extensions/tree-sitter-salam/queries/highlights.scm; only the
; capture names differ, because Zed does not resolve @character, @module,
; @number.float, @variable.builtin or @tag.attribute.

(line_comment) @comment
(block_comment) @comment

(string) @string
(raw_string) @string
(text_block) @string
(escape_sequence) @string.escape
(char) @string.special
(integer) @number
(float) @number
(dimension) @number
(boolean) @boolean
(null) @constant.builtin
(this) @variable.special

(meta) @attribute

(import_declaration path: (import_path) @namespace)
(import_declaration alias: (name) @namespace)
(include_declaration alias: (name) @namespace)
(package_declaration name: (dotted_name) @namespace)

(function_definition name: (name) @function)
(function_definition name: (operator_name) @operator)
(function_signature name: (name) @function)
(call_expression function: (name) @function.call)
(call_expression function: (member_expression member: (member_name) @function.method.call))

(struct_definition name: (name) @type)
(interface_definition name: (name) @type)
(enum_definition name: (name) @type)
(type_alias name: (name) @type)
(component_definition name: (name) @type)
(type_name (dotted_name) @type)
(type_name (dotted_name (name) @type.builtin (#any-of? @type.builtin "void" "bool" "char" "str" "uchar" "i8" "i16" "i32" "int" "i64" "u8" "u16" "u32" "uint" "u64" "usize" "size" "f32" "float" "f64" "تهی" "منطقی" "نویسه" "رشته" "یونیکد" "صحیح۸" "صحیح۱۶" "صحیح۳۲" "صحیح" "صحیح۶۴" "صحیح8" "صحیح16" "صحیح32" "صحیح64" "طبیعی۸" "طبیعی۱۶" "طبیعی۳۲" "طبیعی" "طبیعی۶۴" "طبیعی8" "طبیعی16" "طبیعی32" "طبیعی64" "اندازه مثبت" "اندازه" "اعشار۳۲" "اعشار" "اعشار۶۴" "اعشار32" "اعشار64" "وکتور" "Vector" "نگاشت" "HashMap" "پیمایشگرنگاشت" "MapIter" "پرونده" "File" "گوناگون" "Variant")))
(struct_literal type: (type_name) @type)
(type_parameters (name) @type)

(parameter name: (name) @variable.parameter)
(field_declaration name: (name) @property)
(field_initializer name: (name) @property)
(member_expression member: (member_name) @property)
(named_argument name: (name) @variable.parameter)
(enum_member name: (name) @constant)

(layout_element tag: (layout_name) @tag)
(layout_attribute name: (layout_name) @attribute)

["func" "تابع"] @keyword
["ret" "برگشت"] @keyword.control
["if" "اگر" "else" "وگرنه" "match" "همخوان" "switch" "ترابرد"] @keyword.control
["until" "تا" "each" "هر" "repeat" "تکرار" "to" "by" "in" "در" "break" "بشکن" "continue" "گذر"] @keyword.control
["import" "واردسازی" "include" "فراخوانی" "package" "بسته"] @keyword
["mut" "ناپایا" "const" "پایا" "pub" "همگانی" "inline" "درخط" "noinline" "نادرخط" "pure" "ناب" "noret" "نابرگشت" "deprecated" "بی‌کاره" "extern" "درون‌داد" "export" "برون‌داد" "static" "ایستا"] @keyword
["struct" "ساختار" "enum" "جداشمار" "interface" "میانجی" "type" "گونه" "impl" "کاربست" "on" "بر" "page" "component" "dyn" "use" "شامل"] @keyword
["end" "پایان" "defer" "دیرکن" "as" "برگردان"] @keyword
["and" "و" "or" "یا" "not" "وارونه" "eq" "برابر" "neq" "نابرابر" "lt" "کوچکتر" "gt" "بزرگتر" "lte" "کوچکتربرابر" "gte" "بزرگتربرابر"] @keyword.operator
["print" "چاپ" "println" "سرچاپ" "printerr" "نادرست‌چاپ" "printerrln" "نادرست‌سرچاپ" "input" "ورودی"] @function.special

["+" "-" "*" "/" "%" "**" "^^" "==" "!=" "<" ">" "<=" ">=" "&&" "||" "!" "~" "&" "|" "^" "<<" ">>" "=" ":=" "+=" "-=" "*=" "/=" "%=" "^^=" "**=" "&=" "|=" "^=" "<<=" ">>=" "++" "--" "?"] @operator

["(" ")" "[" "]" "{" "}"] @punctuation.bracket
["," "." ":"] @punctuation.delimiter
