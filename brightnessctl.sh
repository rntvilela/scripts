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
        dunstctl close-all
        dunstify "$(awk '{print " " int($1*100/7) "%"}' < /sys/class/backlight/acpi_video0/brightness)" ;;
    -d) brightnessctl -q set 1-
        dunstctl close-all
        dunstify "$(awk '{print " " int($1*100/7) "%"}' < /sys/class/backlight/acpi_video0/brightness)" ;;
     *) usage ;;
esac
