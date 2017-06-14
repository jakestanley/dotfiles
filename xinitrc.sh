#!/bin/zsh

# set the keyboard mappings
~/.xinitrc.d/setxkbmap.sh &

# merge the xrdb resources
xrdb -override ~/.Xresources

# build i3 config file
rm ~/.config/i3/config
cat \
    ~/.config/i3/config.d/top.cnf \
    ~/.config/i3/config.d/gaps.cnf \
    ~/.config/i3/config.d/workspaces.cnf \
    ~/.config/i3/config.d/bindings-i3.cnf \
    ~/.config/i3/config.d/bindings-other.cnf \
    ~/.config/i3/config.d/bindings-music.cnf \
    ~/.config/i3/config.d/colors.cnf \
    ~/.config/i3/config.d/keys.cnf \
    ~/.config/i3/config.d/mode-resize.cnf \
    ~/.config/i3/config.d/bottom.cnf \
>> ~/.config/i3/config

# set up monitors configuration
~/.xinitrc.d/monitors.sh &

if which VBoxClient-all >/dev/null; then
    VBoxClient-all &
fi

# compton (if it's installed and that's your thing)
if which compton >/dev/null; then
    compton -b &
fi

# dunst (if it's installed and that's your thing)
if which dunst >/dev/null; then
    dunst &
fi

# set solarized background color. TODO make this more portable
xsetroot -solid "#93a1a1" &

# exec chosen window manager
exec $REAL_WM
