#!/bin/sh

set -e

# check if user is root
if [ "$(id -u)" -ne 0 ]; then
  printf "This script must be run as root. Try:\n\tsudo ./machineid.sh\n"
  exit 1
fi

rm -f /etc/machine-id
dbus-uuidgen --ensure=/etc/machine-id
reboot
