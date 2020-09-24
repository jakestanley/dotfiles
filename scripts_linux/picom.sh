#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

test -f ~/.config/picom.conf && \
rm ~/.config/picom.conf

ln -s $DOTFILES/config/picom.conf ~/.config/picom.conf