#!/bin/bash

#memory.sh time
adb shell dumpsys meminfo | findstr "Total RAM" >> meminfo.txt
increase=0
while [ $increase -lt $1 ];
do
echo `adb shell dumpsys meminfo $2 | findstr "TOTAL"` , `date +"%T"` >> meminfo.txt
sleep 60; #unit: seconds
increase=$(($increase+1))
if [ $increase -eq $1 ];
	then
		break
fi
done