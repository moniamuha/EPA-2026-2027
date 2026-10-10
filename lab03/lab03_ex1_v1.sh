#!/bin/bash


nr = '^[0-9]+$'

if [ $# == 0 ]; then
	echo "Invalid input. Please enter a number of 1 or greater"
exit
	#check if user input is a number, if not then display message
	#"=~" compares a string with value of regular expression variable nr 
elif [ $# -eq 1 || $# -gt 1]; then
	echo "Number of parameters is $#"
	echo "User passed $1 into the script"
elif [[$1 =~ $nr ]]; then
	echo "Countign number of processes running..."
fi

#ps is a command that lists processes running on machine
# ef are options where "e" is & "f" is 
#wc count the number of processes 
# -l option 
#result is stored in ct

ct = $(ps -e | wc -l)

if [ "$ct" -gt "$1" ]; then
	echo "Maximum number of processes exceeded"
exit
else
	echo "The maximum number of processes NOT exceeded"
fi
