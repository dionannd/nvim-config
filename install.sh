#!/bin/bash

warnnvim() {
  echo "Neovim not found, please install it"
  exit
}

warnnode() {
  echo "Node not found, please install it"
  exit
}

warngit() {
  echo "Git not found, please install it"
  exit
}

changedirname() {
  mv $HOME/.config/nvim $HOME/.config/nvim_backup
  echo "Your existing nvim config has been moving to nvim_backup"
  clonerepo
}

clonerepo() {
  echo "Cloning repo to your nvim directory..."
  git clone https://github.com/dionannd/neovim-config.git ~/.config/nvim
  nvim +PackerSync
}

which nvim >/dev/null && echo "Neovim is installed" || warnnvim
which node >/dev/null && echo "Node is installed" || warnnode
which git >/dev/null && echo "Git is installed" || warngit

[ -d "$HOME/.config/nvim" ] && changedirname || clonerepo
