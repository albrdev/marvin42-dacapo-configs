#!/usr/bin/env bash

while true; do
    for filename in /dev/rfcomm[0-9]; do
        echo "Attempting to read from '$filename'"
        ~/bin/m42net_sersrv -i "$filename" -o /dev/ttyS0
        RET=$?
        if [ $RET -eq 0 ]; then
            break
        fi
    done

    sleep 1s
done
