#!/bin/bash

let sum=$1+$2+$3     # created a variable name sum for adding all value

if [ $sum -le 30 ]; then  # if statement to test if the sum of the 3 values inputed is more than or less 30
    echo "The sum of $1 and $2 and $3 is $sum"      
else                                           #print statements for the two test condition results 
    echo "Sum exceeds maximum allowable"
fi

exit 0
