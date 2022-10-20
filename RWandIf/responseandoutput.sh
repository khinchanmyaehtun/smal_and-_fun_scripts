#!/bin/bash
clear
echo 
echo "What is your name?"
read a
echo 
echo "Hello $a , Sir"
echo
echo "Do you like IT?(y/n)"
read   like
echo 
if  [ "$like" == y ]
then
	echo You are cool!!!
elif [ "$like" == n ]
then
	echo You should try some time 
echo 
fi
