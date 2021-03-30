#!/bin/bash

while true; do
    if [[ $usercount -eq 0 ]]; then
        read -p 'Enter [1] to Search or [2] to Exit: '
    else
        read -p 'Enter [1] to Search Again or [2] to Exit: '
    fi
    if [[ $REPLY -eq 2 ]]; then
        break
    else
        clear
        
        read -p 'Enter search pattern: ' pattern
        defaultifs=$IFS
        IFS=$'\n'
        if grep -q $pattern access_log.txt; then
            while true
            do
                clear
                echo "Choose an item: 1,2,3 or 4"
                echo "1: Whole word match"
                echo "2: Any match"
                echo "3: Inverted match"
                echo "4; Exit"
                read -sn1
                clear
                case "$REPLY" in
                    1) echo "$(grep -wic "$pattern" access_log.txt) matches found" 
                       grep -win "$pattern" access_log.txt;;
                    2) echo "$(grep -cin "$pattern" access_log.txt) matches found"
                       grep -in "$pattern" access_log.txt;;
                    3) echo "$(grep -vic "$pattern" access_log.txt) matches found" 
                       grep -vin "$pattern" access_log.txt;;
                    4) break;;
                esac
                read -n1 -p "Press any key to continue"
            done
        else
            echo "No matches found"     
        fi      
    fi
    ((usercount++))
    IFS=$defaultifs
    echo ""
done
exit 0