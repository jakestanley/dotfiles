#!/bin/zsh

## set up logging
local _logdate="$(date --iso-8601=seconds)"
local _logdir="$HOME/tmp/dotlogs"
local _logfile="$_logdir/xinitrc_$_logdate"
local _logfilelatest="$_logdir/xinitrc_latest"

function logStart {
    mkdir -p $_logdir
}

function logWrite {
    echo "[$(date --rfc-3339=seconds)]: $*" >> $_logfile
}

function logEnd {
    logWrite "Closing log..."
    rm -f $_logfilelatest
    ln -s $_logfile $_logfilelatest
}

## begin script
logStart

## set local vars
local _xkb_keys=${XKB_KEYS:-gb}
local _themepath="$DOTFILES/themes.d/${THEME}/Xresources"

# set the keyboard mappings
if which setxkbmap >/dev/null; then
    logWrite "setxkbmap ${_xkb_keys}"
    setxkbmap ${_xkb_keys}
fi

# load the xrdb resources
logWrite "Loading Xresources theme: '$THEME' from $_themepath"
xrdb -DTHEME="<$_themepath>" -load ~/.Xresources

if which VBoxClient-all >/dev/null; then
    logWrite "Starting VirtualBox client (all)"
    VBoxClient-all &
fi

# compton (if it's installed and that's your thing)
if which compton >/dev/null; then
    compton -b &
fi

# set solarized background color. TODO make this more portable
if which xsetroot >/dev/null; then
    logWrite "Setting background colour"
    xsetroot -solid "#93a1a1"
else
    logWrite "xsetroot not found"
fi

# set wallpaper on login
if which nitrogen >/dev/null; then
    logWrite "Starting nitrogen"
    nitrogen --restore &
else 
    logWrite "nitrogen not found"
fi

# run builders. you could use checksums here to save some trivial cpu effort

# dunst (if it's installed and that's your thing)
if which dunst >/dev/null; then
    # build dunst config file (blocks so dunst doesn't launch without it)
    logWrite "Building dunst config"
    ~/.xinitrc.d/builders/dunst.sh
    dunst &
fi

# build i3 config file (blocking as i3 can't be launched without it)
if which i3 >/dev/null; then
    logWrite "Building i3 config"
    ~/.xinitrc.d/builders/i3.sh
fi

logWrite "Launching WM: '$WM'"

logEnd

exec ${WM:-i3}
