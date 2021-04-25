#!/bin/bash

getprop() { #Function that counts the total number of words, the size of the file in kilobytes, and the last modified date of the text file the user will input
        wrdcnt=$(wc -w < $1)
        kbsize=$(echo "scale=4; $(stat -c%s $1)/1024" | bc)
        moddate=$(date -r $1 "+%d-%m-%Y %H:%M:%S")
        echo "The file $1 contains $wrdcnt words and is $kbsize K in size and was last modified $moddate."
}

read -p "Enter a filename to check: " fname # Prompt user to enter a file to search 
getprop $fname  #Invoke the getprop() function
