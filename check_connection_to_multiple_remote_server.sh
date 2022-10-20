#!/bin/bash
# Author : khinchanmyaehtun@gmail.com
# Date   : 14/10/2022
# Description : The script will ping Multiple remote servers and show results.
# callout : don't forget to change path for hosts file.

hosts="/Users/lucy/scripts/hostslist"
for ip in $(cat $hosts)
do 
	ping -c1 $ip  &> /dev/null
	if [ $? -eq 0 ] #if ping successful
		then
			echo $hosts is reachable.
		else
			echo $hosts is NOT reachable.
	fi
done
