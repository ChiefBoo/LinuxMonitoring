#!/bin/bash

chmod +r info.sh

. ./info.sh

if [ -n "$1" ]
then
	echo "No arguments needed"
else
	getinfo
	echo -n "Would you like to save this information? (Y/N)"
	read ans
	if [ "$ans" = "Y" ] || [ "$ans" = "y" ]
	then
		getinfo > $(date +"%d_%m_%y_%H_%M_%S").status
		echo "File created and saved"
	fi
fi
