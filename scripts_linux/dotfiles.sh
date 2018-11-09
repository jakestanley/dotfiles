#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

test -f ~/.inputrc && \
rm ~/.inputrc

test -f ~/.my.cnf && \
rm ~/.my.cnf

test -f ~/.config/user-dirs.dirs && \
rm ~/.config/user-dirs.dirs

ln -s $DOTFILES/inputrc.sh ~/.inputrc
ln -s $DOTFILES/my.cnf ~/.my.cnf
ln -s $DOTFILES/config/user-dirs.dirs ~/.config/user-dirs.dirs
