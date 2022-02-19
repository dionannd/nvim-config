local configs = require("nvim-treesitter.configs")

configs.setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = {""},
  autopairs = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = false,
    additional_vim_regex_highlighting = true
  },
  autotag = {
    enable = true,
    disable = { "xml" },
  },
  rainbow = {
    enable = true,
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  indent = {
    enable = true,
    disable = { "yaml", "python", "css" }
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  playground = {
		enable = true,
	},
}
