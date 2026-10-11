#!/bin/bash

	#"=~" compares a string with value of regular expression variable nr
	#[0-9]+$ is a regular expression that matches 
if [[ $# -ne 1 ||! $1 =~ ^[0-9]+$ ]]; then
	echo "Number of parameters is $#"
	echo "User passed $1 into the script"
	echo "Counting number of processes running..."
	exit 1
fi

#ps is a command that lists processes running on machine
# ef are options where "e" selects all processes & "f"  
#wc counts the number of processes 
# -l option  prints newline counts
#result is stored in ct

ct=$(ps -e | wc -l)
#can also do: 
#ct = $(( $(ps -ef | wc -l) -1)) to be more accurate

#if number of processes counted is more than the user parameter
if [ "$ct" -gt "$1" ]; then
	echo "Maximum number of processes exceeded"
else
	echo "The maximum number of processes NOT exceeded"
fi
