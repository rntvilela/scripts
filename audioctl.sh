#!/bin/sh

usage() {    
    echo "usage: ./audioctl.sh [option]"
    echo ""
    echo " -u to increase audio %5."
    echo " -d to decrease audio %5."
    echo " -m to mute audio."
    echo " -p to open pulsemixer"
    echo " -h to show this menu."
 
}

case $1 in
    -u) amixer -q set Master 5%+ unmute
        killall dunst
        dunstify "$(amixer sget Master | awk '/Left:/ {gsub (/[\[\]]/,""); print " "$5}')" 
        mpv /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga >/dev/null 2>&1 ;;
    -d) amixer -q set Master 5%- unmute 
        killall dunst
        audio=$(amixer sget Master | awk '/Left:/ {gsub (/[\[\]]/,""); print $5" "$6}')
        [ "${audio% *}" = "0%" ] || [ "${audio#* }" = "off" ] && dunstify " ${audio% *}" || dunstify " ${audio% *}" 
        mpv /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga >/dev/null 2>&1 ;;
    -m) amixer -q set Master toggle
        killall dunst
        arg=$(amixer sget Master | awk '/Left:/ {gsub (/[\[\]]/,""); print $6}')
        [ "$arg" = "on" ] && dunstify " "|| dunstify " "
        mpv /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga >/dev/null 2>&1 ;;
    -p) pulsemixer ;;
     *) usage ;;
esac