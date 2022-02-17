local opts = { noremap = true, silent = false }
local opt = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = " "

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", opt)
map("v", "<A-k>", ":m .-2<CR>==", opt)
map("v", "p", '"_dP', opt)

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

map('i', 'jk', '<ESC>', opt)
map('i', 'kj', '<ESC>', opt)
map('i', 'jj', '<ESC>', opt)
map('i', 'kl', '<ESC>', opt)

map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

map('n', '<leader>e', ':NvimTreeToggle<CR>', opt)

map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", opt)
map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", opt)
