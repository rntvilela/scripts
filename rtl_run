#!/bin/sh

files="$(ls *v)"

iverilog "$files" && vvp "./a.out" || exit

dump_file="./dump.vcd"

if [ "$1" = "-g" ]
then
	[ -f "$dump_file" ] && gtkwave $dump_file || exit
else
	exit
fi
