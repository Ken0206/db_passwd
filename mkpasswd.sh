#!/bin/sh
while [ True ] ; do
  clear
  tr -dc A-Za-z0-9 < /dev/urandom | head -c 10 | xargs | tee ${0%/*}/password.txt
  sleep 4
done
