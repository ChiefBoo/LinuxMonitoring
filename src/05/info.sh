#!/bin/bash

function getinfo {
# total folders
echo "Total number of folders (including allnested ones) = $(find $1* -type d 2>/dev/null | wc -l)"
# top 5 max folders
echo "TOP 5 folders of maximum size arranged in descending order (path ans size):"
echo "$(find $1* -type d -exec du -Sh {} + 2>/dev/null | sort -rh | head -5 | awk '{print NR " - " $2 "/, " $1}')"
# total files
echo "Total number of files = $(find $1* -type f 2>/dev/null | wc -l)"
# total diff. types
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(find $1 2>/dev/null -type f -iname "*.conf" | wc -l)"
echo "Text files = $(find $1 2>/dev/null -type f -iname "*.txt" | wc -l)"
echo "Executable files = $(find $1 2>/dev/null -type f -executable | wc -l)"
echo "Log files (with the extension .log) = $(find $1 2>/dev/null -type f -iname "*.log" | wc -l)"
echo "Archive files = $(find $1 2>/dev/null -type f -regextype egrep -iregex '.*\.(zip|7z|iso|cpio|ar&|tar(|\.[gx]z|.bz2)|tgz|tbz2)' | wc -l)"
echo "Symbolic links = $(find $1 2>/dev/null -type l | wc -l)"
# top 10 max files
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
top10files $1
# top 10 exe
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
top10exec $1
}

function top10files {
for (( i=1; i<=10; i++ ))
do
	file=$(find $1 -type f -exec du -Sh {} + 2>/dev/null | sort -rh | head -10 | sed "${i}q;d")
	if ! [[ -z $file ]]
	then
		echo -n "$i - "
		echo -n "$(echo $file | awk '{print $2}'), "
		echo -n "$(echo $file | awk '{print $1}'), "
		echo -n "$(echo $file | grep -m 1 -o -E "\.[^/.]+$" | awk -F . '{print $2}')"
		echo  ", $(file -b $(echo $file | awk '{print $2}') | sed 's/,.*//')"
	fi
done
}

function top10exec {
for (( i=1; i<=10; i++ ))
do
	file=$(find $1 -type f -executable -exec du  -Sh {} + 2>/dev/null | sort -rh | head -10 | sed "${i}q;d")
	if ! [[ -z $file ]]
	then
		echo -n "$i - "
		echo -n "$(echo $file | awk '{print $2}'), "
		echo -n "$(echo $file | awk '{print $1}'), "
		echo "$(md5sum $(echo $file | awk '{print $2}') | awk '{print $1}')"
	fi
done
}
