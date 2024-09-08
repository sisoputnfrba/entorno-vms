#!/bin/ash

doas setup-xorg-base xfce4 lightdm-gtk-greeter terminator firefox mousepad

doas apk add gvfs xfce4-screenshooter xarchiver

doas rc-update add lightdm
doas rc-update add dbus

doas rc-service lightdm start
