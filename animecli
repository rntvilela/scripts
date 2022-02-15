#!/bin/sh

animelist="$HOME/.config/animecli/animelist"

usage() {
    echo "usage: ./animecli.sh [option]"
    echo ""
    echo " -n to give a name to search. Ex: ./animecli.sh 'death note'"
    echo " -l to search from list ($animelist)"
    echo " -h to show this menu."
}

get_ep() {
    [ -n "$anime" ] && anime_escolhido=$(curl -s "https://goyabu.com/?s=$anime" | grep -Eo "https:\/\/goyabu.com\/assistir\/[a-zA-Z0-9-]*/" | cut -c28- | tr -d '/' | dmenu -l 30 -p 'Resultados:') || exit
    [ -n "$anime_escolhido" ] && episodioslist=$(curl -s "https://goyabu.com/assistir/$anime_escolhido/" | grep -Eo "https:\/\/goyabu.com\/videos\/[a-zA-Z0-9-]*/" | nl) || exit
    
    episodio=$(echo "$episodioslist" | awk '{print $1}' | dmenu -l 30 -p 'Episódios:') 

    [ -n "$episodio" ] && url="$(echo "$episodioslist" | sed -n "$episodio"'p' | awk '{print $2}')"
    [ -n "$url" ] && mpv "$url" && echo -n "Você acabou de assistir: " && echo -n "$anime_escolhido" | tr '-' ' ' | sed 's/\<./\U&/g' && echo " - Episódio $episodio" && exit
}

case $1 in 
    -n) [ -n "$2" ] && anime=$(echo "$2" | tr ' ' '+') && get_ep ;;
    -l) [ -f "$animelist" ] && anime=$(dmenu -l 30 -p 'Pesquisar por:' < "$animelist") && get_ep ;;
    *) usage ;;
esac

