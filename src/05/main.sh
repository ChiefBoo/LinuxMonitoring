#!/bin/bash

chmod +r info.sh

. ./info.sh

start_time=$(date +%s)

if [ $# -ne 1 ]
then
	echo "Incorrect number of parameters. Only 1"
elif ! [[ "$1" =~ "/"$ ]]
then
	echo "Path should end with '/'"
elif ! [ -d $1 ]
then
	echo "The $1 directory does not exist"
else
	getinfo $1
	finish_time=$(date +%s)
	echo "Script execution time (in second) = $(( $finish_time - $start_time ))"
fi
