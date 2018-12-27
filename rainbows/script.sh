#!/bin/bash

# Reset cursor and shit on exit
trap "reset; stty sane; tput rs1; clear;" exit

# Clear screen, hide cursor
clear
#tput civis

input="r1"
while IFS= read -r var
do
	echo "$var"
done < "$input"

