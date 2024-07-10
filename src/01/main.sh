#!/bin/bash

reg='^[+-]?[0-9]+([.][0-9]+)?$'

if [ $# -ne 1 ]
then
	echo "Incorrect number of parameters"
elif [[ $1 =~ $reg ]]
then
	echo "Incorrect parameter input"
else
	echo $1
fi
