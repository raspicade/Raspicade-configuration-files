#!/bin/bash
audioconffile="/var/lib/alsa/asound.state"
audioout="local"
if [ -f  $audioconffile ]
then
#read the configuration
straudio=$(sed -n "/PCM Playback Route/{N; /value ./p}" $audioconffile | grep value)
#printf "straudio" $straudio
audioconf=${straudio: -1}
case "$audioconf" in
    0) audioout="hdmi"
    ;;
    1) audioout="local"
    ;;
    2) audioout="hdmi"
    ;;
    *) audioout="hdmi"
    ;;
esac
else
    printf "$audioconffile dos not exists"
fi

/home/pi/joy2key/joy2key -terminal -buttons a b c d p q -thresh 0 0 0 0 0 0 0 0 &
omxplayer --key-config /home/pi/omxplayer_keys.rc -o $audioout -b "$1"
killall joy2key
