# link or relink zsh dotfiles

if [[ "${DOTFILES}" == "" ]]; then
    echo "DOTFILES is not set. Exiting to stay safe"
    exit 1
fi

rm -f $HOME/.tmux.conf
ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf

# useful information
_tmux_site="https://wiki.archlinux.org/index.php/tmux"
echo "Read ${_tmux_site} for more information on tmux"

