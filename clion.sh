#!/bin/bash -x

set -e

sudo apt-get update -y && sudo apt-get install jq

CLION_RELEASES_URL="https://data.services.jetbrains.com/products/releases?code=CL&latest=true&type=release"

# Se obtiene el link de descarga de la versión más reciente de CLion
ARCHITECTURE=$(case "$(dpkg --print-architecture)" in ("amd64") echo "linux" ;; ("arm64") echo "linuxARM64" ;; esac)
CLION_DOWNLOAD_URL=$(curl -fsSL "${CLION_RELEASES_URL:?}" | jq -r ".CL[0].downloads.${ARCHITECTURE:?}.link")

# Se descarga CLion desde el link de descarga oficial
wget -qO- "${CLION_DOWNLOAD_URL:?}" | sudo tar xvz -C /opt

# Se obtiene el nombre de la versión más reciente de CLion
CLION_VERSION=$(curl -fsSL "${CLION_RELEASES_URL:?}" | jq -r '.CL[0].version')

# Se agrega la entrada al escritorio
mkdir -pv ~/.local/share/applications

cat > ~/.local/share/applications/jetbrains-clion.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=CLion
Icon=/opt/clion-${CLION_VERSION:?}/bin/clion.svg
Exec="/opt/clion-${CLION_VERSION:?}/bin/clion.sh" %f
Comment=A cross-platform IDE for C and C++
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-clion
StartupNotify=true
EOF
