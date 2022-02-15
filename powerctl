#!/bin/sh

usage() {    
    echo "usage: ./powermenu.sh [option]"
    echo ""
    echo " -s to suspend."
    echo " -r to reboot."
    echo " -p to poweroff."
    echo " -h to show this menu."
}

case $1 in
    -s) nohup slock > /dev/null 2>&1 & 
        systemctl suspend ;;
    -r) sudo systemctl reboot ;;
    -p) sudo systemctl poweroff ;;
    *) usage ;;
esac
