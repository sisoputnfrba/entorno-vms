#!/bin/sh -x

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root"
    exit 255
fi

apk add virtualbox-guest-additions virtualbox-guest-additions-x11 linux-virt

rc-service virtualbox-guest-additions start
rc-update add virtualbox-guest-additions boot

rc-service virtualbox-drm-client start
rc-update add virtualbox-drm-client default

reboot
