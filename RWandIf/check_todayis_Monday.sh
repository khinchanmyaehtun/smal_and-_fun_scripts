#!/bin/bash
a=`date | awk '{print $1}'`
if [ "$a" == Mon ] 
then 
	echo Today is $a, 4 more days to go.
elif [ "$a" == Wed ]
then 
	echo Today is $a, best of luck.
else
	echo Today is Monday nor Wed ｡^‿^｡ is gonna be amazing!!!!
fi

