#!/bin/sh

home="/home/renato"
suckless="${home}/suckless"
config_files="${home}/config_files"

case "$1" in
    -u)
        echo "Update..."

        mkdir -p "$config_files/dwm"
        mkdir -p "$config_files/st"
        mkdir -p "$config_files/dmenu"

        mkdir -p "$config_files/bash"
        mkdir -p "$config_files/vim"
        mkdir -p "$config_files/tmux"

        mkdir -p "$config_files/x11"

        cp "$suckless/dwm/config.h"   "$config_files/dwm/"
        cp "$suckless/st/config.h"    "$config_files/st/"
        cp "$suckless/dmenu/config.h" "$config_files/dmenu/"

        cp "$home/.bashrc"    "$config_files/bash/"
        cp "$home/.vimrc"     "$config_files/vim/"
        cp "$home/.tmux.conf" "$config_files/tmux/"

        cp "$home/.xinitrc"   "$config_files/x11/"
        cp "$home/.Xdefaults" "$config_files/x11/"

        echo "Done"
        ;;
        
    -r)
        echo "Restore..."

        cp "$config_files/dwm/config.h"   "$suckless/dwm/"
        cp "$config_files/st/config.h"    "$suckless/st/"
        cp "$config_files/dmenu/config.h" "$suckless/dmenu/"

        cp "$config_files/bash/.bashrc"    "$home/"
        cp "$config_files/vim/.vimrc"      "$home/"
        cp "$config_files/tmux/.tmux.conf" "$home/"

        cp "$config_files/x11/.xinitrc"    "$home/"
        cp "$config_files/x11/.Xdefaults"  "$home/"

        echo "Done"
        ;;
        
    *)
        echo "Usage: $0 -u | -r"
        exit 1
        ;;
esac
