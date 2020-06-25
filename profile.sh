#!/bin/bash
echo "#.Setup"
echo "Connect the USB cable to your computer"
adb wait-for-device
echo "Device is connected"

printf "Please enter a app name to profiling: "
read app_name

adb shell pm list packages ${app_name}
printf "Please enter a app package name above (Exclude 'package:'): "
read app_package_name

adb shell dumpsys package ${app_package_name} | grep userId
printf "Please enter a userId above (only number): "
read userId

printf "Please enter a profiling time (unit: minutes): "
read input_time
let time=input_time

printf "Please enter a delay time (unit: seconds): "
read delay_time

echo "#.Run"
printf "start time (HH:MM:SS) "
date +"%T"
echo "running..."

./memory.sh ${time} ${app_package_name} ${delay_time} &
./cpu.sh ${time} ${app_package_name} ${delay_time} &
./network.sh ${time} ${userId} ${delay_time} &
./battery_temperature.sh ${time} ${delay_time} &

WORK_PID=`jobs -l | awk '{print $2}'`
wait $WORK_PID

printf "end time (HH:MM:SS)   "
date +"%T"

echo "#.Finish"
cat cpuinfo.txt >> Result.txt
cat meminfo.txt >> Result.txt
cat networkinfo.txt >> Result.txt
cat batterytemp.txt >> Result.txt

datetime=`date +%T`
mkdir Result_${datetime}
mv Result.txt Result_${datetime}
rm *.txt

echo "Profiling is done. Please check your Result_(HH:MM:SS) file"