#!/bin/bash

while true; do  # while loop that validates the user's input and will only end if the user input either a 20 or 40
    read -p 'Please enter 20 or 40: ' dnum  # ask for the user input
        if [[ $dnum -eq 20 ]] || [[ $dnum -eq 40 ]]; then   #if input is either 20 or 40 terminate the script
            echo "Valid Input"
            break
        else
            echo "Invalid Input. Please try again!"     # if user input is not a 20 or 40, prompt user that 
        fi                                              # it is invalid and pls try to input the correct input again
done

exit 0


