#!/bin/bash

set -e

deviceidfile=$SNAP_COMMON/device-data-plug/device-identity

code="$(snapctl get code)"

if [ -z "$code" ]; then
    echo "INFO: No site code set to snapcraft, loading device id"
else
    echo "INFO: Site code already set."
    exit 0
fi

while ! snapctl is-connected devicedata
do
    echo "WARNING: devicedata plug not connected"
    sleep 5
done

while [ ! -e "$deviceidfile" ]; do
    echo "WARNING: No file found at $deviceidfile"
    sleep 5
done

echo "INFO: File exists at $deviceidfile"
deviceid=$(cat $deviceidfile)
echo "INFO: Found system uuid: $deviceid"

echo "INFO: Setting code=$deviceid"
snapctl set code=$deviceid

echo "INFO: Restarting"
snapctl restart $SNAP_INSTANCE_NAME.daemon

