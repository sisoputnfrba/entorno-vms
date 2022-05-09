#!/bin/bash -x

set -e

sudo apt update -y

sudo apt install -y \
aptitude \
xorg \
xfce4 \
xfce4-panel-profiles \
xfce4-whiskermenu-plugin \
xarchiver \
terminator \
mousepad \
lightdm \
lightdm-gtk-greeter \
gnome-keyring \
firefox

# Se instala Eclipse desde el mirror de Brasil
wget https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2022-03/R/eclipse-cpp-2022-03-R-linux-gtk-x86_64.tar.gz
sudo tar xzf eclipse-cpp-*.tar.gz -C /opt
rm eclipse-cpp-*.tar.gz

# Se instala VSCode siguiendo los requisitos de Microsoft
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code
