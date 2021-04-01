#!/bin/bash

while true; do  # while loop to prompt user choices if to search a word or to exit
    if [[ $usercount -eq 0 ]]; then
        read -p 'Enter [1] to Search or [2] to Exit: '
    else
        read -p 'Enter [1] to Search Again or [2] to Exit: '    # an option to searc again or to exit after searching a word
    fi
    if [[ $REPLY -eq 2 ]]; then
        break
    else
        clear
        
        read -p 'Enter search pattern: ' pattern    # promt user to enter a word
        defaultifs=$IFS
        IFS=$'\n'
        if grep -q $pattern access_log.txt; then    # if statement to verify if the word is in the text file
            while true  # while loop that while true will loop through the menu bar
            do
                clear
                echo "Choose an item: 1,2,3 or 4"
                echo "1: Whole word match"
                echo "2: Any match"
                echo "3: Inverted match"
                echo "4; Exit"
                read -sn1
                clear
                case "$REPLY" in    # case statement that will execute depending with the user's choice in the menu
                    1) echo "$(grep -wic "$pattern" access_log.txt) matches found" 
                       grep -win "$pattern" access_log.txt;;
                    2) echo "$(grep -cin "$pattern" access_log.txt) matches found"
                       grep -in "$pattern" access_log.txt;;
                    3) echo "$(grep -vic "$pattern" access_log.txt) matches found" 
                       grep -vin "$pattern" access_log.txt;;
                    4) break;;
                esac
                read -n1 -p "Press any key to continue" # added feature to prompt the user to go back to the menu if he wants a different option
            done
        else
            echo "No matches found"     
        fi      
    fi
    ((usercount++)) # add one usercount
    IFS=$defaultifs # set IFS back to default
    echo ""
done
exit 0  # exit the script