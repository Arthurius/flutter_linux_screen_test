#!/bin/bash

set -e
device_backend_environment_file=$SNAP_COMMON/device-data-plug/device-backend-environment
code="$(snapctl get code)"
gtktheme="$(snapctl get gtktheme)"


echo "Clearing $SNAP_DATA/.env"
echo -n "" > $SNAP_DATA/.env

DEVICEDATA_SLOT="devicedata"
if ! snapctl is-connected $DEVICEDATA_SLOT
then
    echo "WARNING:  $DEVICEDATA_SLOT interface not connected!"
else
    if [ ! -f "$device_backend_environment_file" ]; then
        echo "ERROR: File does not exist at $device_backend_environment_file"
    else
        echo "INFO: File exists at $device_backend_environment_file"
        env=$(cat $device_backend_environment_file)
        echo "INFO: Found device backend environment : $env"
    fi
fi

if [ -n "$env" ]; then
    echo "Setting ENV to $env"
    echo "ENV=$env" >> $SNAP_DATA/.env
fi

if [ -n "$code" ]; then
    echo "Setting CODE to $code"
    echo "CODE=$code" >> $SNAP_DATA/.env
fi

echo "Setting SNAP_VERSION to $SNAP_VERSION"
echo "SNAP_VERSION=$SNAP_VERSION" >> $SNAP_DATA/.env

if [ -n "$gtktheme" ]; then
    echo "Setting gtk-theme to $gtktheme"
    gsettings set org.gnome.desktop.interface gtk-theme $gtktheme
fi

echo "Catting $SNAP_DATA/.env"
cat $SNAP_DATA/.env

echo "Starting app"
$SNAP/bin/flutter_linux_screen_test

