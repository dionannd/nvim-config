# NFS (Neovim From Scratch)
Configuration Neovim IDE with Lua config

<div align="center"><p>
    <a href="https://github.com/dionannd/nfs/releases/latest">
      <img alt="Latest release" src="https://img.shields.io/github/v/release/dionannd/nfs" />
    </a>
    <a href="https://github.com/dionannd/nfs/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/dionannd/nfs"/>
    </a>
    <a href="https://github.com/lunarvim/LunarVim/blob/main/LICENSE">
        <img src="https://img.shields.io/github/license/dionannd/nfs?style=flat-square&logo=GNU&label=License" alt="License"
      />
</p>
</div>

## Recruitments
- [Neovim](https://neovim.io/) >= v0.6.1 or [Nightly](https://github.com/neovim/neovim/releases/tag/nightly).
- [packer.nvim](https://github.com/wbthomason/packer.nvim#quickstart) (Plugin Manager)
- Git
- [Node](https://nodejs.org/en/) or Npm
- Python
- Ruby (optional)
- [Nerd font](https://www.nerdfonts.com/) (icon ligatures support)

## Try this config

Make sure to remove or move your current `nvim` directory

```
git clone https://github.com/dionannd/nfs.git ~/.config/nvim
```

Open `nvim` (if a have error, ignore please) and install plugin with
```
:PackerSync
```

## Get healthy

Open `nvim` and run
```
:checkhealth
```

## Install Language support

- Enter `:LspInstall` followed by `<TAB>` to see your options for LSP

- Enter `:TSInstall` followed by `<TAB>` to see your options for syntax highlighting

**NOTE** I recommend installing `lua` for autocomplete lua file

## Update the plugins

- inside nvim `:PackerUpdate` or
- inside nvim `<space> + p + u`

<br />

## Thanks

<div align="left" id="madewithlua">
	
[![Lua](https://img.shields.io/badge/Made%20with%20Lua-blue.svg?style=for-the-badge&logo=lua)](#madewithlua)
	
</div>
