#!/bin/zsh

# set the keyboard mappings
~/.xinitrc.d/setxkbmap.sh &

# merge the xrdb resources
xrdb -merge ~/.Xresources &

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
    # compton -b &
fi

# set screen width variable
export X_SCREEN_WIDTH=$(xrandr -q | awk -F'current' -F',' 'NR==1 {gsub("( |current)","");print $2}' | grep "[0-9]*" -oh | head -n 1 | tail -n 1)

# dunst (if it's installed and that's your thing)
if which dunst >/dev/null; then

    # dynamically calculate dunst dims and position
    # dunst_width=350
    # dunst_height=50

    # dunst_x=$[$[$[$X_SCREEN_WIDTH] / 2] - $[$dunst_width / 2]]
    # dunst_y=30

    # start with geometry as dynamic stuff can't be done in config
    # dunst -geometry ${dunst_width}x${dunst_height}+${dunst_x}+${dunst_y} &
    dunst
fi

# exec chosen window manager
exec $REAL_WM
