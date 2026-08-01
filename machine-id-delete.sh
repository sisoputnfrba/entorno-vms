#!/bin/sh

set -e

# check if user is root
if [ "$(id -u)" -ne 0 ]; then
  printf "This script must be run as root. Try:\n\tsudo ./machineid.sh\n"
  exit 1
fi


sudo truncate -s 0 /etc/machine-id
sudo rm /var/lib/dbus/machine-id
sudo poweroff
