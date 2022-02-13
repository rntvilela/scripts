#!/bin/sh

browser='firefox'

usage() {
    echo "usage: ./animecli.sh 'anime name'"
    echo "example: ./animecli.sh 'death note'"
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ -z "$1" ]
then
    usage
else
    anime=$(echo "$1" | tr ' ' '+')
    anime_escolhido=$(curl -s https://animesonline.cc/search/"$anime" | grep -Eo "https:\/\/animesonline.cc\/anime\/[a-zA-Z0-9-]*/" | uniq | cut -c31- | tr -d '/' |dmenu -l 10)
    [ -n "$anime_escolhido" ] && episodio=$(curl -s "https://animesonline.cc/anime/$anime_escolhido/" | grep -Eo "https:\/\/animesonline.cc\/episodio\/[a-zA-Z0-9-]*/" | uniq | cut -c34- | tr -d '/' | dmenu -l 30)
fi

if [ -n "$episodio" ]
then
    mpv "https://animesonline.cc/$episodio"
    if [ $? = 0 ]
    then
        echo -n "Você acabou de assistir: "
        echo "$episodio." | tr '-' ' ' | sed 's/\<./\U&/g'
    else
        echo -n "Falha ao executar com mpv, abrindo: "
        echo -n "$episodio " | tr '-' ' ' | sed 's/\<./\U&/g'
        echo "com $browser."
        $browser "https://animesonline.cc/episodio/$episodio"
    fi
fi
