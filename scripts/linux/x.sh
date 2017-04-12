# link or relink x stuff
rm -r ~/.xinitrc
rm -rf ~/.xinitrc.d
ln -s $DOTFILES_REPO_DIR/xinitrc.sh ~/.xinitrc
ln -s $DOTFILES_REPO_DIR/xinitrc.d ~/.xinitrc.d

# link to xsession for the sake of stupid display managers
rm -r ~/.xsession
ln -s $DOTFILES_REPO_DIR/xinitrc.sh ~/.xsession

# link or relink xrdb stuff
rm -r ~/.Xresources
rm -rf ~/.Xresources.d
ln -s $DOTFILES_REPO_DIR/Xresources ~/.Xresources
ln -s $DOTFILES_REPO_DIR/Xresources.d ~/.Xresources.d

# link xscreensaver stuff
rm ~/.xscreensaver
ln -s $DOTFILES_REPO_DIR/xscreensaver ~/.xscreensaver
