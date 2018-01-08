# link or relink zsh dotfiles

if [[ "${DOTFILES_REPO_DIR}" == "" ]]; then
    echo "DOTFILES_REPO_DIR is not set. Exiting to stay safe"
    exit 1
fi

rm -rf ~/.aliases
rm -rf ~/.zprofile
rm -rf ~/.zshrc
rm -rf ~/.zshrc.d

ln -s $DOTFILES_REPO_DIR/aliases.sh ~/.aliases
ln -s $DOTFILES_REPO_DIR/zprofile.sh ~/.zprofile
ln -s $DOTFILES_REPO_DIR/zshrc.sh ~/.zshrc
ln -s $DOTFILES_REPO_DIR/zshrc.d ~/.zshrc.d

# useful information
_zsh_site="http://zsh.sourceforge.net/Intro/intro_3.html"
echo "Read ${_zsh_site} for more information on Zsh startup files"
