# link or relink zsh dotfiles

if [[ "${DOTFILES_REPO_DIR}" == "" ]]; then
    echo "DOTFILES_REPO_DIR is not set. Exiting to stay safe"
    exit 1
fi

rm -r ~/.aliases
rm -r ~/.zprofile
rm -r ~/.zshrc
rm -r ~/.zshrc.d

ln -s $DOTFILES_REPO_DIR/aliases.sh ~/.aliases
ln -s $DOTFILES_REPO_DIR/zprofile.sh ~/.zprofile
ln -s $DOTFILES_REPO_DIR/zshrc.sh ~/.zshrc
ln -s $DOTFILES_REPO_DIR/zshrc.d ~/.zshrc.d
