while true; do

    # get the data
    nowplaying=$(echo " ")
    nowplaying=$nowplaying$(echo \
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
	datetime=$(date +"%H:%M %A %d")

    # build the bar

    # set render monitor
    bar=$(echo %{S0})
#    bar=$bar$(echo %{l})$nowplaying
#    bar=$bar$(echo "%{c}")$datetime
    echo $bar
	sleep 1s
done | lemonbar -g 1680x16+0+0 -B \#334455
