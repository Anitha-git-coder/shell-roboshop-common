#!/bin/bash
source ./common.sh

app_name=catalogue
check_root
app_setup
nodejs_setup
systemd_setup

cp $SCRIPT_DIR/mongo.repo /etc/yum.repos.d/mongo.repo 
VALIDATE $? "copy mongo repo"
dnf install mongodb-mongosh -y &>>$LOG_FILE
VALIDATE $? "install mongodb client"
#mongoDB command not linux cmd
INDEX=$(mongosh mongodb.anitha.fun --quiet --eval "db.getMongo().getDBNames().indexOf('catalogue')")
if [ INDEX -ne 0]; then
    mongosh --host $MONGODB_HOST </app/db/master-data.js &>>$LOG_FILE
    VALIDATE $? "load $app_name products"
else 
    echo -e "already loaded $Y skipping $N"
fi

app_restart

print_total_time