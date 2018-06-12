#!/bin/bash

# get pach.sh path
unpack=`find / -name unpack.sh 2>/dev/null | grep -w unpack.sh| head -1`

if [ $(echo $unpack|awk -F / '{ print $NF "#"}') != "unpack.sh#" ]; then
#   echo "Did not find unpack.sh for unpacking.."
   exit 1
fi

#### main ####

echo "$unpack"

