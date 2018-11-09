#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

test -f ~/.conkyrc && \
rm ~/.conkyrc

ln -s $DOTFILES/conkyrc ~/.conkyrc
