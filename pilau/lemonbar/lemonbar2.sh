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
	timestr=$(date +"%H:%M")
	datestr=$(date +"%A %d ")

    # build the bar
    bar=$(echo %{S1})
    bar=$bar$(echo "%{l} ")$nowplaying
    bar=$bar$(echo "%{c}")$timestr
    bar=$bar$(echo "%{r}")${datestr}" "
    echo $bar
	sleep 1s
done | lemonbar -g 1920x16+1680+0 -B \#334455
