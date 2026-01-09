#!/usr/bin/env zsh
#
# Login-shell environment shared across machines.  This file is safe to symlink into
# `~/.zprofile`; runtime-specific tweaks belong in `~/.zprofile.local` or
# `~/.zshrc.local`, not under version control.

# Determine the dotfiles root if not exported by the caller.
DOTFILES="${DOTFILES:-${ZDOTDIR:-$HOME}/git/github.com/dotfiles}"
export DOTFILES

# Customize oh-my-zsh and SDK managers.
ZSH="${ZSH:-$HOME/.oh-my-zsh}"
export ZSH

ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"
export ZSH_CUSTOM

SDKMAN_DIR="${SDKMAN_DIR:-$HOME/.sdkman}"
export SDKMAN_DIR

NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
export NVM_DIR

GOPATH="${GOPATH:-$HOME/go}"
export GOPATH

VISUAL="${VISUAL:-vim}"
SVN_EDITOR="${SVN_EDITOR:-vim}"
EDITOR="${EDITOR:-vim}"
export VISUAL SVN_EDITOR EDITOR

SHELLCHECK_OPTS="${SHELLCHECK_OPTS:--e SC2086}"
export SHELLCHECK_OPTS

# Ensure Homebrew-managed tools are in PATH early on macOS.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# PATH helpers
path_unshift() {
  local dir="$1"
  if [[ -n "$dir" && -d "$dir" && ":$PATH:" != *":$dir:"* ]]; then
    PATH="$dir:$PATH"
  fi
}

# PATH entries shared across machines (order matters; earlier entries win).
path_unshift "$HOME/bin"
path_unshift "$HOME/bin/ffmpeg-scripts"
path_unshift "$HOME/.local/bin"
path_unshift "$HOME/.cargo/bin"
path_unshift "$HOME/.dotnet/tools"
path_unshift "$HOME/.lmstudio/bin"
path_unshift "$HOME/.npm/.bin"
path_unshift "$HOME/.pilau/lemonbar"
path_unshift "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
path_unshift "$NVM_DIR/bin"

MANPATH="$HOME/.local/share/man:$MANPATH"
export MANPATH

# Allow hosts to define local overrides without touching the shared dotfiles.
local_profile="${ZDOTDIR:-$HOME}/.zprofile.local"
dotfiles_profile="$DOTFILES/zprofile.local"
[[ -f "$local_profile" ]] && source "$local_profile"
[[ -f "$dotfiles_profile" ]] && source "$dotfiles_profile"
