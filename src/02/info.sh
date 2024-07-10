#!/bin/bash

function getinfo {
echo "HOSTNAME=$(hostname)"
echo "TIMEZONE=$(cat /etc/timezone) UTC $(date +"%-:::z")"
echo "USER=$(whoami)"
echo "OS=$(uname -s) $(cat /etc/issue | cut -d ' ' -f 1,2)"
echo "DATE=$(date +'%-d %B %Y %T')"
echo "UPTIME=$(uptime -p | cut -b 4-)"
echo "UPTIME_SEC=$(cat /proc/uptime | cut -d ' ' -f 1)"
echo "IP=$(hostname -I)"
echo "MASK=$(ifconfig -a | grep netmask | awk '{print $4}' | head -1)"
echo "GATEWAY=$(ip -4 route | grep "default via" | awk '{print $3}')"
echo "RAM_TOTAL=$(free -m | grep Mem | awk '{printf("%.3f GB", $2/1024)}')"
echo "RAM_USED=$(free -m | grep Mem | awk '{printf("%.3f GB", $3/1024)}')"
echo "RAM_FREE=$(free -m | grep Mem | awk '{printf("%.3f GB", $4/1024)}')"
echo "SPACE_ROOT=$(df / | tail -1 | awk '{printf("%.2f MB", $2/1024)}')"
echo "SPACE_ROOT_USED=$(df / | tail -1 | awk '{printf("%.2f MB", $3/1024)}')"
echo "SPACE_ROOT_FREE=$(df / | tail -1 | awk '{printf("%.2f MB", $4/1024)}')"
}
