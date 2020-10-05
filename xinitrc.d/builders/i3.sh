#!/bin/sh
I3_CONFIG_PATH=$HOME/.config/i3/config

rm -f $I3_CONFIG_PATH

# TODO if themes directory not set, link it or default to dotfiles theme
# variables
echo "set \$theme ${THEME}" >> $I3_CONFIG_PATH

cat \
    $DOTFILES/config/i3/config.d/top.cnf \
    $DOTFILES/config/i3/config.d/defaults.cnf \
    $DOTFILES/config/i3/config.d/gaps.cnf \
    $DOTFILES/config/i3/config.d/workspaces.cnf \
    $DOTFILES/config/i3/config.d/bindings-i3.cnf \
    $DOTFILES/config/i3/config.d/bindings-other.cnf \
    $DOTFILES/config/i3/config.d/bindings-music.cnf \
    ~/.themes.d/${THEME}/i3 \
    $DOTFILES/config/i3/config.d/colors.cnf \
    $DOTFILES/config/i3/config.d/keys.cnf \
    $DOTFILES/config/i3/config.d/mode-resize.cnf \
    $DOTFILES/config/i3/config.d/bottom.cnf \
>> $I3_CONFIG_PATH
