#!/bin/bash


PIDS="`ps eaxo etime,pid,comm | egrep "miramsisdn" | grep "[0-9\{1,2}:[0-9\{1,2}:[0-9\{1,2}]" | awk '{print $2}'`"

for i in ${PIDS}; do
  echo "ingreso a realizar proceso"
	echo "Killing $i"
	echo $i | xargs kill -9
done


######################################

#!/bin/bash

PIDS="`ps eaxo bsdtime,pid,comm | egrep "miramsisdn" | grep " 0:" | awk '{print $2}'`"

for i in ${PIDS}; do
  echo "ingreso a realizar proceso"
	echo "$i"
done