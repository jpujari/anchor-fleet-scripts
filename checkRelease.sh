#!/bin/bash

shopt -s expand_aliases
source ~/.profile

#Update with your phone number address or  email address
PHONE_NUMBER=1234561234@txt.att.net

echo "1.Release Creation"
echo "2.Release Activation"

read -p "What do you need?  > " entry

case $entry in
 1 ) if fleet release list | grep -q "CREATING"; then
        echo "not done yet"
     else
        echo "release creation done" | mail -s "release creation" $PHONE_NUMBER
     fi
     ;;
 2 ) if fleet release env describe prod | grep -q "ACTIVATING"; then
        echo "not activated yet"
     else
        echo "release is activated" |  mail -s "release activation" $PHONE_NUMBER 
     fi
     ;;
esac 
