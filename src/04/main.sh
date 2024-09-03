#!/bin/bash

source info.sh

if [ $# -eq 0 ]
then
    get_set_color
    get_info $MAIN_BACK_COLOR $MAIN_TEXT_COLOR $BODY_BACK_COLOR $BODY_TEXT_COLOR
else
    echo "This task does not require parameters"
fi

