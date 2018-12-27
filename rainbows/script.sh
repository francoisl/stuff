#!/bin/bash

clear
#for seed in `seq -f "%04g" 1 20`;
#do
#   echo $seed
#   filename="rnbw_$seed"
#   echo $filename
#   sleep 0.1
#   tput cup 0 0
#done;
#exit

# file combination + compression
#( for i in rnbw/rnbw_* ; do cat $i ; echo '___rnbw_file___' ; done ) | gzip -9 > rnbw/combined.gz
#exit

# Reset cursor and shit on exit
trap "reset; stty sane; tput rs1; clear;" exit

# Clear screen, hide cursor
clear
tput civis

while true;
do
sources=(`ls rnbw/rnbw*`)
for sourceFile in ${sources[*]}
    do
        while IFS= read -r var
        do
            echo "$var"
        done < "$sourceFile"
        sleep 0.1
        tput cup 0 0
    done
done

