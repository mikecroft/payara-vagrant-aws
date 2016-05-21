#!/bin/bash - 
set -o nounset                              # Treat unset variables as an error

IP=${1-127.0.0.1}
PORT=${2-8080}

curl http://$IP:$PORT/rest-jcache/webresources/cache?key=test

