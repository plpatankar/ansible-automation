#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Syntax: $0 <xxx.pem> <host>";
    exit 1;
fi

key=$1
host=$2

curr_pub_key=`sudo cat ~/.ssh/id_rsa.pub`;

#ssh -i "${key}" ec2-user@${host} "sudo su; if grep -q \"${curr_pub_key}\" ~/.ssh/known_hosts; then; echo 'Key exist already'; else; echo ${curr_pub_key} >> ~/.ssh/known_hosts; fi"
ssh -i "${key}" ec2-user@${host} << EOF
   if grep -q "${curr_pub_key}" ~/.ssh/authorized_keys; then
      echo "Key exist already";
   else
      echo "${curr_pub_key}"| sudo tee -a ~/.ssh/authorized_keys;
   fi
EOF


