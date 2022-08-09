local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  query_linter = {
    enable = true,
    use_virtual_text = true,
    line_events = { "BufWrite", "CursorHold" },
  },
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = {""},
  autopairs = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = {"css"},
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
    disable = {},
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
	},
}
