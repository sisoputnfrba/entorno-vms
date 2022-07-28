#!/bin/bash -x

set -e

download() {
  file=${1:?}
  wget -O ~/$file "https://raw.githubusercontent.com/sisoputnfrba/entorno-vms/main/$file"
}

# Se descarga CLion desde el link de descarga oficial
wget -qO- https://download.jetbrains.com/cpp/CLion-2022.2.tar.gz \
    | sudo tar xvz -C /opt

# Se agrega la entrada al escritorio
mkdir -pv ~/.local/share/applications
download ".local/share/applications/jetbrains-clion.desktop"
