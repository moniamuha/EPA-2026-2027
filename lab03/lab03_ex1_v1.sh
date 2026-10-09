##!/bin/bash

#check if parameter nr is input
echo "This is your first parameter = $1"

#count nr of processes based on user parameter
#$# is the number of parameter

c = $1
nr = '^[0-9]+$'

if [$# -eq 0 || ]; then
	echo "Error: the number of paramaters is too small"
	exit
else
	echo "Counting the number of processes..."

	#check if user input is a number, if not then display message
	if [$c =~ $nr]; then
		echo "The maximum number of processes has been exceeded..."
fi

# how do we pass parameters from the command line
# into this bash script. 
# we use the notation $1, $2 etc to represent
# the first, second etc parameter into this script
if [ -z $1 ]; then
	echo "You didn't pass any parameters to $0"
else
	echo "You passed in $1 to $0"
fi

# heres a brand new command: 
# it calls ps -ef, then pipes it into word counter
# then stores the result in ct

#ps is a command that lists processes running on machine
# ef are options where "e" is & "f" is 
#wc count the number of processes 
# -l option 

ct=$(ps -ef | wc -l)

if ["ct" -gt "$1"]; then
	echo "Running command to count nr of processes..."
	
elif ["ct" -lt "$1"]; then
	echo "There are $ct processes running on this machine"
