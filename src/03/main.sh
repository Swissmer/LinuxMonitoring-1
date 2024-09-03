#!/bin/bash

source info.sh
source color.sh

PROV="^[1-6]$"

if [ $# -eq 4 ] 
then
    get_info $1 $2 $3 $4
else 
    echo "Incorrect number of variables (need 4)"
fi