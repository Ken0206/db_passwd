#!/bin/sh
# watch password file , if password file changed then modify config file
# date : 2019-07-18

conf_file="${0%/*}/conf_file"
password_file="${0%/*}/password.txt"
original_password=$(cat ${password_file})

while [ True ] ; do
  sleep 1
  new_password=$(cat ${password_file})
  if [ "${original_password}" != "${new_password}" ] ; then
    sed -i "s/7,DB2 DB USER PASSWORD  :10-........../7,DB2 DB USER PASSWORD  :10-${new_password}/g" ${conf_file}
    original_password="${new_password}"
  fi
done

