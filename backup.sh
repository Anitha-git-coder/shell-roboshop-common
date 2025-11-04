#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-roboshop"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log
START_TIME=$(date +%s)
SCRIPT_DIR=$PWD # for absoulute path
MONGODB_HOST=mongodb.anitha.fun
MYSQL_HOST=mysql.anitha.fun

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

 if [ $USERID -ne 0 ]; then
        echo "ERROR:: Please run this script with root privelege"
        exit 1 # failure is other than 0
    fi

    USAGE(){
       echo "USAGE:: sudo sh backup.sh <source> <destination> <days>[optional default 14 days]"
       exit 1
    }

    #if 2 parameters are passed or not 
    if [ $# -lt 2 ]; then
       USAGE
    fi