#!/bin/sh

ssid=$(nmcli dev wifi list | dmenu -l 30 -i -p 'Conectar:' | awk '{print $2}')

[ -n "$ssid" ] && nmcli --ask dev wifi connect "$ssid"
