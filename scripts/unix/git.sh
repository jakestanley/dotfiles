# link or relink git

if [[ "${DOTFILES_REPO_DIR}" == "" ]]; then
    echo "DOTFILES_REPO_DIR is not set. Exiting to stay safe"
    exit 1
fi

rm -r ~/.gitconfig
rm -r ~/.gitignore_global

ln -s $DOTFILES_REPO_DIR/gitconfig ~/.gitconfig
ln -s $DOTFILES_REPO_DIR/gitignore_global ~/.gitignore_global
