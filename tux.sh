#!/bin/sh

usage() {
    echo "usage: ./tux.sh [option]"
    echo ""
    echo " -d to get date"
    echo " -c to calcule expression"
    echo " -t to translate word"
    echo " -s to search for sentence"
    echo " -w to get weather"

}

case $1 in
    -c) echo "scale=2; $2" | bc -l ;;
    -d) echo "$(date +'%a, %d %b %y, %H:%M' && echo && cal)" ;;
    -w) echo "$(curl -Ss 'https://wttr.in/?Q&T' | cut -c16- | head -2 | xargs)" ;;
    *) usage ;;
esac

