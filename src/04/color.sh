#!/bin/bash

source config.conf

function get_set_color() {
    # Цвета для разработчика!!#
    local column1_background_default=1
    local column1_font_color_default=6
    local column2_background_default=1
    local column2_font_color_default=6
    ###########################

    MAIN_BACK_COLOR=${column1_background:-${column1_background_default}}
    MAIN_TEXT_COLOR=${column1_font_color:-${column1_font_color_default}}
    BODY_BACK_COLOR=${column2_background:-${column2_background_default}}
    BODY_TEXT_COLOR=${column2_font_color:-${column2_font_color_default}}
}

function color_name() {
    case $1 in
    1) echo "white" ;;
    2) echo "red" ;;
    3) echo "green" ;;
    4) echo "blue" ;;
    5) echo "purple" ;;
    6) echo "black" ;;
    esac
}

function set_color_main() {
    local value

    value=$(set_color_back $1)
    MAIN_BACK_MACHINE="\033[${value}m"

    value=$(set_color_text $2)
    MAIN_TEXT_MACHINE="\033[${value}m"

    value=$(set_color_back $3)
    BODY_BACK_MACHINE="\033[${value}m"

    value=$(set_color_text $4)
    BODY_TEXT_MACHINE="\033[${value}m"

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
