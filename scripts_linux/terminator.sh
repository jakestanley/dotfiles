#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

# link or relink terminator config
test -d ~/.config/terminator && rm -r ~/.config/terminator
ln -s $DOTFILES/config/terminator ~/.config/terminator
