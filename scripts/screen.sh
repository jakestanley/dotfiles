#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

rm -f "$HOME/.screenrc"
ln -s "$DOTFILES/screenrc" "$HOME/.screenrc"

