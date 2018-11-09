#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

# link or relink libfm
test -d ~/.config/libfm && \
rm -r ~/.config/libfm

ln -s $DOTFILES/config/libfm ~/.config/libfm