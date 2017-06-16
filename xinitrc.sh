#!/bin/zsh

# initialise the theme variable
export THEME="theme_solarized_light"

# set the keyboard mappings
~/.xinitrc.d/setxkbmap.sh &

# merge the xrdb resources
xrdb -DTHEME="<$DOTFILES_REPO_DIR/Xresources.d/$THEME>" -merge ~/.Xresources

# build i3 config file (blocking as i3 can't be launched without it)
~/.xinitrc.d/i3build.sh

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
