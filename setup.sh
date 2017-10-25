#!/bin/bash
cp "$1" ./config.json
echo $1

APPNAME=$(jq .id ./config.json | sed 's|.*/||' | sed 's|"||')
echo Setting CICD up for: $APPNAME




