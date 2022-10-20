#!/bin/bash
clear
if [ -e $HOME/error.txt ]
then
    echo "File exist"
else
    echo "File does not exist"
fi
