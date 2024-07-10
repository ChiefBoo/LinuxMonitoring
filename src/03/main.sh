#!/bin/bash

chmod +r info.sh

. ./info.sh

reg='^[1-6]$'

if [ $# -eq 4 ]
then
	for param in $@
	do
		if ! [[ $param =~ $reg ]]
		then
			echo "Incorrect parameter input (1-6)"
			exit 1
		fi
	done
	if [ $1 -eq $2 ] || [ $3 -eq $4 ]
	then
		echo "The font and background colors of the same column must not match. Please restart the script"
	else
		colors=$(colorinfo $1 $2 $3 $4)
		getinfo $colors
	fi
else
	echo "Incorrect number of parameters (Only 4)"
fi
