#!/bin/ash

doas setup-xorg-base xfce4 lightdm-gtk-greeter terminator firefox mousepad

doas apk add xfce4-screenshooter
doas apk add xarchiver

doas rc-update add lightdm
doas rc-update add dbus

doas rc-service lightdm start
