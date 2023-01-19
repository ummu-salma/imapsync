#!/bin/bash


## Script to intelligently migrate bulk mails.
## Authors: Ummusalma
## Version: 1.0.0 20230119

# Migration users list is passed as a command line argument to this script, file content should be of the following pattern:
# source_username1@example.com;passwd1;destination_username1@example.com;passwd1
# source_username2@example.com;passwd2;destination_username2@example.com;passwd2


# Source and destination mail server setting
SERVER1=SourceServer
SERVER2=DestinationServer

# Select appropriate auth mechanism.
#AUTHMECH1="--authmech1 LOGIN"
#AUTHMECH2="--authmech2 LOGIN"

# Uncomment if you want to start test/dryrun only. No emails will be transfered!
#TESTONLY="--dry"

# Path to imapsync
IMAPSYNC=/usr/bin/imapsync

# Users file
if [ -z "$1" ]
  then
    echo "No users text file given."
  exit
fi

if [ ! -f "$1" ]
  then
    echo "Given users text file \"$1\" does not exist"
  exit
fi

# start loop
{ while IFS=';' read u1 p1 u2 p2; do
    $IMAPSYNC --host1 ${SERVER1} --user1 "$u1" --password1 "$p1" --host2 ${SERVER2} --user2 "$u2" --password2 "$p2" --errorsmax=1000
done ; } < $1
