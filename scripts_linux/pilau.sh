#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

test -d ~/.pilau && rm -r ~/.pilau
ln -s $DOTFILES/pilau ~/.pilau
