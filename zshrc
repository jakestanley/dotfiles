#!/usr/bin/env zsh
#
# Interactive shell setup.  `~/.zshrc` should source this file once the dotfiles
# repository is linked into place; keep per-machine overrides under
# `~/.zshrc.local`.

# Powerlevel10k instant prompt needs to load before most other logic.
instant_prompt="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r "$instant_prompt" ]] && source "$instant_prompt"

# History tweaks (keeping the defaults lean but informative).
setopt append_history
setopt hist_ignorealldups
setopt hist_reduce_blanks

# oh-my-zsh settings
ZSH_THEME="${ZSH_THEME:-robbyrussell}"
default_plugins=(
  git \
  docker
)
plugins=("${default_plugins[@]}")

# Allow hosts to customize or extend the plugin list without editing the
# shared `zshrc`.  `~/.zsh_plugins` or `$DOTFILES/zsh_plugins` can set
# `ZSH_PLUGIN_OVERRIDE` (replace the list) or `ZSH_PLUGIN_EXTRA` (append
# additional entries).
for plugin_source in \
  "${ZDOTDIR:-$HOME}/.zsh_plugins" \
  "$DOTFILES/zsh_plugins"; do
  [[ -f "$plugin_source" ]] && source "$plugin_source"
done

if [[ -n "$ZSH_PLUGIN_OVERRIDE" ]]; then
  plugins=("${(@s: :)ZSH_PLUGIN_OVERRIDE}")
elif [[ -n "$ZSH_PLUGIN_EXTRA" ]]; then
  plugins+=("${(@s: :)ZSH_PLUGIN_EXTRA}")
fi

if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi

# Load the repository's custom aliases and helpers.
dotfiles_aliases="$DOTFILES/zsh/aliases.zsh"
[[ -r "$dotfiles_aliases" ]] && source "$dotfiles_aliases"
dotfiles_functions="$DOTFILES/zsh/functions.zsh"
[[ -r "$dotfiles_functions" ]] && source "$dotfiles_functions"

# Preserve any local alias file too.
local_aliases="${ZDOTDIR:-$HOME}/.zsh_aliases"
[[ -r "$local_aliases" ]] && source "$local_aliases"

# Allow machine-specific functions.
local_functions="${ZDOTDIR:-$HOME}/.zsh_functions"
[[ -r "$local_functions" ]] && source "$local_functions"

# SDKMAN and Node version manager helpers.
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# fzf defaults
# - `FZF_IGNORE_PATTERNS` is an appendable list of glob patterns used to prune
#   directories and exclude matching files (e.g. add `dist` or `*.log`).
# - Append in `~/.zshrc.local`, eg: `FZF_IGNORE_PATTERNS+=(dist target)`.
typeset -ga FZF_IGNORE_PATTERNS
if (( ${#FZF_IGNORE_PATTERNS[@]} == 0 )); then
  FZF_IGNORE_PATTERNS=(node_modules .git)
fi

fzf_refresh_default_command() {
  local prune_expr=""
  local file_expr=""
  local pattern=""
  local qpattern=""

  for pattern in "${FZF_IGNORE_PATTERNS[@]}"; do
    qpattern=${(q)pattern}
    prune_expr+="-name ${qpattern} -o "
    file_expr+="-name ${qpattern} -o "
  done

  prune_expr=${prune_expr% -o }
  file_expr=${file_expr% -o }

  local cmd="find ."
  if [[ -n "$prune_expr" ]]; then
    cmd+=" -type d \\( ${prune_expr} \\) -prune -o"
  fi
  cmd+=" -type f"
  if [[ -n "$file_expr" ]]; then
    cmd+=" -not \\( ${file_expr} \\)"
  fi
  cmd+=" -print 2>/dev/null"

  export FZF_DEFAULT_COMMAND="$cmd"
  export FZF_CTRL_T_COMMAND="$cmd"
}

# Powerlevel10k prompt file, if it exists.
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

# Machine-specific hooks.  Keep these outside the repo so each host can
# customize without touching the shared files.
local_rc="${ZDOTDIR:-$HOME}/.zshrc.local"
dotfiles_rc="$DOTFILES/zshrc.local"
[[ -f "$local_rc" ]] && source "$local_rc"
[[ -f "$dotfiles_rc" ]] && source "$dotfiles_rc"

fzf_refresh_default_command
[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"

# If we're inside GNU screen, annotate the prompt.
if (( ${+functions[_dotfiles_prompt_apply_screen_prefix]} )); then
  if ! (( ${precmd_functions[(Ie)_dotfiles_prompt_apply_screen_prefix]} )); then
    precmd_functions+=(_dotfiles_prompt_apply_screen_prefix)
  fi
fi
