#!/bin/bash

## Author : Dian Ananda (dionannd)
## Github : @dionannd
#
## Installer Script

## Colors ----------------------------
Color_Off='\033[0m'
BBlack='\033[1;30m' BRed='\033[1;31m'    BGreen='\033[1;32m' BYellow='\033[1;33m'
BBlue='\033[1;34m'  BPurple='\033[1;35m' BCyan='\033[1;36m'  BWhite='\033[1;37m'

## Directories ----------------------------
DIR=`pwd`
NVIM_DIR="$HOME/.config/nvim"

# Check Dep
warn_nvim() {
  echo -e ${BRed}"[!] Neovim not found, please install it." ${Color_Off}
  exit
}

pass_nvim() {
  echo -e ${BGreen}"[*] Neovim is Installed." ${Color_Off}
}

warn_node() {
  echo -e ${BRed}"[!] Node not found, please install it." ${Color_Off}
  exit
}

pass_node() {
  echo -e ${BGreen}"[*] Node is Installed." ${Color_Off}
}

warn_git() {
  echo -e ${BRed}"[!] Git not found, please install it." ${Color_Off}
  exit
}

pass_git() {
  echo -e ${BGreen}"[*] Git is Installed." ${Color_Off}
}

clone_repo() {
  git clone https://github.com/dionannd/nvim-config.git $HOME/.config/nvim
  if [[ -f "$NVIM_DIR/init.lua" ]]; then
		echo -e ${BGreen}"[*] Successfully Installed.\n" ${Color_Off}
	else
		echo -e ${BRed}"[!] Failed to install.\n" ${Color_Off}
		exit 1
	fi
}

install_config() {
  if [[ -d "$NVIM_DIR" ]]; then
    echo -e ${BPurple}"[*] Creating a backup of your nvim configs..." ${Color_Off}
    mv "$NVIM_DIR" "${NVIM_DIR}.${USER}"
  fi
  echo -e ${BBlue}"[*] Installing nvim configs..." ${Color_Off}
  clone_repo
}

main() {
  echo -e ${BYellow}"[*] Checking requirements dependencies...\n" ${Color_Off}
  which nvim >/dev/null && pass_nvim || warn_nvim
  which node >/dev/null && pass_node || warn_node
  which git >/dev/null && pass_git || warn_git
  install_config
}

main
nvim