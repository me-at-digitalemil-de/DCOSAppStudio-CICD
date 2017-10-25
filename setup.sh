#!/bin/bash
APPNAME=$(jq .id $1 | sed 's|.*/||' | sed 's|"||')
echo Setting CICD up for: $APPNAME

