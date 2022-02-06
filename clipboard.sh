#!/bin/sh

usage() {    
    echo "usage: ./clipboard.sh [option]"
    echo ""
    echo " -w write selection to tempclip.txt."
    echo " -r read selections from tempclip.txt."
    echo " -h to show this menu."
}

case $1 in
    -w) echo "$(xclip -o -sel c)" >> /tmp/tmpclip.txt ;;
    -r) cat /tmp/tmpclip.txt | dmenu -l 30 | tr -d "\n" | xclip -sel c ;;
    *) usage ;;
esac
