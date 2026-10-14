#!/bin/bash

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
message="Current timestamp: $timestamp"

if [[ $# != 1 || $1 < 1 ]]; then
	message="Input invalid. Please enter a number of 1 or greater"
	exit 1
elif [[ $1 =~ ^[0-9]+$ ]]; then
	echo "Please enter 1 to output the messages to the CLI or 2 for log file output to output.txt"
	if [[ $1 == 1 ]]; then
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
	elif [[ $1 == 2 ]]; then
		$timestamp + $message >>output2.txt
	fi
fi
