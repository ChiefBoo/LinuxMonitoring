#!/bin/bash

chmod +r info.sh
chmod +r colors.conf

if [ ! -e colors.conf ]
then
	echo "There is no configuration file - colors.conf"
	exit 1
fi

. ./info.sh
source colors.conf

reg='^[1-6]$'

if [ -n "$1" ]
then
	echo "No arguments needed. Use configuration file - colors.conf"
else
	if ([[ $column1_background =~ $reg ]] && [ $column1_background ])
	then 
		back1=$column1_background
		par1=1
	else
		back1=6
		par1=0
	fi
	if ([[ $column1_font_color =~ $reg ]] && [ $column1_font_color ])
	then
		font1=$column1_font_color
		par2=1
	else
		font1=1
		par2=0
	fi
	if ([[ $column2_background =~ $reg ]] && [ $column2_background ])
	then 
		back2=$column2_background
		par3=1
	else
		back2=6
		par3=0
	fi
	if ([[ $column2_font_color =~ $reg ]] && [ $column2_font_color ])
	then
		font2=$column2_font_color
		par4=1
	else
		font2=1
		par4=0
	fi
	if [ $back1 -eq $font1 ] || [ $back2 -eq $font2 ] 
	then
		echo "The font and background colors ot the same column must not match. Please fix colors.conf and restart the script. Default colors 6 1 6 1"
	else
		colors=$(colorinfo $back1 $font1 $back2 $font2)
		getinfo $colors
		echo ""
		echo "Column 1 background = $(getcolor $back1 $par1)"
		echo "Column 1 font color = $(getcolor $font1 $par2)"
		echo "Column 2 background = $(getcolor $back2 $par3)"
		echo "Column 2 font color = $(getcolor $font2 $par4)"
	fi
fi
