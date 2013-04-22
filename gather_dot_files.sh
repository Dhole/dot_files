#! /bin/bash

FILE_LIST="dot_file_list.txt"

while read line; do
    xpath=$(dirname $line) 
    xpref=$(basename $line)
    mkdir -p "$xpath"
    cp "$HOME/$line" "$line"
done < "$FILE_LIST"
