#!/usr/bin/env bash

export SCRIPT_NAME="xprofile.sh"

function log() { # $1 = message
    echo "[$SCRIPT_NAME] $(date --rfc-3339=seconds): $1"  >> ~/dotfiles.log
}

log "Started"

if [[ -z $DOTFILES ]]; then
    log "DOTFILES not set"
fi

if [[ -z $THEME ]]; then
    export THEME=base16-solarized-dark
    log "THEME not set. Using default theme: '$THEME'"
fi

if which VBoxClient-all >/dev/null; then
    log "Starting VBoxClient-all..."
    VBoxClient-all &
fi

if which nm-applet >/dev/null; then
    log "Starting nm-applet..."
    nm-applet &
fi

# picom (if it's installed and that's your thing)
if which picom >/dev/null; then
    log "Starting picom..."
    picom -b &
fi

# set solarized background color. TODO make this more portable
if which xsetroot >/dev/null; then
    log "xsetroot called"
    xsetroot -solid "#93a1a1"
fi

# set wallpaper on login
if which nitrogen >/dev/null; then
    log "nitrogen restore"
    nitrogen --restore &
fi

# dunst (if it's installed and that's your thing)
if which dunst >/dev/null; then
    log "building dunst config..."
    $DOTFILES/builders/dunst.sh
    log "Starting dunst..."
    dunst &
fi

# build i3 config file (blocking as i3 can't be launched without it)
if which i3 >/dev/null; then
    log "building i3 config..."
    $DOTFILES/builders/i3.sh
fi

# build Xresources file (blocking)
if which xrdb >/dev/null; then
    log "building Xresources..."
    $DOTFILES/builders/xresources.sh
fi

log "Finished"
