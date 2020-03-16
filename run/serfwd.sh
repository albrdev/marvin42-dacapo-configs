#!/usr/bin/env bash

. "$(cd "$(dirname "$0")" && pwd)/init.sh"

if [ -z "$M42_SP_RXDEVICE" ]; then
    echo "Error: 'M42_SP_RXDEVICE' not set"
    exit 1
fi

if [ -z "$M42_SP_RXBAUDRATE" ]; then
    echo "Error: 'M42_SP_RXBAUDRATE' not set"
    exit 1
fi

if [ -z "$M42_SP_RXDATABITS" ]; then
    echo "Error: 'M42_SP_RXDATABITS' not set"
    exit 1
fi

if [ -z "$M42_SP_RXSTOPBITS" ]; then
    echo "Error: 'M42_SP_RXSTOPBITS' not set"
    exit 1
fi

if [ -z "$M42_SP_RXPARITY" ]; then
    echo "Error: 'M42_SP_RXPARITY' not set"
    exit 1
fi

if [ -z "$M42_SP_RXFLOWCONTROL" ]; then
    echo "Error: 'M42_SP_RXFLOWCONTROL' not set"
    exit 1
fi

if [ -z "$M42_SP_TXDEVICE" ]; then
    echo "Error: 'M42_SP_TXDEVICE' not set"
    exit 1
fi

if [ -z "$M42_SP_TXBAUDRATE" ]; then
    echo "Error: 'M42_SP_TXBAUDRATE' not set"
    exit 1
fi

if [ -z "$M42_SP_TXDATABITS" ]; then
    echo "Error: 'M42_SP_TXDATABITS' not set"
    exit 1
fi

if [ -z "$M42_SP_TXSTOPBITS" ]; then
    echo "Error: 'M42_SP_TXSTOPBITS' not set"
    exit 1
fi

if [ -z "$M42_SP_TXPARITY" ]; then
    echo "Error: 'M42_SP_TXPARITY' not set"
    exit 1
fi

if [ -z "$M42_SP_TXFLOWCONTROL" ]; then
    echo "Error: 'M42_SP_TXFLOWCONTROL' not set"
    exit 1
fi

echo "M42_SP_RXDEVICE       = $M42_SP_RXDEVICE"
echo "M42_SP_RXBAUDRATE     = $M42_SP_RXBAUDRATE"
echo "M42_SP_RXDATABITS     = $M42_SP_RXDATABITS"
echo "M42_SP_RXSTOPBITS     = $M42_SP_RXSTOPBITS"
echo "M42_SP_RXPARITY       = $M42_SP_RXPARITY"
echo "M42_SP_RXFLOWCONTROL  = $M42_SP_RXFLOWCONTROL"
echo ""
echo "M42_SP_TXDEVICE       = $M42_SP_TXDEVICE"
echo "M42_SP_TXBAUDRATE     = $M42_SP_TXBAUDRATE"
echo "M42_SP_TXDATABITS     = $M42_SP_TXDATABITS"
echo "M42_SP_TXSTOPBITS     = $M42_SP_TXSTOPBITS"
echo "M42_SP_TXPARITY       = $M42_SP_TXPARITY"
echo "M42_SP_TXFLOWCONTROL  = $M42_SP_TXFLOWCONTROL"
echo ""

echo "Listening..."
BIN_PATH="$HOME_DIR/bin/m42net_sersrv"
"$BIN_PATH" -i "$M42_SP_RXDEVICE" -b "$M42_SP_RXBAUDRATE" -d "$M42_SP_RXDATABITS" -s "$M42_SP_RXSTOPBITS" -p "$M42_SP_RXPARITY" -f "$M42_SP_RXFLOWCONTROL" -o "$M42_SP_TXDEVICE" -B "$M42_SP_TXBAUDRATE" -D "$M42_SP_TXDATABITS" -S "$M42_SP_TXSTOPBITS" -P "$M42_SP_TXPARITY" -F "$M42_SP_TXFLOWCONTROL"
if [ $? -ne 0 ]; then
    exit 1
fi

exit 0
