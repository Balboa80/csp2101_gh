#!/bin/bash

# variables to use inside the script for a much more neater command line
front="<tr><td>"
back="<\/td><\/tr>"
centre="<\/td><td>"

# script invoking the script attacks.html and then piping it to sed to get rid of all the html formatting
#then piping it to awk to print the attack file and total numbers of attack neatly
cat attacks.html | grep "<td>" | sed -e "s/^$front//g; s/$back$//g; s/$centre/ /g" | awk -v OFS='\t\t' 'BEGIN { print  "Attacks", "Instances(Q3)"} { total=($2+$3+$4); printf "%-15s %s\n", $1,total }'

exit 0
 