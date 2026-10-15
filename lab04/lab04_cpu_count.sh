#!/bin/bash

#script to count nr of cpu cores
#if fewer than $1, print an error & exit

#COMMAND TO SEE NR OF CPU CORES
#nproc --all


#grep command 
#grep -c processor /proc/cpuinfo


if [ $# != 1 ]; then
	echo "Please provide one argument"
	exit 1
elif [[ $1 =~ [^0-9] || $1 =~ ^[-][0-9] ]]; then
	echo "The argument needs to be a positive number"
	exit 1
elif [[ $1 =~ ^[0-9]*$ ]]; then
	echo "User provided $1 as the argument"
fi

num_cpu = $(grep -c processor /proc/cpuinfo | wc)
echo $num_cpu
if [ $1 -gt $num_cpu ]; then
	echo "ERROR"
	exit 1
else
	echo "OK"
	exit 1
