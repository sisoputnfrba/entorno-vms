#!/bin/bash -x

set -e

CLION_VERSION=2022.2

# Se descarga CLion desde el link de descarga oficial
wget -qO- "https://download.jetbrains.com/cpp/CLion-$CLION_VERSION.tar.gz" \
    | sudo tar xvz -C /opt

# Se agrega la entrada al escritorio
mkdir -pv ~/.local/share/applications

cat > ~/.local/share/applications/jetbrains-clion.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=CLion
Icon=/opt/clion-$CLION_VERSION/bin/clion.svg
Exec="/opt/clion-$CLION_VERSION/bin/clion.sh" %f
Comment=A cross-platform IDE for C and C++
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-clion
StartupNotify=true
EOF
