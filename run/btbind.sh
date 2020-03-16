#!/usr/bin/env bash

. "$(cd "$(dirname "$0")" && pwd)/init.sh"

if [ -z "$M42_BT_ADDRESS" ]; then
    echo "Error: 'M42_BT_ADDRESS' not set"
    exit 1
fi

if [ -z "$M42_BT_DEVICE" ]; then
    echo "Error: 'M42_BT_DEVICE' not set"
    exit 1
fi

if [ -z "$M42_BT_CHANNEL" ]; then
    echo "Error: 'M42_BT_CHANNEL' not set"
    exit 1
fi

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo "Error: Root privileges required"
    exit 1
fi

if [ -e "$M42_SP_TXDEVICE" ]; then
    if [ ! -c "$M42_SP_TXDEVICE" ]; then
        echo "Error: File already exist"
        exit 1
    fi

    echo "Releasing current device..."
    rfcomm release "$M42_BT_DEVICE"
    if [ $? -ne 0 ]; then
        echo "Error: Could not release device '$M42_BT_DEVICE'"
        exit 1
    fi
fi

echo "M42_BT_ADDRESS    = $M42_BT_ADDRESS"
echo "M42_BT_DEVICE     = $M42_BT_DEVICE"
echo "M42_BT_CHANNEL    = $M42_BT_CHANNEL"

rfcomm bind "$M42_BT_DEVICE" "$M42_BT_ADDRESS" "$M42_BT_CHANNEL"
if [ $? -ne 0 ]; then
    exit 1
fi

exit 0
