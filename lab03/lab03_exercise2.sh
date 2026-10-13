#!/bin/bash

	#"=~" compares a string with value of regular expression variable nr
	#[0-9]+$ is a regular expression that matches numbers

#date/time stamp


if [[ $# != 1 || $1 < 1 ]]; then
	echo "Input invalid. Please enter a number of 1 or greater" >>output.txt
	exit 1
elif [[ $1 =~ ^[0-9]+$ ]]; then
	echo "Number of parameters is: $#" >>output.txt
	echo "User passed $1 into the script" >>output.txt
fi

#ps is a command that lists processes running on machine
# "-ef" are options where "e" selects all processes & "f"  
#"wc" counts the number of processes 
# "-l" option  prints newline counts
#result is stored in "ct"

ct=$(( $(ps -ef | wc -l) -1 ))
#can also do: 
#ct = $(( $(ps -ef | wc -l) -1)) to be more accurate

#if number of processes counted is more than the user parameter
if [ "$1" -gt "$ct" ]; then
	echo "Counting the number of processes running..." >>output.xt
	echo "There is $ct processes currently running " >>output.txt
	echo "$1 is greater than $ct" >>output.txt
	echo "Maximum number of processes exceeded" >>output.txt
elif [ "$1" -lt "$ct" ]; then
	echo "Counting the number of processes running..." >>output.txt
	echo "There is $ct processes currently running" >>output.txt
	echo "$1 is less than $ct" >>output.txt
	echo "The maximum number of processes NOT exceeded" >>output.txt
else

	echo "COunting the number of processes running..." >>output.txt
	echo "There is $ct processes currently running" >>output.txt
	echo "$1 is equal to $ct" >>output.txt
	echo "The maximum number of processes NOT exceeded" >>output.txt
fi
