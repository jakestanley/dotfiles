#!/bin/sh
I3_CONFIG_PATH=$HOME/.config/i3/config

rm $I3_CONFIG_PATH

# variables
echo "set \$theme ${THEME}" >> $I3_CONFIG_PATH

cat \
    ~/.config/i3/config.d/top.cnf \
    ~/.config/i3/config.d/defaults.cnf \
    ~/.config/i3/config.d/gaps.cnf \
    ~/.config/i3/config.d/workspaces.cnf \
    ~/.config/i3/config.d/bindings-i3.cnf \
    ~/.config/i3/config.d/bindings-other.cnf \
    ~/.config/i3/config.d/bindings-music.cnf \
    ~/.themes.d/${THEME}/i3 \
    ~/.config/i3/config.d/colors.cnf \
    ~/.config/i3/config.d/keys.cnf \
    ~/.config/i3/config.d/mode-resize.cnf \
    ~/.config/i3/config.d/bottom.cnf \
>> $I3_CONFIG_PATH
