#!/bin/bash

#network.sh time 
increase=0
while [ $increase -lt $1 ];
do
echo `adb shell cat /proc/net/xt_qtaguid/stats | grep $2` `date +"%T"` >> networkinfo.txt
sleep 60; #unit: seconds
increase=$(($increase+1))
if [ $increase -eq $1 ];
	then
		echo "" >> networkinfo.txt
		break
fi
done