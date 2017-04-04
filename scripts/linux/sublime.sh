# link or relink sublime text 3 config
mkdir -p ~/.config/sublime-text-3/Packages
rm -r ~/.config/sublime-text-3/Packages/User
ln -s $DOTFILES_REPO_DIR/config/sublime-text-3/Packages/User ~/.config/sublime-text-3/Packages/User
