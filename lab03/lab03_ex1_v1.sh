##!/bin/bash

#check if parameter nr is input
echo "This is your first parameter = $1"

#count nr of processes based on user parameter
#$# is the number of parameters

$c = $1
$nr = '^[0-9]+$'


if [ -z = $1]; then
	echo "No parameters passed"

	#check if user input is a number, if not then display message
	#"=~" menas that 
else [$c =~ $nr]; then
		echo "User passed $1 into the script"
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
