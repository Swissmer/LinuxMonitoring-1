#!/bin/bash

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

    echo "HOSTNAME = $HOSTNAME"
    echo "TIMEZONE = $TIMEZONE"
    echo "USER = $USER"
    echo "OS = $OS"
    echo "DATE = $DATE"
    echo "UPTIME = $UPTIME"
    echo "UPTIME_SEC = $UPTIME_SEC"
    echo "IP = $IP"
    echo "MASK = $MASK"
    echo "GATEWAY = $GATEWAY"
    echo "RAM_TOTAL = $RAM_TOTAL GB"
    echo "RAM_USED = $RAM_USED GB"
    echo "RAM_FREE = $RAM_FREE GB"
    echo "SPACE_ROOT = $SPACE_ROOT MB"
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED MB"
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE MB"
}
