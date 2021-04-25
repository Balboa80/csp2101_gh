#!/bin/bash

# Pure awk script that test the 2nd column of the text file usrpwords.txt if it has atleast 1 digit, 1 uppercase letter and atleast 8 characters long.
# Afterwards, print the 2nd column omitting the first line with the print requirements based on the test results.
awk -F"[[:space:]]+" 'NR==1 {next} /[0-9]/ && /[A-Z]/ && length($2) >= 8 {print $2" - meets password strength requirements"; next}; {print $2" - does NOT meet password strength requirements"}' usrpwords.txt

exit 0  