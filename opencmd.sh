#!/bin/sh

usage() {
    echo "usage: ./opencmd.sh [option]"
    echo ""
    echo " -p to pdf file."
    echo " -t to text file."
    echo " -i to image file."
    echo " -v to video file."
    echo " -h to show this menu."
}

pdfreader='zathura'
editor='vim'
image='feh'
video='mpv'

case $1 in
    -p) arg="$(ls -a | grep -E 'pdf' | dmenu -l 30)"
        [ -n "$arg" ] && nohup $pdfreader "$arg" >/dev/null & ;;
    -t) arg="$(ls -a | grep -E 'md|txt' | dmenu -l 30)"
        [ -n "$arg" ] && $editor "$arg" ;;
    -i) arg="$(ls -a | grep -E 'jpeg|jpg|png' | dmenu -l 30)"
        [ -n "$arg" ] && $image "$arg" ;;
    -v) arg="$(ls -a | grep -E 'mkv|mp4|avi' | dmenu -l 30)"
        [ -n "$arg" ] && nohup $video "$arg" >/dev/null & ;;
    *) usage ;;
esac

