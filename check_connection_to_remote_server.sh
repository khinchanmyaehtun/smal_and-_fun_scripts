#!/bin/bash
# Author : khinchanmyaehtun@gmail.com
# Date   : 14/10/2022
# Description : The script will ping a remote server and notigy.
# callout : don't forget to change the ip

hosts="192.168.1.1"
ping -c1 $hosts  &> /dev/null
	if [ $? -eq 0 ] #if ping successful
		then
			echo $hosts is reachable.
		else
			echo $hosts is NOT reachable.
	fi
