#!/bin/bash

source info.sh

START_DATE=$(date +%s)

if [ $# -eq 1 ]
then
    if [[ $1 == */ ]]
    then
        if [[ -d $1 ]]
        then
            get_info $1
            END_DATE=$(date +%s)
            echo "Script execution time (in seconds) = "$(($END_DATE - $START_DATE))
        else
            echo "$0: no such file or directory: $1"
        fi
    else
        echo "$0: parameter does not end with '/'"
    fi
else
    echo "$0: enter one parameter!"
fi