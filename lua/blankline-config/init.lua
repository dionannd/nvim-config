local blankline = require("indent_blankline")

blankline.setup {
  buftype_exclude = {"terminal", "nofile"},
  filetype_exclude = {"help","dashboard", "NvimTree", "packer", "lsp-installer", "neogitstatus", "Trouble"},
  char = "▏",
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  show_current_context = true,
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type"
  }
}
