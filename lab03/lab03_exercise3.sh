#!/bin/bash

if [[ $# != 2 ]]; then
        echo "Input invalid. Please enter two arguments"
        exit 1
elif [[ $1 == 0 ]]; then
	echo "1st argument needs to be a number greater than 0"
	exit 1
elif [[ $2 != 1 && $2 != 2 ]]; then
        echo "2nd argument needs to be either:"
	echo "1 for output to the CLI OR 2 for output to the log file"
        exit 1
fi

#count running processes
ct=$(( $(ps -ef | wc -l) -1 ))
if [ "$1" -gt "$ct" ]; then
	data="Counting the number of processes running..."
	data="There is $ct processes currently running "
	data="$1 is greater than $ct"
	data="Maximum number of processes exceeded"
elif [ "$1" -lt "$ct" ]; then
	data="Counting the number of processes running..."
	data="There is $ct processes currently running"
	data="$1 is less than $ct"
	data="The maximum number of processes NOT exceeded"
else
	data="Counting the number of processes running..."
	data="There is $ct processes currently running"
	data="$1 is equal to $ct"
	data="The maximum number of processes NOT exceeded"
fi

#send result to destination as per user argument
if [ $2 == 1 ]; then
	echo "Redirecting output to CLI..."
        message="Number of parameters is: $#"
        message="User passed $1 into the script"
	echo "$message" 
	echo "$data"

else
	echo "Redirecting output to log file..."
	timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
	message="Time of execution: $timestamp"
	message="Number of parameters is: $#"
        message="User passed $1 into the script" 
	echo "$timestamp" >> output2.txt
	echo "$message" >> output2.txt
	echo "$data" >> output2.txt
fi
