#!/bin/bash

#cpu.sh time
increase=0
while [ $increase -lt $1 ];
do
echo -n `date +"%T"` `adb shell top -n 1 -d 1 | grep $2` >> cpuinfo.txt
sleep 60; #unit: seconds
increase=$(($increase+1))
if [ $increase -eq $1 ];
	then
		echo "" >> cpuinfo.txt
		break
fi
done