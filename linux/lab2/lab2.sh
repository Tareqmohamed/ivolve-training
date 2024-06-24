#!/bin/bash

THRESHOLD=90

EMAIL="tareqma7md@gmail.com"
From="telmagic10@gmail.com" 

SUBJECT="Disk Usage Alert"

TEMP_FILE="./lab2-log.log"

MSMTP="/usr/bin/msmtp"
MSMTP_CONFIG="$HOME/.msmtprc"

df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  usage=$(echo $output | awk '{ print $1}' | sed 's/%//g')
  partition=$(echo $output | awk '{ print $2 }')
  
  if [ $usage -ge $THRESHOLD ]; then
    echo "Running out of space \"$partition ($usage%)\" on $(hostname) as on $(date)" >> $TEMP_FILE
  fi
done

if [ -f $TEMP_FILE ]; then
  cat $TEMP_FILE | msmtp -C $MSMTP_CONFIG $EMAIL <<EOF

Subject: $SUBJECT
$(cat $TEMP_FILE)
EOF
  rm $TEMP_FILE
fi