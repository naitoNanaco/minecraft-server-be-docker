#!/bin/bash
cat server.properties | grep -v '^#' | sed '/^$/d' | awk -F '=' '{print $1}' | while read line; do export envt=`echo $line | sed -e "s/-/_/g"`; echo "${line}=\${${envt~~}}"; done | envsubst > server.properties
exec "$@"
