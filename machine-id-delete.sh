#!/bin/sh

set -e

# check if user is root
if [ "$(id -u)" -ne 0 ]; then
  printf "This script must be run as root. Try:\n\tsudo $(basename "$0")\n"
  exit 1
fi

truncate -s 0 /etc/machine-id
rm /var/lib/dbus/machine-id
poweroff
