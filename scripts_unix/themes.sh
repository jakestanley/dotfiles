#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

# TODO download more themes from git if there is an internet connection
test -d ~/.themes.d && \
rm -r ~/.themes.d

ln -s $DOTFILES/themes.d ~/.themes.d
