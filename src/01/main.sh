#!/bin/bash

if [ $# -eq 1 ]
then
    if [[ $1 =~ ^[.,+,-]?[0-9]+([.][0-9]+)?$ ]]
    then
        echo "Incorrect input! This is number!"
    else
        echo "Parameter value: '$1'"
    fi
else
    echo "Enter one parameter!"
fi