#!/bin/bash
echo type the number
read random
echo "let me check $random is 100 or not"
if [ $random -eq 100 ]
then 
    echo Number is 100
else 
    echo Number i not 100
fi

