#!/bin/sh

sudo sed -i "s/\#\$nrconf{restart} = 'i';/\$nrconf {restart} = 'l';/" /etc/needrestart/needrestart.conf
sudo sh -c 'yes | unminimize'
