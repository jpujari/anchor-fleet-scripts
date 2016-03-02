#!/bin/bash
printf "Enter the release branch name and press enter\n"
read branch_name
printf "The branch name entered is $branch_name\n"

command -v fleet >/dev/null 2>&1 || { echo >&2 "I require fleet but it's not installed.  Aborting."; exit 1; }

result=`fleet release create $branch_name`

printf "$result\n"


