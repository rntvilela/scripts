#!/bin/sh

list_dir="$HOME/.config/animecli"
anime_site="https://animesonlinecc.to"

if [ ! -d "$list_dir" ]
then
	mkdir "$list_dir" && touch "$list_dir/animelist"
fi 

animelist="$list_dir/animelist"

get_name() {
    [ -n "$anime" ] && anime_escolhido=$(curl -s "$anime_site/search/$anime" | grep -Eo "https:\/\/animesonlinecc.to\/anime\/[a-zA-Z0-9-]*/" | cut -c33- | uniq | dmenu -l 30 -p 'Resultados:') || exit
    if [ -n "$anime_escolhido" ]
	then
        anime_name=$(echo "$anime_escolhido" | tr -d '/' | tr '-' ' ' | sed 's/\<./\U&/g')
        ! grep -qi "$anime_name" "$animelist" && echo "$anime_name" >> "$animelist"
        episodioslist=$(curl -s "$anime_site/anime/$anime_escolhido" | grep -Eo "https:\/\/animesonlinecc.to\/episodio\/[a-zA-Z0-9-]*/" | cut -c36- | tr -d '/' | uniq) || exit
    fi
}

get_ep() {
    episodio=$(echo "$episodioslist" | dmenu -l 30 -p 'Episódios:') 
    [ -n "$episodio" ] && url="$anime_site/episodio/$episodio" || exit
	echo "$url"
    [ -n "$url" ] && mpv "$url" && get_ep || exit 
}

if [ "$1" = "-l" ]
then
    anime=$(sort < "$animelist" | dmenu -l 30 -i -p 'Pesquisar por:' | tr ' ' '+') && get_name && get_ep
else
    anime=$(printf '' | dmenu -p 'Pesquisar por:' | tr ' ' '+') && get_name && get_ep
fi

