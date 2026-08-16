#!/usr/bin/env bash

## Author : Dian Ananda (dionannd)
## Github : @dionannd
##
## Neovim Configuration Installer
##
## Requirements:
## - Neovim >= 0.9.0
## - Git >= 2.19.0
## - C compiler
## - ripgrep
## - fd
##
## Optional:
## - Nerd Font
## - Lazygit

set -euo pipefail

## Colors ----------------------------

Color_Off='\033[0m'

BBlack='\033[1;30m'
BRed='\033[1;31m'
BGreen='\033[1;32m'
BYellow='\033[1;33m'
BBlue='\033[1;34m'
BPurple='\033[1;35m'
BCyan='\033[1;36m'
BWhite='\033[1;37m'


## Configuration ----------------------------

NVIM_DIR="$HOME/.config/nvim"
REPO_URL="https://github.com/dionannd/nvim-config.git"


## Helpers ----------------------------

info() {
  echo -e "${BBlue}[*]${Color_Off} $1"
}

success() {
  echo -e "${BGreen}[✓]${Color_Off} $1"
}

warning() {
  echo -e "${BYellow}[!]${Color_Off} $1"
}

error() {
  echo -e "${BRed}[✗]${Color_Off} $1"
}

dry_run() {
  echo -e "${BCyan}[DRY-RUN]${Color_Off} $1"
}

die() {
  error "$1"
  exit 1
}


## Dependency Checks ----------------------------

check_command() {
  local command_name="$1"
  local package_name="${2:-$1}"

  if command -v "$command_name" >/dev/null 2>&1; then
    success "${package_name} is installed."
  else
    die "${package_name} is not installed."
  fi
}


check_optional_command() {
  local command_name="$1"
  local package_name="${2:-$1}"

  if command -v "$command_name" >/dev/null 2>&1; then
    success "${package_name} is installed."
  else
    warning "${package_name} is not installed (optional)."
  fi
}


check_nvim_version() {
  if ! command -v nvim >/dev/null 2>&1; then
    die "Neovim is not installed."
  fi

  local version
  version="$(nvim --version | head -n 1 | sed 's/^NVIM v//')"

  if [[ -z "$version" ]]; then
    die "Unable to determine Neovim version."
  fi

  local major
  local minor

  major="${version%%.*}"
  minor="${version#*.}"
  minor="${minor%%.*}"

  if (( major > 0 || (major == 0 && minor >= 9) )); then
    success "Neovim ${version} is installed."
  else
    die "Neovim ${version} is too old. Neovim >= 0.9.0 is required."
  fi
}

check_nvim_luajit() {
  local luajit_version

  luajit_version="$(
    nvim --headless --clean \
      +'lua print(jit.version)' \
      +qa 2>/dev/null || true
  )"

  if [[ "$luajit_version" == LuaJIT* ]]; then
    success "Neovim is built with ${luajit_version}."
  else
    warning "Neovim is not using LuaJIT (optional)."
  fi
}


check_git_version() {
  if ! command -v git >/dev/null 2>&1; then
    die "Git is not installed."
  fi

  local version
  version="$(git --version | sed 's/git version //')"

  local major
  local minor

  major="${version%%.*}"
  minor="${version#*.}"
  minor="${minor%%.*}"

  if (( major > 2 || (major == 2 && minor >= 19) )); then
    success "Git ${version} is installed."
  else
    die "Git ${version} is too old. Git >= 2.19.0 is required."
  fi
}


check_dependencies() {
  echo
  info "Checking required dependencies..."
  echo

  check_nvim_version
  check_git_version
  check_command "cc" "C compiler"
  check_command "rg" "ripgrep"
  check_command "fd" "fd"

  echo
  info "Checking optional dependencies..."
  echo

  check_nvim_luajit
  check_optional_command "lazygit" "Lazygit"

  warning "Nerd Font is recommended for proper icon rendering."
  warning "Make sure your terminal is configured with a Nerd Font v3+."
}


## Backup Existing Config ----------------------------

