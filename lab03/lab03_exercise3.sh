#!/bin/bash

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
message="Time of execution: $timestamp"

if [[ $# != 2 ]]; then
        echo "Input invalid. Please enter two arguments"
        exit 1
elif [[ $1  == 0 ]]; then
	echo "1st argument needs to be a number greater than 0"
	exit 1
elif [[ $2 != 1 && $2 != 2 ]]; then
        echo "2nd argument needs to be either:"
	echo "1 for output to the CLI OR 2 for output to the log file"
        exit 1
elif [[ $2 == 1 ]]; then
	data="Number of parameters is: $#"
	data="User passed $1 into the script" 
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
	echo "Redirecting output to the CLI..."
	echo "$data"
	fi

elif [[ $2 == 2 ]]; then
	echo "Redirecting output to log file..."
	message="User chose option 2 for output to the CLI"
	data="Number of parameters is: $#"
        data="User passed $1 into the script" 
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
	echo $timestamp + $message + $data >>output2.txt
	fi
fi
