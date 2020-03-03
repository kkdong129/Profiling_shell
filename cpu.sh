#!/bin/bash

#cpu.sh time
increase=0
while [ $increase -lt $1 ];
do
echo `adb shell top -n 1 -d 1 | findstr $2` , `date +"%T"` >> cpuinfo.txt
sleep 60; #unit: seconds
increase=$(($increase+1))
if [ $increase -eq $1 ];
	then
		break
fi
done