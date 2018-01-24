# link or relink git

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

rm -r ~/.gitconfig
rm -r ~/.gitignore_global

ln -s $DOTFILES/gitconfig ~/.gitconfig
ln -s $DOTFILES/gitignore_global ~/.gitignore_global
