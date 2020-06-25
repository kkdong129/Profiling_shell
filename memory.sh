#!/bin/bash

#memory.sh time
adb shell dumpsys meminfo | grep "Total RAM" >> meminfo.txt
increase=0
while [ $increase -lt $1 ];
do
echo -n `date +"%T"` `adb shell dumpsys meminfo $2 | grep "TOTAL"` >> meminfo.txt
sleep 60; #unit: seconds
increase=$(($increase+1))
if [ $increase -eq $1 ];
	then
		echo "" >> meminfo.txt
		break
fi
done