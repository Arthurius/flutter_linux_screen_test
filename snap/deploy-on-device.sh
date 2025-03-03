#!/bin/bash

if [ $# -lt 3 ]; then
    echo "Usage: deploy-on-device.sh user host port"
    exit 1
fi

if [ $# -eq 4 ]; then
    LAUNCH_FROM_VSCODE=true
else
    LAUNCH_FROM_VSCODE=false
fi

SNAP_USER=$1
SNAP_HOST=$2
SSH_PORT=$3

# Example

#
# Deploy on local ubuntu core
#
#SNAP_USER=piero
#SNAP_HOST=localhost
#SSH_PORT=8022

#
# Deploy on hardware
#
#SNAP_USER=pdivita2
#SNAP_HOST=panel
#SSH_PORT=22

SNAP_PACKAGE="flutter_linux_screen_test_dirty_amd64.snap"

if [ $LAUNCH_FROM_VSCODE = false ]; then
    cd ..
fi

snapcraft clean

snapcraft --verbose &&
    scp -P "$SSH_PORT" $SNAP_PACKAGE "$SNAP_USER@$SNAP_HOST:" &&
    ssh -p "$SSH_PORT" "$SNAP_USER@$SNAP_HOST" "sudo snap install $SNAP_PACKAGE --dangerous" &&
    echo "File uploaded and installed successfully 🚀"

if [ $LAUNCH_FROM_VSCODE = false ]; then
    cd -
fi
