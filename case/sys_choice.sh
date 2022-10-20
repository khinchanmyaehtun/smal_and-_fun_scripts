#!/bin/bash
echo
echo "Please choose one of the following options below (a,b,etc)"
echo
echo 'a = Display Data and Time'
echo 'b = List files and Direcries under current dir'
echo 'c = List users logged in'
echo 'd = Check system uptime'
echo 
	read choices
	case $choices in
a) date;;
b) ls;;
c) who;;
d) uptime;;
*) echo "invalid value. Please check again . if it's your choice of value ,BYE!!"
	esac
