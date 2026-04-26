#!/bin/sh

op=$(printf "right extend\nleft extend\npc only\nsecond only\nmirror screen\ndark mode\nnormal mode" | dmenu -l 8 -p "Screen Setup" | cut -c1)

case $op in
	r) xrandr --output eDP --auto --output HDMI-A-0 --auto --right-of eDP ;;
	l) xrandr --output eDP --auto --output HDMI-A-0 --auto --left-of eDP ;;
	p) xrandr --output eDP --auto --output HDMI-A-0 --off ;;
	s) xrandr --output eDP --off --output HDMI-A-0 --auto ;;
	m) xrandr --output eDP --auto --output HDMI-A-0 --auto --same-as eDP ;;
	d) xrandr --output HDMI-A-0 --gamma 1.0:0.7:0.4; xrandr --output eDP --gamma 1.0:0.7:0.4 ;;
	n) xrandr --output HDMI-A-0 --gamma 1.0:1.0:1.0; xrandr --output eDP --gamma 1.0:1.0:1.0 ;;
esac

