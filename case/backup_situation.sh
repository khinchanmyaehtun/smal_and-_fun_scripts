#!/bin/bash
#show the current day and state of the backup 

NOW=$(date +"%a")
case $NOW in 
	Mon)
		echo "Ready to load fullbackup but only @ midnight";;
	Tue|Wed|Thu|Fri)
		echo "Partial Backup is performed daily @ midngiht";;
	Sat|Sun)
		echo "No Backup";;
esac
