#!/bin/sh -x

apk add virtualbox-guest-additions virtualbox-guest-additions-x11 linux-virt

rc-service virtualbox-guest-additions start
rc-update add virtualbox-guest-additions boot

rc-service virtualbox-drm-client start
rc-update add virtualbox-drm-client default
