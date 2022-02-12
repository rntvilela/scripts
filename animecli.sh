#!/bin/sh

usage() {
    echo "usage: ./animecli.sh 'anime name'"
    echo "example: ./animecli.sh 'death note'"
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ -z "$1" ]
then
    usage
else
    anime=$(echo "$1" | tr ' ' '+')
    link=$(curl -s https://animesonline.cc/search/$anime | grep -Eo "https:\/\/animesonline.cc\/anime\/[a-zA-Z0-9-]*/" | uniq | dmenu -l 30)
    [ -n "$link" ] && episodio=$(curl -s $link | grep -Eo "https:\/\/animesonline.cc\/episodio\/[a-zA-Z0-9-]*/" | uniq | dmenu -l 30)
fi

[ -n "$episodio" ] && mpv "$episodio"

