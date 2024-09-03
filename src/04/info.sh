#!/bin/bash

source color.sh

function get_info() {
    local PROV="^([1-6])$"

    if [[ $1 =~ $PROV && $2 =~ $PROV && $3 =~ $PROV && $4 =~ $PROV ]]
    then
        if [[ $1 != $2 && $3 != $4 ]]
        then
            sys_info $1 $2 $3 $4
            color_info
        else 
            echo "The font and background colors of the same column must not match."
        fi
    else
        echo "Incorrect settings .conf"
    fi
}

function sys_info() {
    HOSTNAME=$(hostname)
    TIMEZONE="`cat /etc/timezone` "UTC" `date "+%z"`"
    USER=$(whoami)
    OS=$(hostnamectl | grep 'Operating System' | awk '{print $3,$4,$5}')
    DATE=$(date +"%d %b %Y %H:%M:%S")
    UPTIME=$(uptime -p)
    UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
    IP=$(hostname -I)
    MASK=$(ifconfig lo | grep 'inet ' | awk '{print $4}')
    GATEWAY=$(ip r | grep default | awk '{print $3}')
    RAM_TOTAL=$(free | grep Mem | awk '{printf "%0.3f\n", $2/1024/1024}')
    RAM_USED=$(free | grep Mem | awk '{printf "%0.3f\n", $3/1024/1024}')
    RAM_FREE=$(free | grep Mem | awk '{printf "%0.3f\n", $4/1024/1024}')
    SPACE_ROOT=$(df /root/ | grep dev | awk '{printf "%.2f\n", $2/1024}')
    SPACE_ROOT_USED=$(df /root/ | grep dev | awk '{printf "%.2f\n", $3/1024}')
    SPACE_ROOT_FREE=$(df /root/ | grep dev | awk '{printf "%.2f\n", $4/1024}')

    set_color_main $1 $2 $3 $4

    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}HOSTNAME${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$HOSTNAME${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}TIMEZONE${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$TIMEZONE${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}USER${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$USER${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}OS${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$OS${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}DATE${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$DATE${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}UPTIME${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$UPTIME${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}UPTIME_SEC${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$UPTIME_SEC${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}IP${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$IP${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}MASK${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$MASK${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}GATEWAY${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$GATEWAY${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}RAM_TOTAL${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$RAM_TOTAL GB${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}RAM_USED${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$RAM_USED GB${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}RAM_FREE${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$RAM_FREE GB${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}SPACE_ROOT${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$SPACE_ROOT MB${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}SPACE_ROOT_USED${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$SPACE_ROOT_USED MB${DEDAULT_COLOR_MACHINE}"
    echo -e "${MAIN_BACK_MACHINE}${MAIN_TEXT_MACHINE}SPACE_ROOT_FREE${DEDAULT_COLOR_MACHINE} = ${BODY_BACK_MACHINE}${BODY_TEXT_MACHINE}$SPACE_ROOT_FREE MB${DEDAULT_COLOR_MACHINE}"
}

function color_info() {
    column1_background=${column1_background:-"default"}
    column1_font_color=${column1_font_color:-"default"}
    column2_background=${column2_background:-"default"}
    column2_font_color=${column2_font_color:-"default"}

    echo -e "\nColumn 1 background = $column1_background ($(color_name $MAIN_BACK_COLOR))"
    echo "Column 1 font color = $column1_font_color ($(color_name $MAIN_TEXT_COLOR))"
    echo "Column 2 background = $column2_background ($(color_name $BODY_BACK_COLOR))"
    echo "Column 2 font color = $column2_font_color ($(color_name $BODY_TEXT_COLOR))"
}

