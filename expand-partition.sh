#!/bin/sh

set -e

# check if user is root
if [ "$(id -u)" -ne 0 ]; then
  printf "This script must be run as root. Try:\n\tsudo $(basename "$0")\n"
  exit 1
fi

# give 100% of the newly added unallocated space to your logical volume
lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv

# tell the filesystem to expand and fill the container box opened up by lvextend 
resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
