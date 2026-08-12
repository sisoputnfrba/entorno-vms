#!/bin/sh

# Deshabilitar unattended-upgrades
echo "Deshabilitando unattended-upgrades"
sudo systemctl disable --now unattended-upgrades
