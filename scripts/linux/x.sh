# link or relink x stuff
rm -r ~/.xinitrc
rm -rf ~/.xinitrc.d
ln -s $DOTFILES/xinitrc.sh ~/.xinitrc
ln -s $DOTFILES/xinitrc.d ~/.xinitrc.d

# link to xsession for the sake of stupid display managers
rm -r ~/.xsession
ln -s $DOTFILES/xinitrc.sh ~/.xsession

# link or relink xrdb stuff
rm -r ~/.Xresources
rm -rf ~/.Xresources.d
ln -s $DOTFILES/Xresources ~/.Xresources
ln -s $DOTFILES/Xresources.d ~/.Xresources.d

# link xscreensaver stuff
rm ~/.xscreensaver
ln -s $DOTFILES/xscreensaver ~/.xscreensaver
