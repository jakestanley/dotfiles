# link or relink zsh dotfiles
rm -r ~/.aliases
rm -r ~/.zshrc
rm -r ~/.zshrc.d

ln -s $DOTFILES_REPO_DIR/aliases.sh ~/.aliases
ln -s $DOTFILES_REPO_DIR/zshrc.sh ~/.zshrc
ln -s $DOTFILES_REPO_DIR/zshrc.d ~/.zshrc.d
