#!/bin/bash -x

if [ "$1" != "" ]; then
  new_password=$1
  temp_password=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
  /usr/bin/mysqladmin -u root --password=${temp_password} password ${new_password}
else
  echo "No variable provided"
  exit 0
fi
