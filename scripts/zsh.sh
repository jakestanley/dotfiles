#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

test -d $ZSH/custom && rm -rf $ZSH/custom

ln -s $DOTFILES/oh-my-zsh/custom $ZSH/custom
