#!/bin/sh

if [ -z "$THEME" ]; then
    echo "THEME not set. Will use the default"
    THEME="theme_default"
fi

echo "Using theme \"$THEME\""

rm ~/.config/i3/config
cat \
    ~/.config/i3/config.d/top.cnf \
    ~/.config/i3/config.d/gaps.cnf \
    ~/.config/i3/config.d/workspaces.cnf \
    ~/.config/i3/config.d/bindings-i3.cnf \
    ~/.config/i3/config.d/bindings-other.cnf \
    ~/.config/i3/config.d/bindings-music.cnf \
    ~/.config/i3/config.d/${THEME}.cnf \
    ~/.config/i3/config.d/colors.cnf \
    ~/.config/i3/config.d/keys.cnf \
    ~/.config/i3/config.d/mode-resize.cnf \
    ~/.config/i3/config.d/bottom.cnf \
>> ~/.config/i3/config

