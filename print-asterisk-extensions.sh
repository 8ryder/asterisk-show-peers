#!/bin/bash

start="199"
end="350"

echo > /tmp/script.log

while [ $start -lt $end ]
	do
  command="sip show peer $start"
  /usr/sbin/asterisk -rx "$command" | grep Callerid >> /tmp/script.log
  /usr/sbin/asterisk -rx "$command" | grep Useragent >> /tmp/script.log
  /usr/sbin/asterisk -rx "$command" | grep Addr->IP >> /tmp/script.log
  /usr/sbin/asterisk -rx "$command" | grep Status >> /tmp/script.log

  CMD=$(/usr/sbin/asterisk -rx "$command"  | grep Status)

  length=${#CMD}

  if [[ $length > 0 ]]; then
    echo " " >> /tmp/script.log
  fi

  start=$[$start+1]
done
