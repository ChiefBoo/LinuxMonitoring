#!/bin/bash

fwhite='\033[37m'; fred='\033[31m'; fgreen='\033[32m'; fblue='\033[34m'; fpurple='\033[35m'; fblack='\033[30m'
bwhite='\033[47m'; bred='\033[41m'; bgreen='\033[42m'; bblue='\033[44m'; bpurple='\033[45m'; bblack='\033[40m'

endcolor='\033[0m'

function getinfo {
echo -e "$1$2HOSTNAME$endcolor=$3$4$(hostname)$endcolor"
echo -e "$1$2TIMEZONE$endcolor=$3$4$(cat /etc/timezone) UTC $(date +"%-:::z")$endcolor"
echo -e "$1$2USER$endcolor=$3$4$(whoami)$endcolor"
echo -e "$1$2OS$endcolor=$3$4$(uname -s) $(cat /etc/issue | cut -d ' ' -f 1,2)$endcolor"
echo -e "$1$2DATE$endcolor=$3$4$(date +'%-d %B %Y %T')$endcolor"
echo -e "$1$2UPTIME$endcolor=$3$4$(uptime -p | cut -b 4-)$endcolor"
echo -e "$1$2UPTIME_SEC$endcolor=$3$4$(cat /proc/uptime | cut -d ' ' -f 1)$endcolor"
echo -e "$1$2IP$endcolor=$3$4$(hostname -I)$endcolor"
echo -e "$1$2MASK$endcolor=$3$4$(ifconfig -a | grep netmask | awk '{print $4}' | head -1)$endcolor"
echo -e "$1$2GATEWAY$endcolor=$3$4$(ip -4 route | grep "default via" | awk '{print $3}')$endcolor"
echo -e "$1$2RAM_TOTAL$endcolor=$3$4$(free -m | grep Mem | awk '{printf("%.3f GB", $2/1024)}')$endcolor"
echo -e "$1$2RAM_USED$endcolor=$3$4$(free -m | grep Mem | awk '{printf("%.3f GB", $3/1024)}')$endcolor"
echo -e "$1$2RAM_FREE$endcolor=$3$4$(free -m | grep Mem | awk '{printf("%.3f GB", $4/1024)}')$endcolor"
echo -e "$1$2SPACE_ROOT$endcolor=$3$4$(df / | tail -1 | awk '{printf("%.2f MB", $2/1024)}')$endcolor"
echo -e "$1$2SPACE_ROOT_USED$endcolor=$3$4$(df / | tail -1 | awk '{printf("%.2f MB", $3/1024)}')$endcolor"
echo -e "$1$2SPACE_ROOT_FREE$endcolor=$3$4$(df / | tail -1 | awk '{printf("%.2f MB", $4/1024)}')$endcolor"
}

function colorinfo {

case "$1" in
	"1") echo $bwhite;;
	"2") echo $bred;;
	"3") echo $bgreen;;
	"4") echo $bblue;;
	"5") echo $bpurple;;
	"6") echo $bblack;;
esac

case "$2" in
	"1") echo $fwhite;;
	"2") echo $fred;;
	"3") echo $fgreen;;
	"4") echo $fblue;;
	"5") echo $fpurple;;
	"6") echo $fblack;;
esac

case "$3" in
	"1") echo $bwhite;;
	"2") echo $bred;;
	"3") echo $bgreen;;
	"4") echo $bblue;;
	"5") echo $bpurple;;
	"6") echo $bblack;;
esac

case "$4" in
	"1") echo $fwhite;;
	"2") echo $fred;;
	"3") echo $fgreen;;
	"4") echo $fblue;;
	"5") echo $fpurple;;
	"6") echo $fblack;;
esac

}

function getcolor {
if [ $2 -eq 1 ]
then
	echo -n "$1 "
else
	echo -n "default "
fi
case "$1" in
	"1") color="(white)";;
	"2") color="(red)";;
	"3") color="(green)";;
	"4") color="(blue)";;
	"5") color="(purple)";;
	"6") color="(black)";;
esac
echo $color
}
