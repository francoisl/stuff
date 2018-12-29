#!/bin/bash

# generateRainbows( sourceFile: string, seedStart: int, filesCount: int )
function generateFiles {
    clear
    echo "Generating files, source: $1, seedStart: $2, filesCount: $3"
    seed=$2
    for index in `seq -f "%04g" 1 $3`;
    do
        filename="rnbw_$index"
        echo "Generating file $filename, seed $seed"
        tput sc
        tput cup 1 0
        cat $1 | rnb -S $seed -f > "rnbw/$filename"
        ((seed++))
    done
    tput rc
    echo Done
}
