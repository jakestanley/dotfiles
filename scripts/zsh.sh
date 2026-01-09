#!/usr/bin/env bash

if [[ "${ZSH}" == "" ]]; then
    echo "ZSH is not set. Exiting to stay safe"
    exit 1
fi

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

log() {
    printf '%s\n' "[zsh.sh] $1"
}

if [[ -e "$ZSH/custom" ]]; then
    log "Removing old $ZSH/custom"
    rm -rf "$ZSH/custom"
else
    log "$ZSH/custom did not exist"
fi

ln -s "$DOTFILES/oh-my-zsh/custom" "$ZSH/custom"
log "Linked $ZSH/custom -> $DOTFILES/oh-my-zsh/custom"

link_dotfile() {
    local file="$1"
    local dst="$HOME/.$file"
    local src="$DOTFILES/$file"

    [[ -e "$src" ]] || return

    if [[ -e "$dst" && ! -L "$dst" ]]; then
        mv "$dst" "$dst.bak"
        log "Moved existing $dst to $dst.bak"
    else
        rm -f "$dst"
    fi

    ln -s "$src" "$dst"
    log "Linked $dst -> $src"
}

link_dotfile "zprofile"
link_dotfile "zshrc"

# Verify shared helper files exist so `zshrc` can source them.
for helper in aliases functions; do
  helper_path="$DOTFILES/zsh/$helper.zsh"
  if [[ -f "$helper_path" ]]; then
    log "Helper available: $helper_path"
  else
    log "Warning: $helper_path is missing"
  fi
done

# Ensure a per-host plugin hook exists so people can opt in without editing repo.
local_plugins="${ZDOTDIR:-$HOME}/.zsh_plugins"

# Track machine-specific overrides.
if [[ -e "$local_plugins" ]]; then
  log "$local_plugins already exists"
else
  touch "$local_plugins"
  {
    echo "# Machine-specific plugin overrides"
    echo "# example: ZSH_PLUGIN_EXTRA=\"aws mvn\""
  } >> "$local_plugins"
  log "Created $local_plugins"
fi

# Ensure there is a per-host alias file so the shell has somewhere to point.
local_aliases="${ZDOTDIR:-$HOME}/.zsh_aliases"
if [[ -e "$local_aliases" ]]; then
  log "$local_aliases already exists"
else
  touch "$local_aliases"
  echo "# Local alias overrides" >> "$local_aliases"
  log "Created $local_aliases"
fi

# Ensure there is a per-host function file for extra helpers.
local_functions="${ZDOTDIR:-$HOME}/.zsh_functions"
if [[ -e "$local_functions" ]]; then
  log "$local_functions already exists"
else
  touch "$local_functions"
  echo "# Local function overrides" >> "$local_functions"
  log "Created $local_functions"
fi

# Ensure local overrides files exist even though they are not tracked.
local_rc="${ZDOTDIR:-$HOME}/.zshrc.local"
if [[ -e "$local_rc" ]]; then
  log "$local_rc already exists"
else
  touch "$local_rc"
  echo "# Machine-specific ~/.zshrc hooks" >> "$local_rc"
  log "Created $local_rc"
fi

# Ensure there is a per-host profile hook too.
local_profile="${ZDOTDIR:-$HOME}/.zprofile.local"
if [[ -e "$local_profile" ]]; then
  log "$local_profile already exists"
else
  touch "$local_profile"
  echo "# Machine-specific ~/.zprofile hooks" >> "$local_profile"
  log "Created $local_profile"
fi
