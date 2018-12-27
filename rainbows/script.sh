#!/bin/bash

# Reset cursor and shit on exit
trap "reset; stty sane; tput rs1; clear;" exit

# Clear screen, hide cursor
clear
#tput civis

sources=(`ls r*`)
for sourceFile in ${sources[*]}
do
	while IFS= read -r var
	do
		echo "$var"
	done < "$sourceFile"
	sleep 0.1
	tput cup 0 0
done

