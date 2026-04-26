#!/bin/sh

sink=$(pactl list short sinks | awk '/alsa_output/ {print NR " 󰍬 " $2}' | dmenu -l 30 | awk '{print $1}')

[ -n "$sink" ] && sink=$((sink-=1)) && $(pactl set-default-sink $sink)
