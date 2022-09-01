local keymap = vim.keymap

-- Do not yank
keymap.set('n', 'x', '"_x')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Mode
keymap.set('i', 'jj', '<ESC>', { noremap = true, silent = true })

-- Arrow keys
-- keymap.set('i', '<C-k>', '<Up>', { noremap = true })
-- keymap.set('i', '<C-j>', '<Down>', { noremap = true })
keymap.set('i', '<C-h>', '<Left>', { noremap = true })
keymap.set('i', '<C-l>', '<Right>', { noremap = true })

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Move text
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')
keymap.set('v', 'J', ":move '>+1<CR>gv-gv")
keymap.set('v', 'K', ":move '<-2<CR>gv-gv")

-- New tab
keymap.set('n', 'te', ':tabedit<CR>')

-- Split tab
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
