#!/usr/bin/env bash

ADDR_FILE="/home/pi/btaddrs"
BT_ADDRS=()

USER_ID=$(id -u)

CMD_PREFIX=""
if [ $USER_ID -ne 0 ]; then
    CMD_PREFIX="sudo"
fi

while read line; do
    BT_ADDRS+=("$line")
done < <(sed -e 's/[[:space:]]*#.*// ; /^[[:space:]]*$/d' "$ADDR_FILE")

for i in "${!BT_ADDRS[@]}"; do
    echo "Attempting to connect '${BT_ADDRS[i]}' to $i"
    CMD="$CMD_PREFIX rfcomm connect $i '${BT_ADDRS[i]}'"
    $CMD

    RET=$?
    if [ $RET -ne 0 ]; then
        exit 1
    fi
done

exit 0
