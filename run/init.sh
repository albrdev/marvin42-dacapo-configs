#!/usr/bin/env bash

HOME_DIR=$(eval echo "~$(logname)")
CFG_FILE=".marvin42rc"
CFG_PATH="$HOME_DIR/$CFG_FILE"

if [ ! -f "$CFG_PATH" ]; then
    echo "Error: Configuration file not found: '$CFG_PATH'"
    exit 1
fi

. "$CFG_PATH"
