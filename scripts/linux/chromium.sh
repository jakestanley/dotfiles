#!/usr/bin/env bash


# link or relink git

if [[ "${DOTFILES_REPO_DIR}" == "" ]]; then
    echo "DOTFILES_REPO_DIR is not set. Exiting to stay safe"
    exit 1
fi

rm -rf ~/.config/chromium-flags.conf

ln -s $DOTFILES_REPO_DIR/config/chromium-flags.conf ~/.config/chromium-flags.conf
