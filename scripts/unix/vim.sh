# link or relink vim stuff
rm -r ~/.vim
rm -r ~/.vimrc

ln -s $DOTFILES_REPO_DIR/vimrc ~/.vimrc
ln -s $DOTFILES_REPO_DIR/vim ~/.vim