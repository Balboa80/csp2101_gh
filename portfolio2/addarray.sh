#!/bin/bash

# Declaring the 2 array variable
declare -a ass1=(12 18 20 10 12 16 15 19 8 11)
declare -a ass2=(22 29 30 20 18 24 25 26 29 30)
sum=0   #sum set to 0
len=${#ass1[@]} #pre-defined len variable to be use in the for loop

for (( i=0; i < $len; i++)) # For loop that add the value of two arrays index by index and printing them in two neatly lined up columns
do
    sum=$(( ${ass1[$i]}+${ass2[$i]} ))
    stunum=$(( $i+1 ))
    printf "%-19s %d\n" "Student_$stunum Result:" "$sum"
done

exit 0
~        