#!/bin/bash
month_number=$1

#check whether empty string or not
if [ -z $month_number ] 
then
        echo "No month number is given.Please enter a month number as a commmad line argument."
        echo "eg./print-month-nubmer 5"
	exit
fi

#check whether input is within the range of month.
if [[ $month_number -lt 1 || $month_number -gt 12 ]]
then
        echo "Invalid month number given . Please enter a valid number 1 to 12."
	exit
fi

#check the num and map 
if [ $month_number -eq 1 ]
then 
        echo "January"
elif [ $month_number -eq 2 ]
then
        echo "February"
elif [ $month_number -eq 3 ]
then 
        echo "March"
elif [ $month_number -eq 4 ]
then
        echo "April"
elif [ $month_number -eq 5 ]
then
        echo "May"
elif [ $month_number -eq 6 ]
then 
        echo "June"
elif [ $month_number -eq 7 ]
then
        echo "July"
elif [ $month_number -eq 8 ]
then 
        echo "August"
elif [ $month_number -eq 9 ]
then
        echo "September"
elif [ $month_number -eq 10 ]
then
        echo  "October"
elif [ $month_number -eq 11 ]
then
        echo "November"
else 
        echo December
#elif [ $month_number -eq 12]
#then
#echo December
fi
