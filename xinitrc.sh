#!/usr/bin/env bash

xrandr --dpi 144

# set the keyboard mappings
~/.xinitrc.d/setxkbmap.sh &

# load the xrdb resources
xrdb -DTHEME="<$DOTFILES/themes.d/xresources.d/${THEME}.Xresources>" -load ~/.Xresources

# set up monitors configuration
~/.xinitrc.d/monitors.sh &

if which VBoxClient-all >/dev/null; then
    VBoxClient-all &
fi

# compton (if it's installed and that's your thing)
if which compton >/dev/null; then
    compton -b &
fi

# set wallpaper on login
if which nitrogen >/dev/null; then
    nitrogen --restore &
fi

# run builders. you could use checksums here to save some trivial cpu effort

# dunst (if it's installed and that's your thing)
if which dunst >/dev/null; then
    # build dunst config file (blocks so dunst doesn't launch without it)
    ~/.xinitrc.d/builders/dunst.sh
    dunst &
fi

# build i3 config file (blocking as i3 can't be launched without it)
if which i3 >/dev/null; then
    ~/.xinitrc.d/builders/i3.sh
fi

# set solarized background color. TODO make this more portable
# xsetroot -solid "#93a1a1" &
exec $WM
