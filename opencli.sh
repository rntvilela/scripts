#!/bin/sh

usage() {
    echo "usage: ./opencli.sh [option]"
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
    -p) arg="$(ls *pdf 2>/dev/null | dmenu -l 30)"
        [ -n "$arg" ] && nohup $pdfreader "$arg" >/dev/null 2>&1 & ;;
    -t) arg="$(ls *md *txt 2>/dev/null | dmenu -l 30)"
        [ -n "$arg" ] && $editor "$arg" ;;
    -i) arg="$(ls *jpeg *jpg *png 2>/dev/null | dmenu -l 30)"
        [ -n "$arg" ] && nohup $image "$arg" >/dev/null 2>&1 &;;
    -v) arg="$(ls *mkv *mp4 *avi 2>/dev/null | dmenu -l 30)"
        [ -n "$arg" ] && nohup $video "$arg" >/dev/null 2>&1 & ;;
    *) usage ;;
esac

