#!/bin/sh

nowplaying=$(echo \
    `dbus-send --print-reply \--dest=org.mpris.MediaPlayer2.spotify \
     /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get \
     string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|\
     egrep -A 2 "artist"|egrep -v "artist"|egrep -v "array"|cut -b 27-|\
     cut -d '"' -f 1|egrep -v ^$` "-" `dbus-send --print-reply \
     --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 \
     org.freedesktop.DBus.Properties.Get \
     string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|\
     egrep -A 1 "title"|egrep -v "title"|cut -b 44-|cut -d '"' -f 1|\
     egrep -v ^$`)
timestr=$(date +"%H:%M")
datestr=$(date +"%A %d")

# build the bar

# set render monitor 0
bar=$(echo %{S0})

# monitor 0 output
## nothing atm

# set render monitor 1
bar=$(echo %{S1})

# monitor 1 output (requires lemonbar >= 1.2)
bar=$bar$(echo "%{l}%{O4}")$nowplaying
bar=$bar$(echo "%{c}")$timestr
bar=$bar$(echo "%{r}")${datestr}"%{O4}"

BAR_OUTPUT=$bar
