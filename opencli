#!/bin/sh

usage() {
    echo "usage: ./opencli.sh [option]"
    echo ""
    echo " -p to pdf file."
    echo " -v to video file."
    echo " -h to show this menu."
}

pdfreader='zathura'
video='mpv'

case $1 in
    -p) arg="$(ls *pdf 2>/dev/null | dmenu -l 30 -p "Abrir:")"
        [ -n "$arg" ] && nohup $pdfreader "$arg" >/dev/null 2>&1 & ;;
    -v) arg="$(ls *mkv *mp4 *avi 2>/dev/null | dmenu -l 30 -p "Abrir:")"
        [ -n "$arg" ] && nohup $video "$arg" >/dev/null 2>&1 & ;;
    *) usage ;;
esac

