#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

# link or relink x stuff
test -f ~/.xinitrc && \
rm ~/.xinitrc

test -d ~/.xinitrc.d && \
rm -r ~/.xinitrc.d

ln -s $DOTFILES/xinitrc.sh ~/.xinitrc
ln -s $DOTFILES/xinitrc.d ~/.xinitrc.d

# link to xsession for the sake of stupid display managers
test -f ~/.xsession && \
rm ~/.xsession

ln -s $DOTFILES/xinitrc.sh ~/.xsession

# link or relink xrdb stuff
test -f ~/.Xresources && \
rm ~/.Xresources

test -d ~/.Xresources.d && \
rm -r ~/.Xresources.d

ln -s $DOTFILES/Xresources ~/.Xresources
ln -s $DOTFILES/Xresources.d ~/.Xresources.d
