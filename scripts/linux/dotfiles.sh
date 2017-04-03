# Link miscellaneous loose dotfiles

## Remove any existing files
rm -r ~/.inputrc
rm -r ~/.my.cnf
rm -r ~/.config/user-dirs.dirs

## Create symbolic links
ln -s $DOTFILES_REPO_DIR/inputrc.sh ~/.inputrc
ln -s $DOTFILES_REPO_DIR/my.cnf ~/.my.cnf
ln -s $DOTFILES_REPO_DIR/config/user-dirs.dirs ~/.config/user-dirs.dirs
