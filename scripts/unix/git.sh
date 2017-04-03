# link or relink git
rm -r ~/.gitconfig
rm -r ~/.gitignore_global

ln -s $DOTFILES_REPO_DIR/gitconfig ~/.gitconfig
ln -s $DOTFILES_REPO_DIR/gitignore_global ~/.gitignore_global
