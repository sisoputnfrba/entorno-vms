#!/bin/sh

set -e

# check if user is root
if [ "$(id -u)" -ne 0 ]; then
  printf "This script must be run as root. Try:\n\tsudo $(basename "$0")\n"
  exit 1
fi

# Set layout to latam
sed -i 's/^XKBLAYOUT=.*/XKBLAYOUT="latam"/' /etc/default/keyboard
sed -i 's/^XKBMODEL=.*/XKBMODEL="pc105"/' /etc/default/keyboard
setupcon --save

# Set timezone to GMT-3
timedatectl set-timezone America/Argentina/Buenos_Aires
timedatectl set-local-rtc 0 --adjust-system-clock
