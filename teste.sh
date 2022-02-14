#!/bin/sh

list="$(ls | nl)"

number=$(echo "$list" | awk '{print $1'} | dmenu -l 10 -p 'Episódio:')

file=$(echo "$list" | sed -n $number"p" | awk '{print $2}')

#echo "$file"

echo "$file"
