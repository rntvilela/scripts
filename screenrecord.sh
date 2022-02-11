#!/bin/sh

usage() {    
    echo "usage: ./screenrecord.sh [option]"
    echo ""
    echo " -v to record screen without audio."
    echo " -a to record screen and audio."
    echo " -h to show this menu."
}

case $1 in
    -v) ffmpeg -video_size 1366x768 -framerate 25 -f x11grab -i :0.0+0,0 "/home/renato/Vídeos/Screen-record_$(date +"%d-%m-%Y_%H-%M-%S").mkv" 
        dunstify "Video save in Vídeos" ;;
    -a) ffmpeg -video_size 1366x768 -framerate 25 -f x11grab -i :0.0+0,0 -f pulse -ac 2 -i default "/home/renato/Vídeos/Screen-record-audio_$(date +"%d-%m-%Y_%H-%M-%S").mkv"        
        dunstify "Video save in Vídeos" ;;
    *) usage ;;
esac
