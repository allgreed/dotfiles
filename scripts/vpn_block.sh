#!/bin/bash
result=$(nmcli -t -f type,state,connection d | egrep "^(tun|tap):connected" | awk -F':' '{ print $3 }')

if [[ -z $result ]]; then
    echo 'down'
    echo 'down'
    echo \#FF0000
else
    echo " $result"
    echo " $result"
fi
