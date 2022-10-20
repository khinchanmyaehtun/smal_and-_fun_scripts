#!/bin/bash
#Date: 15/10/2022
#Author: khinchanmyaehtun@gmail.com
#Descirption: simple calculator script with fuction to modulize.

function read_numbers() {
	read -p "Enter Number1: " number1
	read -p "Enter Number2: " number2
}
while true
do
  echo "1. Add"
  echo "2. Subtract"
  echo "3. Multiply"
  echo "4. Divide"
  echo "5. Average"
  echo "6. Quit"

  read -p "Enter your choice: " choice

  case $choice in
        1) 
	   read_numbers
           echo Answer=$(( $number1 + $number2 ))
           ;;
        2) 
	   read_numbers
           echo Answer=$(( $number1 - $number2 ))
           ;;
        3)
           read_numbers
	   echo Answer=$(( $number1 * $number2 ))
           ;;
        4)   
           read_numbers
	   echo Answer=$(( $number1 / $number2 ))
           ;;
        5) 
           read_numbers
           sum=$(( number1 + number2 ))
           echo Answer=$(echo "$sum / 2" | bc -l)
           ;;
        6)
           break
           ;;

   esac
done
