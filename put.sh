#!/bin/bash - 
set -o nounset                              # Treat unset variables as an error

IP=${1-127.0.0.1}
PORT=${2-8080}
MSG=${3-DefaultMSG}

curl -H "Accept: application/json" -H "Content-Type: application/json" -X PUT -d "{$MSG}" http://$IP:$PORT/rest-jcache/webresources/cache?key=test
