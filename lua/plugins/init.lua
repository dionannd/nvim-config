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

-- Autocommand that reloads neovim whenever you save the plugins file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins/init.lua source <afile> | PackerSync
  augroup end
]]

local packer = require('packer')

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function ()
     return require("packer.util").float { border = "rounded" }
    end,
  }
}

-- Install plugins
return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used any lots of plugins
  use {
    'windwp/nvim-autopairs',
    config = "require('autopairs-config')",
    after = "nvim-cmp"
  }
  use {
    "terrortylor/nvim-comment",
    config = "require('comment-config')"
  }
  use 'kyazdani42/nvim-web-devicons'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = "NvimTreeToggle",
    config = "require('nvim-tree-config')"
  }
  use "moll/vim-bbye"
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    event = "BufWinEnter",
    config = "require('bufferline-config')"
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    event = "BufWinEnter",
    config = "require('lualine-config')"
  }
  use {
    "akinsho/toggleterm.nvim",
    config = "require('toggleterm-config')"
  }
  use {
    'glepnir/dashboard-nvim',
    event = "BufRead",
    config = "require('dashboard-config')"
  }
  use "antoinemadec/FixCursorHold.nvim"
  use {
    'folke/which-key.nvim',
    event = "BufWinEnter",
    config = "require('whichkey-config')"
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = "require('blankline-config')",
    event = "BufRead"
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = "require('colorizer-config')",
    event = "BufRead"
  }
  use {
    "ahmedkhalf/project.nvim",
    config = "require('project-config')"
  }
  use {
    "lewis6991/impatient.nvim",
    config = "require('impatient-config')"
  } -- Speed up loading lua modules

  -- Colorschemes
  use {
    'folke/tokyonight.nvim',
    config = "require('tokyonight-config')"
  }

  -- cmp plugins
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use "hrsh7th/cmp-path" -- path completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use {'neovim/nvim-lspconfig', config = "require('lsp')"} -- enable LSP
  use {'williamboman/nvim-lsp-installer'} -- simple to use language server installer
  use {'jose-elias-alvarez/null-ls.nvim', config = "require('null-ls-config')"} -- for formatting and linters
  use {'onsails/lspkind-nvim'}
  use {'tami5/lspsaga.nvim', config = "require('lspsaga-config')"}

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    cmd = "Telescope",
    config = "require('telescope-config')"
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    event = "BufWinEnter",
    config = "require('treesitter-config')"
  }
  use {'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter"}
  use {'p00f/nvim-ts-rainbow', after = "nvim-treesitter"}
  
  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = "require('gitsign-config')"
  }
  
  -- Zen Mode and Twilight
  use {"folke/zen-mode.nvim", config = 'require("zen-mode-config")'}
  use {"folke/twilight.nvim", config = "require('twilight-config')"}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
