[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.7+-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)](https://github.com/neovim/neovim)
<a href="https://github.com/dionannd/nvim-config">
<img src="https://img.shields.io/github/repo-size/dionannd/nvim-config?style=flat-square&label=Repo" alt="GitHub repository size"
/></a>
<a href="https://github.com/dionannd/nvim-config/pulse">
<img alt="Last commit" src="https://img.shields.io/github/last-commit/dionannd/nvim-config?style=flat-square&label=Last Commit"/>
</a>
<a href="https://www.codefactor.io/repository/github/dionannd/nvim-config">
<img src="https://www.codefactor.io/repository/github/dionannd/nvim-config/badge" alt="CodeFactor" />
</a>
<a href="https://github.com/dionannd/nvim-config/blob/main/LICENSE">
<img src="https://img.shields.io/github/license/dionannd/nvim-config?style=flat-square&logo=GNU&label=License" alt="LICENSE"
/></a>

# Neovim Setup

Configuration Neovim IDE with Lua config

## Features

- Easy use and configuration
- Minimalias and clean
- Extensible package management system
- Beautiful syntax highlighting with treesitter
- Language support and Code Autocompletion
- Autoformatting
- Efficient file navigation
- Awesome user configuration system

## Requirements

- [Neovim](https://neovim.io/) >= **0.9.0** or [Nightly](https://github.com/neovim/neovim/releases/tag/nightly) (needs to be built with **LuaJIT**)
- [Git](https://github.com/git/git) >= **2.19.0** (for partial clones support)
- [LazyVim](https://www.lazyvim.org)
- a [Nerd Font](https://www.nerdfonts.com) (v3.0 or greater) _**(optional, but needed to display some icons)**_
- [Lazygit](https://github.com/jesseduffield/lazygit) _**(optional)**_
- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) _**(Optional)**_
  - live grep: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - find files: [fd](https://github.com/sharkdp/fd)
- a terminal that support true color and _undercurl:_
  - [alacritty](https://github.com/alacritty/alacritty) _**(Linux, macOS & Windows)**_
  - [iterm2](https://iterm2.com) _**(macOS)**_

## Quickstart

You can install automatically with `one command`,run:

```bash
wget https://raw.githubusercontent.com/dionannd/nvim-config/main/install.sh && chmod +x install.sh && ./install.sh
```

Or you can install manual, follow the step in below:

- Make sure to remove or move your current `nvim` directory:

  ```bash
  mv ~/.config/nvim ~/.config/nvim-backup
  ```

- run in terminal:

  ```bash
  git clone https://github.com/dionannd/nvim-config.git ~/.config/nvim
  nvim
  ```

- Start Neovim:

  ```bash
  nvim
  ```
