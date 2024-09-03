#!/bin/bash

source info.sh

function question() {
    read -p "Do you want to write data to a file?(y/n): " ANSWER
    if [[ $ANSWER == 'y'  || $ANSWER == 'Y' ]]
    then
        DATE_NOW=$(date +"%d_%m_%y_%H_%M_%S")
        sys_info > "$DATE_NOW.status"
        echo "The file is saved in $DATE_NOW.status."
    else
        echo "OK, Goodbye)"
    fi
}