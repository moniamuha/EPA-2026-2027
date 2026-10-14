#!/bin/bash

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
message="Time of execution: $timestamp"

if [[ $# != 2 ]]; then
        echo "Input invalid. Please enter two arguments"
        exit 1
elif [[ $1  == 0 && ($2 != 1 || $2 != 2 ) ]]; then
	echo "1st argument needs to be a number greater than 0"
        echo "2nd argument needs to be either:"
	echo "1 for output to the CLI OR 2 for output to the log file"
        exit 1
elif [[ $2 == 1 ]]; then
	echo "User chose option 1 for output to the CLI"
	message="Number of parameters is: $#"
	message="User passed $1 into the script" 
	ct=$(( $(ps -ef | wc -l) -1 ))
	if [ "$1" -gt "$ct" ]; then
		message="Counting the number of processes running..."
		message="There is $ct processes currently running "
		message="$1 is greater than $ct"
		message="Maximum number of processes exceeded"
	elif [ "$1" -lt "$ct" ]; then
		message="Counting the number of processes running..."
		message="There is $ct processes currently running"
		message="$1 is less than $ct"
		message="The maximum number of processes NOT exceeded"
	else
	message="Counting the number of processes running..."
	message="There is $ct processes currently running"
	message="$1 is equal to $ct"
	message="The maximum number of processes NOT exceeded"
	fi
elif [[ $2 == 2 ]]; then
	message="User chose option 2 for output to the CLI"
	echo $timestamp + $message >>output2.txt
fi
