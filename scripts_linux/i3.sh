#!/usr/bin/env bash

# link or relink i3 stuff

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

test -d ~/.config/i3 && \
rm -r ~/.config/i3

ln -s $DOTFILES/config/i3 ~/.config/i3
