#!/bin/bash
#script to run less then or equal to 5 times
c=1
while [ $c -le 5 ]
do
	echo "Welcome $c times"
	c=$(($c + 1))  #((c++))
done
