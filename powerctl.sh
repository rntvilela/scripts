#!/bin/sh

op=$(printf "poweroff\nsuspend\nreboot\nlock" | dmenu -l 4 -p "Power System" | cut -c1)

case $op in
    l) slock ;;
    s) nohup slock > /dev/null 2>&1 & systemctl suspend ;;
    r) sudo systemctl reboot ;;
    p) sudo systemctl poweroff ;;
esac
