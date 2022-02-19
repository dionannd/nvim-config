local options = {
  completeopt = { "menuone", "noselect"},
  pumheight = 10,
  fileencoding = 'utf-8',
  cmdheight = 2,
  splitbelow = true,
  splitright = true,
  -- termguicolors = true,
  conceallevel = 0,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  showmode = false,
  swapfile = false,
  backup = false,
  writebackup = false,
  updatetime = 300,
  timeoutlen = 1000,
  undofile = true,
  clipboard = "unnamedplus",
  hlsearch = true,
  ignorecase = true,
  scrolloff = 8,
  sidescrolloff = 8,
  mouse = "a",
  wrap = false,
  number = true,
  relativenumber = false,
  cursorline = true,
  signcolumn = "yes",
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  autoindent = true,
  expandtab = true,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
