local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand reload modif plugins
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Manage plugins here
return packer.startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "rcarriga/nvim-notify"
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use "folke/todo-comments.nvim"
  use "antoinemadec/FixCursorHold.nvim"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use 'hoob3rt/lualine.nvim'
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"

  -- Colorschemes
  use 'folke/tokyonight.nvim'
  use 'rose-pine/neovim'
  use "projekt0n/github-nvim-theme"
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })

  -- cmp plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "tamago324/nlsp-settings.nvim"
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatting and linters

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use "nvim-telescope/telescope-media-files.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  }
  use 'windwp/nvim-ts-autotag'
  use 'p00f/nvim-ts-rainbow'
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "romgrk/nvim-treesitter-context"
  use "nvim-treesitter/playground"

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use "ruifm/gitlinker.nvim"
  use "mattn/webapi-vim"
  use "https://github.com/rhysd/conflict-marker.vim"

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
