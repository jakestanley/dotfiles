#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

rm -f ~/.gitconfig
rm -f ~/.gitignore_global

ln -s $DOTFILES/gitconfig ~/.gitconfig
ln -s $DOTFILES/gitignore_global ~/.gitignore_global

# Ensure a local git override file exists for per-machine settings.
local_git_config="$HOME/.gitconfig.local"
if [[ -e "$local_git_config" ]]; then
    echo "Git local overrides already exist at $local_git_config"
else
    cat <<'EOF' > "$local_git_config"
# Add per-machine overrides (GPG key, user/email overrides, etc.) below this line.
EOF
    echo "Created $local_git_config"
fi
# Configure the OS-specific diff tool include if it exists
platform=""
case "$(uname -s)" in
    Linux*) platform="linux" ;;
    Darwin*) platform="macos" ;;
esac

include_file="$DOTFILES/gitconfig.d/${platform}.gitconfig"
if [[ -n "$platform" && -f "$include_file" ]]; then
    git config --global include.path "$include_file"
    echo "Enabled git include from $include_file"
fi
