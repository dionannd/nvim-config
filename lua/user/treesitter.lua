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
    disable = {"css"},
    additional_vim_regex_highlighting = true
  },
  autotag = {
    enable = true,
    disable = { "xml" },
  },
  rainbow = {
    enable = true,
    colors = {
      "Gold",
      "Orchid",
      "DodgerBlue"
    },
    disable = {"html"}
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
