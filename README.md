<h2 align="center"> Neovim Setup </h2>

<h6 align="center"> Configuration Neovim IDE with Lua config </h6>
  
<div align="center">

[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.7+-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)](https://github.com/neovim/neovim)
  <a href="https://github.com/dionannd/nvim-config"
        ><img
            src="https://img.shields.io/github/repo-size/dionannd/nvim-config?style=flat-square&label=Repo"
            alt="GitHub repository size"
    /></a>
    <a href="https://github.com/dionannd/nvim-config/blob/main/LICENSE">
        <img src="https://img.shields.io/github/license/dionannd/nvim-config?style=flat-square&logo=GNU&label=License" alt="LICENSE"
      />
    <a href="https://github.com/dionannd/nvim-config/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/dionannd/nvim-config?style=flat-square&label=Last Commit"/>
    </a>
    <a href="https://www.codefactor.io/repository/github/dionannd/nvim-config">
      <img src="https://www.codefactor.io/repository/github/dionannd/nvim-config/badge" alt="CodeFactor" />
    </a>
</div>

### ✨ Features
- Easy use and configuration
- Minimalias and clean
- Extensible package management system
- Beautiful syntax highlighting with treesitter
- Language support and Code Autocompletion
- Autoformatting
- Efficient file navigation
- Awesome user configuration system

### ⚙️ Requirements
- [Neovim](https://neovim.io/) >= v0.7 or [Nightly](https://github.com/neovim/neovim/releases/tag/nightly)
- Git (cloning repo from github)
- [Lazygit](https://github.com/jesseduffield/lazygit) (optional for git integration)
- [Nerd font](https://www.nerdfonts.com/) (icon ligatures support)
- [Ripgrep](https://github.com/BurntSushi/ripgrep) is required for `live_grap` and `grep_string`

### ⚒️  Language recommend
- Node & npm
- Python3
- Typescript
- Sumneko Lua

### 🚀 Try this config

You can install automatically with `cloning repo` and then,run:
```
./install.sh
```
or you can install manual, follow the step in below:

Make sure to remove or move your current `nvim` directory, 
if done run in termninal :

```
git clone https://github.com/dionannd/nvim-config.git ~/.config/nvim
nvim +PackerSync
```

### 🎣 Get healthy

Open `nvim` and run
```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup <br />
So let's fix that <br />

Next we need to install python support (node is optional)
- Neovim python support
  
  ```bash
  pip install pynvim
  ```
- Neovim node support
  
  ```bash
  npm i -g neovim
  ```

### 🗨️ Install Language support

- Enter `:LspInstall` followed by `<TAB>` to see your options for LSP

- Enter `:TSInstall` followed by `<TAB>` to see your options for syntax highlighting

**NOTE:** <br />
I recommend installing `lua` for autocomplete lua file, and `prettier` install global with `npm i -g prettier`

### 🔥 Update the plugins

Enter `nvim`, run `:PackerUpdate` or `<space> + p + u`
