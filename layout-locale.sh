#!/bin/sh

set -e

# Set layout to latam
sudo sed -i 's/^XKBLAYOUT=.*/XKBLAYOUT="latam"/' /etc/default/keyboard
sudo sed -i 's/^XKBMODEL=.*/XKBMODEL="pc105"/' /etc/default/keyboard

# Set timezone to GMT-3
sudo timedatectl set-timezone America/Argentina/Buenos_Aires
sudo timedatectl set-local-rtc 0 --adjust-system-clock
