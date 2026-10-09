##!/bin/bash

#check if parameter nr is input
echo "This is your first parameter = $1"

#count nr of processes based on user parameter

for c in {1..5}; do
	echo "Counting the number of processes...:"
	# note the spaces around if [ ]
	#check if user input is a number, if not then display message
	if [ == $c ]; then
		echo "The maximum number of processes has been exceeded..."
	fi
done

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

#ps is a command that lists nr of processes running on machine
# ef are options where "e" is & "f" is 
#the pipe
#wc count the number of processes 
ct=$(ps -ef | wc -l)
echo "There are $ct processes running on this machine"
