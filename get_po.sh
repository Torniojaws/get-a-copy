#!/bin/sh

# Remote server details
MACHINE=hostname_or_ip
USERNAME=exampleUsername
PASSWORD=examplePassword

# File to get from server
FILE=$1
TARGETDIR=/target/path

# Connect to server directory and get file without prompts
ftp -inv $MACHINE < -EOF-
user $USERNAME $PASSWORD
cd /path/in/server
get $FILE
quit
-EOF-

# Copy file to test name ("filename" will be "filename_test")
cp $FILE ${FILE}_test

# Ask if user wants to copy to target directory
echo "Move to target directory?"
select yn in "Yes" "No"; do
        case $yn in
                Yes ) cp ${FILE}test $TARGETDIR;echo "Copied to target dir";;
                No ) echo "File was not copied to target dir";exit;;
        esac
done
