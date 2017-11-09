#!/bin/bash
cp -r versions/1.0.0/* .
cp versions/Jenkinsfile-v1.0.0 ./Jenkinsfile

APPNAME=$(jq .id config.json | sed 's|.*/||' | sed 's|"||')
echo Downgrading: $APPNAME

sed -ie "s@APPNAME@$APPNAME@g;" Jenkinsfile
sed -ie "s@ENV@/prod/microservices@g;" Jenkinsfile 

git add .
git commit -m "Downgraded to version 1.0.0"
git push origin master
