#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

test -d ~/.config/openbox && \
rm -r ~/.config/openbox

ln -s $DOTFILES/config/openbox ~/.config/openbox
