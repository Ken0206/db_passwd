#!/bin/sh
# watch password file , if password file changed then modify config file
# date : 2019-03-11

password_change() {
  conf_temp="${0%/*}/${RANDOM}.conf.temp"
  new_passwd=$(cat ${password_file})
  grep -v "7,DB2 DB USER PASSWORD" ${conf_file} > ${conf_temp}
  echo "7,DB2 DB USER PASSWORD  :10-${new_passwd}" >> ${conf_temp}
  cat ${conf_temp} > ${conf_file}
  rm -f ${conf_temp}
}


conf_file="${0%/*}/conf_file"
password_file="${0%/*}/password.txt"
original_password=$(cat ${password_file})

while [ True ] ; do
  sleep 1
  new_password=$(cat ${password_file})
  if [ "${original_password}" != "${new_password}" ] ; then
    password_change
    original_password="${new_password}"
  fi
done

