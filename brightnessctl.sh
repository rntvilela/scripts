#!/bin/sh

usage() {    
    echo "usage: ./brightnessctl.sh [option]"
    echo ""
    echo " -u to increase brightness."
    echo " -d to decrease brightness."
    echo " -h to show this menu."
 
}

case $1 in
    -u) brightnessctl -q set +1
        killall dunst
        dunstify "$(awk '{print " " int($1*100/7) "%"}' < /sys/class/backlight/acpi_video0/brightness)"
        mpv /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga >/dev/null 2>&1 ;;
    -d) brightnessctl -q set 1-
        killall dunst
        dunstify "$(awk '{print " " int($1*100/7) "%"}' < /sys/class/backlight/acpi_video0/brightness)"
        mpv /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga >/dev/null 2>&1 ;;
     *) usage ;;
esac
