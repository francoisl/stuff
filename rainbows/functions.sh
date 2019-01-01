#!/bin/bash

# generateFiles( sourceFile: string, seedStart: int, filesCount: int )
function generateFiles {
    clear
    echo "Generating files, source: $1, seedStart: $2, filesCount: $3"
    mkdir rnbw 2>/dev/null
    seed=$2
    for index in `seq -f "%04g" 1 $3`;
    do
        tput cup 1 0
        filename="rnbw_$index"
        echo "Generating file $filename, seed $seed"
        tput sc
        cat $1 | rnbw -S $seed -f > "rnbw/$filename"
        ((seed++))
    done
    tput rc
    echo "Combining and compressing files"
    ( for i in rnbw/rnbw_* ; do cat $i ; echo '___rnbw_file___' ; done ) | gzip -9 > rnbw/combined.gz
    echo Done
}


# play ( sourceFile: string )
function play {
    clear
    data=$(cat $1 | gunzip)
    IFS='e' read -ra rnbws <<< "$data"
    for i in "${rnbws[@]}"; do
        #tput cup 0 0
        echo "$i"
        sleep 0.2
    done
}

# progress( step: int, totalSteps: int, width: int )
function progressBar {
    tput sc
    echo "$1 / $2"
    echo $(($1 * $2 * $3 / 100))
    if (($1 < $2)); then
        tput rc
    fi
}

