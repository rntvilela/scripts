#!/bin/sh

pid=$(ps -u "$USER" -o pid,%cpu,%mem,comm | sort -b -k2 -r | dmenu -l 30 | awk '{print $1}')

[ -n "$pid" ] && resp=$(printf "Sim\nNão" | dmenu -l 2 -i -p "Matar pid $pid?") || exit

[ "$resp" = "Sim" ] && kill -15 "$pid" || exit

