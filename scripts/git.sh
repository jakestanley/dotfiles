#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

rm -f ~/.gitconfig
rm -f ~/.gitignore_global

ln -s $DOTFILES/gitconfig ~/.gitconfig
ln -s $DOTFILES/gitignore_global ~/.gitignore_global

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
