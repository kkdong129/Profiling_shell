#!/bin/bash

#battery_temperature.sh time
echo "temperature: x, x/10 = Celsius degree(℃)" >> batterytemp.txt
increase=0
while [ $increase -lt $1 ];
do
echo -n `date +"%T"` `adb shell dumpsys battery|grep "temperature"` >> batterytemp.txt
sleep 60; #unit: seconds
increase=$(($increase+1))
if [ $increase -eq $1 ];
	then
		echo "" >> batterytemp.txt
		break
fi
done