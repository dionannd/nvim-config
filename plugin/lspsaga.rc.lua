local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Lsp finder
keymap('n', 'gd', '<cmd>Lspsaga lsp_finder<CR>', opts)

-- Code actions
keymap('n', 'ga', '<cmd>Lspsaga code_action<CR>', { silent = true })
keymap('v', 'ga', '<cmd><C-U>Lspsaga range_code_action<CR>', { silent = true })

-- Rename
keymap('n', 'gr', '<cmd>Lspsaga rename<CR>', opts)

-- Definition preview
keymap('n', 'gp', '<cmd>Lspsaga preview_definition<CR>', opts)

-- Show cursor diagnotics
keymap('n', 'gA', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
keymap('n', 'gA', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)

-- Diagnotic jump
keymap('n', '<C-p>', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
keymap('n', '<C-n>', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)

-- Hover doc
keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)

