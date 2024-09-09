#!/bin/ash

doas setup-xorg-base xfce4 lightdm-gtk-greeter \
  terminator \
  firefox \
  mousepad \
  elogind polkit-elogind \
  gvfs udisks2 \
  xfce4-screenshooter \
  xarchiver

doas rc-update add lightdm
doas rc-update add dbus

doas rc-service lightdm start
