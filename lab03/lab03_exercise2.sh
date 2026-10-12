#!/bin/bash

	#"=~" compares a string with value of regular expression variable nr
	#[0-9]+$ is a regular expression that matches numbers

#add date/time stamp


if [[ $# != 1 || $1 < 1 ]]; then
	echo "Input invalid. Please enter a number of 1 or greater"
	exit 1
elif [[ $1 =~ ^[0-9]+$ ]]; then
	echo "Number of parameters is: $#"
	echo "User passed $1 into the script"
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
if [ "$ct" > "$1" ]; then
	echo "Counting the number of processes running..."
	echo "There is $ct processes currently running "
	echo "Maximum number of processes exceeded"
else
	echo "Counting the number of processes running..."
	echo "There is $ct processes currently running"
	echo "The maximum number of processes NOT exceeded"
fi
