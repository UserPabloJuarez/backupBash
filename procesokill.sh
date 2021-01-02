#!/bin/bash
# This script will kill process which running more than X hours
# egrep: the selected process; grep: hours
PIDS="`ps eaxo bsdtime,pid,comm | egrep "miramsisdn" | grep " 0:" | awk '{print $2}'`"
# Kill the process
echo "Killing miramsisdn processes running more than one hour..."

for i in ${PIDS}; do
  echo $i | xargs kill -9
done

