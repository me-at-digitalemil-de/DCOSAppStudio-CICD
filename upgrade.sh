#!/bin/bash
cp -r versions/2.0.0/* .
cp versions/Jenkinsfile-v2.0.0 ./Jenkinsfile
cp versions/uiservice.json ./uiservice.json

APPNAME=$(jq .id config.json | sed 's|.*/||' | sed 's|"||')
echo Setting CICD up for: $APPNAME

sed -ie "s@APPNAME@$APPNAME@g;"  Jenkinsfile
sed -ie "s@APPNAME@$APPNAME@g;"  uiservice.json
sed -ie "s@ENV@/prod/microservices@g;"  uiservice.json


git add .
git commit -m "Upgraded to version 2.0.0"
git push origin master
