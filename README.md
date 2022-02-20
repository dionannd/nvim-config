## NFS (Neovim From Scratch)
⚡ Configuration Neovim IDE with Lua config ⚡

<div align="left"><p>
    <a href="https://github.com/dionannd/nfs/releases/latest">
      <img alt="Latest release" src="https://img.shields.io/github/v/release/dionannd/nfs" />
    </a>
    <a href="https://github.com/dionannd/nfs/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/dionannd/nfs"/>
    </a>
    <a href="https://github.com/dionannd/nfs/blob/main/LICENSE">
        <img src="https://img.shields.io/github/license/dionannd/nfs?style=flat-square&logo=GNU&label=license" alt="LICENSE"
      />
</p>
</div>

### ✨ Features
- Easy use and configuration
- Minimalias and clean
- Extensible package management system
- Beautiful syntax highlighting with treesitter
- Language support and Code Autocompletion
- Autoformatting
- Terminal integration
- Efficient file navigation
- Awesome user configuration system

### ⚙️ Requirements
- [Neovim](https://neovim.io/) >= v0.6.1 or [Nightly](https://github.com/neovim/neovim/releases/tag/nightly).
- Git (cloning repo from github)
- [Lazygit](https://github.com/jesseduffield/lazygit) (optional for git integration)
- [RipGrep](https://github.com/BurntSushi/ripgrep) (optional for telescope ripgrep)
- [Nerd font](https://www.nerdfonts.com/) (icon ligatures support)

### ⚒️  Language recommend
- Node & npm
- Python
- Go >= 1.17
- Ruby (optional)
- Composer (optional)
- Julia (optional)
- Powershell (optional)

### 🚀 Try this config

You can install automatically with `cloning repo` and then,run:
```
./install.sh
```
or you can install manual, follow the step in below:

Make sure to remove or move your current `nvim` directory, 
if done run in termninal :

```
git clone https://github.com/dionannd/nfs.git ~/.config/nvim
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

Enter nvim, run `:PackerUpdate` or `<space> + p + u`

### 💐 Thanks

<div align="left" id="madewithlua">
	
[![Lua](https://img.shields.io/badge/Made%20with%20Lua-blue.svg?style=for-the-badge&logo=lua)](#madewithlua)
	
</div>
