#!/usr/bin/env bash

CFG_DIR=$(eval echo "~$(logname)")
CFG_FILE="marvin42rc"
CFG_PATH="$CFG_DIR/$CFG_FILE"

if [ ! -f "$CFG_PATH" ]; then
    echo "Error: Configuration file not found: '$CFG_PATH'"
    exit 1
fi

. "$CFG_PATH"

if [ -z "$M42_BTADDRESS" ]; then
    echo "Error: 'M42_BTADDRESS' not set"
    exit 1
fi

if [ -z "$M42_BTDEVICE" ]; then
    echo "Error: 'M42_BTDEVICE' not set"
    exit 1
fi

if [ -z "$M42_BTCHANNEL" ]; then
    echo "Error: 'M42_BTCHANNEL' not set"
    exit 1
fi

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo "Error: Root privileges required"
    exit 1
fi

DEV_PATH="/dev/rfcomm$M42_BTDEVICE"
if [ -e "$DEV_PATH" ]; then
    if [ ! -c "$DEV_PATH" ]; then
        echo "Error: File already exist"
        exit 1
    fi

    echo "Releasing current device..."
    rfcomm release "$M42_BTDEVICE"
    if [ $? -ne 0 ]; then
        echo "Error: Could not release device '$M42_BTDEVICE'"
        exit 1
    fi
fi

echo "M42_BTADDRESS = $M42_BTADDRESS"
echo "M42_BTDEVICE  = $M42_BTDEVICE"
echo "M42_BTCHANNEL = $M42_BTCHANNEL"

rfcomm bind "$M42_BTDEVICE" "$M42_BTADDRESS" "$M42_BTCHANNEL"
if [ $? -ne 0 ]; then
    exit 1
fi

exit 0
