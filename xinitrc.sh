#!/bin/zsh

setxkbmap gb &
xrdb -merge ~/.Xresources &

# set up monitors configuration
~/.xinitrc.d/monitors.sh &

# compton (if it's installed and that's your thing)
if which compton >/dev/null; then
    compton -b &
fi

exec openbox-session

