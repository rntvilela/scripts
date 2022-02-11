#!/bin/sh

usage() {    
    echo "usage: ./screenshooter.sh [option]"
    echo ""
    echo " -w capture full window."
    echo " -a select capture area."
    echo " -h to show this menu."
 
}

case $1 in
    -w) import -window root "/home/renato/Imagens/Screenshots/Screen-record_$(date +"%d-%m-%Y_%H-%M-%S").png"
        dunstify "Image save in Imagens/Screenshots" ;;
    -a) import "/home/renato/Imagens/Screenshots/Screen-record_$(date +"%d-%m-%Y_%H-%M-%S").png"
        dunstify "Image save in Imagens/Screenshots" ;;
     *) usage ;;
esac
