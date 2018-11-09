#!/usr/bin/env zsh

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

test -f ~/.aliases && \
rm ~/.aliases

test -f ~/.zprofile && \
rm ~/.zprofile

test -f ~/.zshrc && \
rm ~/.zshrc

test -d ~/.zshrc.d && \
rm -r ~/.zshrc.d

ln -s $DOTFILES/aliases.sh ~/.aliases
ln -s $DOTFILES/zprofile.sh ~/.zprofile
ln -s $DOTFILES/zshrc.sh ~/.zshrc
ln -s $DOTFILES/zshrc.d ~/.zshrc.d

# useful information
_zsh_site="http://zsh.sourceforge.net/Intro/intro_3.html"
echo "Read ${_zsh_site} for more information on Zsh startup files"