backup_existing_config() {
  if [[ ! -d "$NVIM_DIR" ]]; then
    info "No existing Neovim configuration found."
    return
  fi

  local backup_dir
  backup_dir="${NVIM_DIR}.backup.$(date +%Y%m%d%H%M%S)"

  if [[ "${DRY_RUN:-false}" == "true" ]]; then
    dry_run "Would backup:"
    dry_run "  ${NVIM_DIR}"
    dry_run "to:"
    dry_run "  ${backup_dir}"
    return
  fi

  info "Existing Neovim configuration found."
  info "Creating backup: ${backup_dir}"

  mv "$NVIM_DIR" "$backup_dir"

  success "Existing configuration backed up."
}


## Install Configuration ----------------------------

install_config() {
  if [[ "${DRY_RUN:-false}" == "true" ]]; then
    dry_run "Would clone:"
    dry_run "  ${REPO_URL}"
    dry_run "to:"
    dry_run "  ${NVIM_DIR}"
    return
  fi

  info "Installing Neovim configuration..."

  mkdir -p "$(dirname "$NVIM_DIR")"

  git clone "$REPO_URL" "$NVIM_DIR"

  if [[ -f "$NVIM_DIR/init.lua" ]]; then
    success "Neovim configuration installed successfully."
  else
    die "Configuration installation failed: init.lua not found."
  fi
}


## Verify Configuration ----------------------------

verify_config() {
  if [[ "${DRY_RUN:-false}" == "true" ]]; then
    dry_run "Would verify:"
    dry_run "  ${NVIM_DIR}/init.lua"
    return
  fi

  echo
  info "Verifying Neovim configuration..."
  echo

  if [[ ! -f "$NVIM_DIR/init.lua" ]]; then
    die "init.lua not found."
  fi

  success "init.lua found."

  if [[ -f "$NVIM_DIR/lazy-lock.json" ]]; then
    success "lazy-lock.json found."
  else
    warning "lazy-lock.json not found."
  fi
}


## Dry Run ----------------------------

run_dry_run() {
  DRY_RUN="true"

  echo
  echo -e "${BCyan}========================================${Color_Off}"
  echo -e "${BCyan}      Neovim Installer - Dry Run       ${Color_Off}"
  echo -e "${BCyan}========================================${Color_Off}"
  echo

  info "No files will be modified."
  info "No configuration will be installed."
  echo

  check_dependencies

  echo
  info "Simulating installation..."
  echo

  backup_existing_config
  install_config
  verify_config

  echo
  echo -e "${BGreen}========================================${Color_Off}"
  echo -e "${BGreen}          Dry Run Completed!            ${Color_Off}"
  echo -e "${BGreen}========================================${Color_Off}"
  echo

  success "No changes were made to your system."
}


## Normal Installation ----------------------------

run_install() {
  DRY_RUN="false"

  echo
  echo -e "${BPurple}========================================${Color_Off}"
  echo -e "${BPurple}     Neovim Configuration Installer     ${Color_Off}"
  echo -e "${BPurple}========================================${Color_Off}"
  echo

  check_dependencies

  echo
  info "Preparing installation..."
  echo

  backup_existing_config
  install_config
  verify_config

  echo
  echo -e "${BGreen}========================================${Color_Off}"
  echo -e "${BGreen}       Installation Completed!          ${Color_Off}"
  echo -e "${BGreen}========================================${Color_Off}"
  echo

  info "Starting Neovim..."
  echo

  nvim
}


## Main ----------------------------

main() {
  case "${1:-}" in
    --dry-run)
      run_dry_run
      ;;

    --check)
      info "Checking dependencies only..."
      check_dependencies
      ;;

    "")
      run_install
      ;;

    *)
      error "Unknown option: $1"
      echo
      echo "Usage:"
      echo "  ./install.sh            Install configuration"
      echo "  ./install.sh --check    Check dependencies only"
      echo "  ./install.sh --dry-run  Simulate installation"
      exit 1
      ;;
  esac
}


main "$@"
