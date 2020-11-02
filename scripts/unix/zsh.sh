#!/usr/bin/env bash

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

DATE=$(date '+%Y-%m-%dT%H%M%S')
mkdir -p ~/backups

test -f ~/.aliases && \
mv ~/.aliases ~/backups/.aliases_$DATE

test -f ~/.profile && \
mv ~/.profile ~/backups/.profile_$DATE

test -f ~/.zprofile && \
mv ~/.zprofile ~/backups/.zprofile_$DATE

test -f ~/.zshrc && \
mv ~/.zshrc ~/backups/.zshrc_$DATE

test -d ~/.zshrc.d && \
rm -r ~/.zshrc.d

ln -s $DOTFILES/aliases.sh ~/.aliases
ln -s $DOTFILES/profile.sh ~/.profile
ln -s $DOTFILES/zprofile.sh ~/.zprofile
ln -s $DOTFILES/zshrc.sh ~/.zshrc
ln -s $DOTFILES/zshrc.d ~/.zshrc.d

# useful information
_zsh_site="http://zsh.sourceforge.net/Intro/intro_3.html"
echo "Read ${_zsh_site} for more information on Zsh startup files"
