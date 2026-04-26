#!/bin/sh

home="/home/renato"
suckless="${home}/suckless"
config_files="${home}/config_files"

mkdir -p ${config_files}/dwm/
mkdir -p ${config_files}/st/
mkdir -p ${config_files}/dmenu/

mkdir -p ${config_files}/bash/
mkdir -p ${config_files}/vim/
mkdir -p ${config_files}/tmux/

mkdir -p ${config_files}/x11/
mkdir -p ${config_files}/x11/
mkdir -p ${config_files}/x11/

cp ${suckless}/dwm/config.h   ${config_files}/dwm/
cp ${suckless}/st/config.h    ${config_files}/st/
cp ${suckless}/dmenu/config.h ${config_files}/dmenu/

cp ${home}/.bashrc    ${config_files}/bash/
cp ${home}/.vimrc     ${config_files}/vim/
cp ${home}/.tmux.conf ${config_files}/tmux/

cp ${home}/.xinitrc    ${config_files}/x11/
cp ${home}/.Xdefaults  ${config_files}/x11/
cp ${home}/.Xauthority ${config_files}/x11/
