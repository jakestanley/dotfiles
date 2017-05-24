#!/bin/zsh

~/.xinitrc.d/setxkbmap.sh &
xrdb -merge ~/.Xresources &

# set up monitors configuration
~/.xinitrc.d/monitors.sh &

if which VBoxClient-all >/dev/null; then
    VBoxClient-all &
fi

# compton (if it's installed and that's your thing)
if which compton >/dev/null; then
    compton -b &
fi

exec openbox-session

