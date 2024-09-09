#!/bin/sh -x

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root"
    exit 255
fi

setup-xorg-base xfce4 lightdm-gtk-greeter \
  terminator \
  firefox \
  mousepad \
  elogind polkit-elogind \
  gvfs udisks2 \
  xfce4-screenshooter \
  xarchiver

rc-update add lightdm
rc-update add dbus

rc-service lightdm start
