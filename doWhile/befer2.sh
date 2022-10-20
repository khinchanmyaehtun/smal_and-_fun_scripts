#!/bin/bash
#donwgrade version of 2.sh and this one needs to call with a num
counter=$1
factorial=1
while [ $counter -gt 0 ]
do
   factorial=$(( factorial * counter ))
   counter=$(( counter - 1 ))
done
echo "$factorial"
