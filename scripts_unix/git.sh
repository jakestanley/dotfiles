#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

test -f ~/.gitconfig && \
rm ~/.gitconfig

test -f ~/.gitignore_global && \
rm ~/.gitignore_global

ln -s $DOTFILES/gitconfig ~/.gitconfig
ln -s $DOTFILES/gitignore_global ~/.gitignore_global
