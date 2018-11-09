#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

test -f ~/.config/compton.conf && \
rm ~/.config/compton.conf

ln -s $DOTFILES/config/compton.conf ~/.config/compton.conf