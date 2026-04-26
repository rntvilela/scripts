#!/bin/sh

home="/home/renato"
suckless="${home}/suckless"
config_files="${home}/config_files"

cp ${suckless}/dwm/config.h   ${config_files}/dwm/
cp ${suckless}/st/config.h    ${config_files}/st/
cp ${suckless}/dmenu/config.h ${config_files}/dmenu/

cp ${home}/.bashrc    ${config_files}/bash/
cp ${home}/.vimrc     ${config_files}/vim/
cp ${home}/.tmux.conf ${config_files}/tmux/

cp ${home}/.xinitrc    ${config_files}/x11/
cp ${home}/.Xdefaults  ${config_files}/x11/
cp ${home}/.Xauthority ${config_files}/x11/
