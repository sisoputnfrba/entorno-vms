#!/bin/sh

sudo sed -i "s/\#\$nrconf{restart} = 'i';/\$nrconf {restart} = 'l';/" /etc/needrestart/needrestart.conf
sudo sh -c 'yes | unminimize'

ARCHITECTURE=$(dpkg --print-architecture)
wget "https://launchpad.net/~ubuntu-toolchain-r/+archive/ubuntu/ppa/+build/23606523/+files/gdb_12.1-0ubuntu1~22.04_${ARCHITECTURE:?}.deb"
sudo apt-get install -y ./gdb_12.1-0ubuntu1~22.04_${ARCHITECTURE:?}.deb
rm -v ./gdb_12.1-0ubuntu1~22.04_${ARCHITECTURE:?}.deb
