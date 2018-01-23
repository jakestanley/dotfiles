# link or relink zsh dotfiles

if [[ "${DOTFILES_REPO_DIR}" == "" ]]; then
    echo "DOTFILES_REPO_DIR is not set. Exiting to stay safe"
    exit 1
fi

rm -rf ~/.tmux.conf

ln -s $DOTFILES_REPO_DIR/tmux.conf ~/.tmux.conf

# useful information
_tmux_site="https://wiki.archlinux.org/index.php/tmux"
echo "Read ${_tmux_site} for more information on tmux"

