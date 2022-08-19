#!/bin/bash

warn_nvim() {
  echo "Neovim not found, please install it"
  exit
}

warn_node() {
  echo "Node not found, please install it"
  exit
}

warn_git() {
  echo "Git not found, please install it"
  exit
}

change_dirname() {
  mv $HOME/.config/nvim $HOME/.config/nvim_backup
  echo "Your existing nvim config has been moving to nvim_backup"
  clone_repo
}

clone_repo() {
  echo "Cloning repo to your nvim directory..."
  git clone https://github.com/dionannd/nvim-config.git ~/.config/nvim
  nvim 
}

which nvim >/dev/null && echo "Neovim is installed" || warn_nvim
which node >/dev/null && echo "Node is installed" || warn_node
which git >/dev/null && echo "Git is installed" || warn_git

[ -d "$HOME/.config/nvim" ] && change_dirname || clone_repo
