#!/bin/sh

usage() {
    echo "usage: ./tux.sh [option]"
    echo ""
    echo " -c to calcule expression"
    echo " -t to translate word"
    echo " -s to search for sentence"
}

case $1 in
    -c) echo "scale=2; $2" | bc -l ;;
    *) usage ;;
esac

