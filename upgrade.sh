#!/bin/bash
cp -r versions/2.0.0/* .
cp versions/Jenkinsfile-v2.0.0 ./Jenkinsfile

APPNAME=$(jq .id config.json | sed 's|.*/||' | sed 's|"||')
echo Upgrading $APPNAME

sed -ie "s@APPNAME@$APPNAME@g;" Jenkinsfile
sed -ie "s@ENV@/prod/microservices@g;" Jenkinsfile 


git add .
git commit -m "Upgraded to version 2.0.0"
git push origin master
