#!/bin/bash

function set_color_main() {
    local VALUE

    VALUE=$(set_color_back $1)
    MAIN_BACK_MACHINE="\033[${VALUE}m"

    VALUE=$(set_color_text $2)
    MAIN_TEXT_MACHINE="\033[${VALUE}m"

    VALUE=$(set_color_back $3)
    BODY_BACK_MACHINE="\033[${VALUE}m"

    VALUE=$(set_color_text $4)
    BODY_TEXT_MACHINE="\033[${VALUE}m"

    DEDAULT_COLOR_MACHINE="\033[0m"
}


function set_color_text() {
    local VALUE=0

    case "$1" in
        1) VALUE=37 ;;
        2) VALUE=31 ;;
        3) VALUE=32 ;;
        4) VALUE=34 ;;
        5) VALUE=35 ;;
        6) VALUE=30 ;;
    esac

    echo $VALUE
}

function set_color_back() {
    local VALUE=0

    case "$1" in
        1) VALUE=47 ;;
        2) VALUE=41 ;;
        3) VALUE=42 ;;
        4) VALUE=44 ;;
        5) VALUE=45 ;;
        6) VALUE=40 ;;
    esac

    echo $VALUE
}