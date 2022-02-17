local bufferline = require("bufferline")

bufferline.setup {
  options = {
    numbers = "none",
    close_command = "Bdelete! %d",
    tab_size = 21,
    diagnostics = false, -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  }
}

vim.cmd [[
  nnoremap <silent><TAB> :BufferLineCycleNext<CR>
  nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
]]
