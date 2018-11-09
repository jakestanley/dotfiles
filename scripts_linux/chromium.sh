#!/usr/bin/env bash


# link or relink git

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

rm -rf ~/.config/chromium-flags.conf

ln -s $DOTFILES/config/chromium-flags.conf ~/.config/chromium-flags.conf
