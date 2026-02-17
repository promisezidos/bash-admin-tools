#!/bin/bash

date=$(date)
report="health_report.txt"

echo ".....system health report for $date....." >> $report

# cbeck the free storage
echo "storage usage >>" >> $report
df -h | grep "/data" >> $report

# check uotime
echo "System load" >> $report
uptime >> $report

# check if storage is 100% full
# we check if the -df command contains the string "100%" 
if df -h | grep -q "100%"; then
	echo "storage is full!" | tee -a $report
else 
	echo "storage okay!" >> $report
fi

echo "................................................" >> $report
echo "report generated succesfully"
