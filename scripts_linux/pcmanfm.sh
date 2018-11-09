#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

test -d ~/.config/pcmanfm && \
rm -r ~/.config/pcmanfm

ln -s $DOTFILES/config/pcmanfm ~/.config/pcmanfm