#!/bin/zsh

# initialise the theme variable
export THEME="base16-solarized-dark"

# set the keyboard mappings
~/.xinitrc.d/setxkbmap.sh &

# load the xrdb resources
xrdb -DTHEME="<$DOTFILES_REPO_DIR/themes.d/xresources.d/${THEME}.xresources>" -load ~/.Xresources

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
    # build dunst config file (blocks so dunst doesn't launch without it)
    ~/.xinitrc.d/build_dunst.sh
    dunst &
fi

# set solarized background color. TODO make this more portable
xsetroot -solid "#93a1a1" &

# exec chosen window manager
exec $REAL_WM
