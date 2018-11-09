#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

#rm -r ~/.vim
test -f ~/.vimrc && rm ~/.vimrc

#ln -s $DOTFILES/vim ~/.vim
ln -s $DOTFILES/vimrc ~/.vimrc
