#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

test -f ~/.config/chromium-flags.conf && \
rm ~/.config/chromium-flags.conf

ln -s $DOTFILES/config/chromium-flags.conf ~/.config/chromium-flags.conf
