#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

# link or relink x stuff
rm -f ~/.xprofile
ln -s $DOTFILES/xprofile.sh $HOME/.xprofile

# remove any existing Xresources stuff
test -f ~/.Xresources && \
rm -f ~/.Xresources

test -d ~/.Xresources.d && \
rm -r ~/.Xresources.d
