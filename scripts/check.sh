#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES="${DOTFILES:-$(cd "$SCRIPT_DIR/.." && pwd)}"

declare -A LINK_TARGETS=(
  [".gitconfig"]="gitconfig"
  [".gitignore_global"]="gitignore_global"
  [".zprofile"]="zprofile"
  [".zshrc"]="zshrc"
  [".tmux.conf"]="tmux.conf"
  [".vimrc"]="vimrc"
)

declare -A LINK_SCRIPTS=(
  [".gitconfig"]="scripts/git.sh"
  [".gitignore_global"]="scripts/git.sh"
  [".zprofile"]="scripts/zsh.sh"
  [".zshrc"]="scripts/zsh.sh"
  [".tmux.conf"]="scripts/tmux.sh"
  [".vimrc"]="scripts/vim.sh"
)

declare -a LOCAL_STUBS=(".zsh_plugins" ".zsh_aliases" ".zshrc.local" ".zprofile.local")

missing_scripts=()

echo "DOTFILES root: $DOTFILES"
printf '\n%35s  %-60s\n' "Home file" "Status"
printf '%s\n' "$(printf '%.0s-' {1..100})"

check_link() {
  local home="$1"
  local rel="$2"
  local key="$3"
  local target="$DOTFILES/$rel"
  local status

  if [[ -L "$home" ]]; then
    local resolved
    resolved="$(readlink "$home")"
    if [[ "$resolved" == "$target" ]]; then
      status="linked -> $rel"
    else
      status="linked -> ${resolved##*/} (expected $rel)"
    fi
  elif [[ -e "$home" ]]; then
    status="exists but not a symlink"
  else
    status="missing"
    missing_scripts+=("${LINK_SCRIPTS[$key]}")
  fi

  printf '%35s  %-60s\n' "$home" "$status"
}

for key in "${!LINK_TARGETS[@]}"; do
  check_link "$HOME/$key" "${LINK_TARGETS[$key]}" "$key"
done

printf '\nLocal stub status:\n'
for stub in "${LOCAL_STUBS[@]}"; do
  if [[ -e "$HOME/$stub" ]]; then
    echo " - $HOME/$stub exists"
  else
    echo " - $HOME/$stub missing (script will create on install)"
  fi
done

if (( ${#missing_scripts[@]} > 0 )); then
  printf '\nRecommended scripts to run:\n'
  sorted=($(printf '%s\n' "${missing_scripts[@]}" | sort -u))
  for script in "${sorted[@]}"; do
    echo " - $script"
  done
else
  echo -e '\nAll expected links are in place.'
fi
