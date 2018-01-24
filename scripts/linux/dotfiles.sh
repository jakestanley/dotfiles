# Link miscellaneous loose dotfiles

## Remove any existing files
rm -r ~/.inputrc
rm -r ~/.my.cnf
rm -r ~/.config/user-dirs.dirs

## Create symbolic links
ln -s $DOTFILES/inputrc.sh ~/.inputrc
ln -s $DOTFILES/my.cnf ~/.my.cnf
ln -s $DOTFILES/config/user-dirs.dirs ~/.config/user-dirs.dirs
