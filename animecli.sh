#!/bin/sh

browser='firefox'

usage() {
    echo "usage: ./animecli.sh [option]"
    echo ""
    echo " -n to give a name to search. Ex: ./animecli.sh 'death note'"
    echo " -l to give a list of animes to search. Ex: ./animecli.sh -l animes.txt"
    echo " -h to show this menu."
}

get_ep() {
    [ -n "$anime" ] && anime_escolhido=$(curl -s https://animesonline.cc/search/"$anime" | grep -Eo "https:\/\/animesonline.cc\/anime\/[a-zA-Z0-9-]*/" | uniq | cut -c31- | tr -d '/' |dmenu -l 10 -p 'Resultados:') || exit
    [ -n "$anime_escolhido" ] && episodio=$(curl -s "https://animesonline.cc/anime/$anime_escolhido/" | grep -Eo "https:\/\/animesonline.cc\/episodio\/[a-zA-Z0-9-]*/" | uniq | cut -c34- | tr -d '/' | dmenu -l 30 -p 'Episódios:') || exit

    if [ -n "$episodio" ]
    then
        mpv "https://animesonline.cc/$episodio/"
        if [ $? = 0 ]
        then
            echo -n "Você acabou de assistir: "
            echo "$episodio." | tr '-' ' ' | sed 's/\<./\U&/g'
        else
            echo -n "Falha ao executar com mpv, abrindo: "
            echo -n "$episodio " | tr '-' ' ' | sed 's/\<./\U&/g'
            echo "com $browser."
            $browser "https://animesonline.cc/episodio/$episodio/"
        fi
    fi
}

case $1 in 
    -n) [ -n "$2" ] && anime=$(echo "$2" | tr ' ' '+') && get_ep ;;
    -l) [ -f "$2" ] && anime=$(dmenu -l 30 -p 'Pesquisar por:' < "$2") && get_ep ;;
    *) usage ;;
esac

