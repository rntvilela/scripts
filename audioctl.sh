#!/bin/sh

getvol() {
    amixer get Master | awk -F'[][]' 'END{print $2}'
}

case $1 in
    -u)
        amixer -q set Master 5%+ unmute
        vol=$(getvol)
        amixer -q set Master ${vol}%,${vol}%
        ;;
    -d)
        amixer -q set Master 5%- unmute
        vol=$(getvol)
        amixer -q set Master ${vol}%,${vol}%
        ;;
    -m)
        amixer -q set Master toggle
        ;;
esac
