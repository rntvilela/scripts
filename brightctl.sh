#!/bin/sh

case $1 in
    -u) light -A 7 ;;
    -d) light -U 7 ;;
esac
