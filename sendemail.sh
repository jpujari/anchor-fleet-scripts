#!/bin/bash

EMAIL_ADDRESS="test@test.com"

echo -n "enter the environment > "
read environment

echo -n "enter the previous release > "
read release1

echo -n "enter the current release > "
read release2

cd /oyomage

git fetch;

releasenotes=$(git log --pretty=%s $release1..$release2)
branchesmerged=$(git log --pretty=%s $release1..$release2 | grep "Merged")


mailContent=$(cat <<- EOF
Code was deployed to $environment. Cache was cleared and DB is reindexed.

Release Id: $release2

Release Notes:

$releasenotes

Branches Merged:

$branchesmerged
EOF
)

#echo $mailContent
mail -s "code deployment - $environment" $EMAIL_ADDRESS <<< "$mailContent"

echo "done" 



