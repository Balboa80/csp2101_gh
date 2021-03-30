#!/bin/bash

nefcount=0  # variable for default count on not empty files
efcount=0   # variable for default count on empty files
nedcount=0  # variable for default count on not empty child directories
edcount=0   # variable for default count on empty directories
dirname=${1:-.} # use the given directory path

for i in $dirname/* # for loop going through the given directory
do
    if [ -d $i ]; then
        nedcount=$(($nedcount+1)) # if it's a directory add it to not empty directory counter
        ent_array=($i/*)
        if [ ${#ent_array[*]} -eq 0 ]; then
            edcount=$(($edcount+1)) # if it is an empty directory add it to the empty directorty counter
        fi
    else
        nefcount=$(($nefcount+1)) # if it is a file add it to the not empty file counter
        if [ ! -s $i ]; then
            efcount=$(($efcount+1)) # if it is an empty file add it to the empty file counter
        fi
    fi
done

echo "The $dirname directory contains: "    # print with the directory name
echo $((nefcount-efcount)) "files that contain data"    # print not empty file after substracting not empty to empty files
echo "$efcount that are empty"
echo $((nedcount-edcount)) "non-empty directories"  # print non-empty directory after substracting non empty to empty directories
echo "$edcount empty directories"

exit 0