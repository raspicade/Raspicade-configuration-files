#!/bin/sh
joy2key -terminal -buttons a b c d p q -thresh 0 0 0 0 0 0 0 0 &
omxplayer --key-config /home/pi/omxplayer_keys.rc -o local -b "$1"
killall joy2key
