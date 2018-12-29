#!/bin/bash

# generateFiles( sourceFile: string, seedStart: int, filesCount: int )
function generateFiles {
    clear
    echo "Generating files, source: $1, seedStart: $2, filesCount: $3"
    mkdir rnbw 2>/dev/null
    seed=$2
    for index in `seq -f "%04g" 1 $3`;
    do
        #tput cup 1 0
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
