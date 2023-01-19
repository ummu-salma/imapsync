#!/bin/bash

# The file mail-users_batch.txt should be of the format:
# source-username1@example.com;passwd1;destination-username1@example.com;passwd1
# source-username2@example.com;passwd2;destination-username2@example.com;passwd2

# Source and destination mail server setting
SERVER1=imap.secureserver.net
SERVER2=198.12.124.178

# Path to imapsync
$IMAPSYNC=/usr/bin/imapsync

# Users file
USERS=mail-users_batch.txt

# Start migration in parallel
parallel --max-procs 10 --delay 1.4 --colsep ';' --arg-file ${USERS} --line-buffer --tagstring "from {1} to {3} : " $IMAPSYNC --host1 ${SERVER1} --user1 {1} --password1 {2} --host2 ${SERVER2} --user2 {3} --password2 {4}  "$@" --simulong 5
