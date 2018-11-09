#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

test -d ~/.config/dunst && \
rm -r ~/.config/dunst

ln -s $DOTFILES/config/dunst ~/.config/dunst
