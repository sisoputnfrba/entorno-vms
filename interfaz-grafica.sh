#!/bin/bash -x

set -e

download() {
  file=${1:?}
  wget -O ~/$file "https://raw.githubusercontent.com/sisoputnfrba/entorno-vms/main/$file"
}

sudo apt-get update -y

sudo apt-get install -y \
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
gpg \
apt-transport-https \
gnome-keyring \
firefox

# Se obtiene el nombre de la última release de Eclipse y la arquitectura
ECLIPSE_VERSION=$(curl -s https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/release.xml | grep -oPm1 "(?<=<present>)[^<]+")
ARCHITECTURE=$(case "$(dpkg --print-architecture)" in ("amd64") echo "x86_64" ;; ("arm64") echo "aarch64" ;; esac)
ECLIPSE_TARBALL=eclipse-cpp-$(echo ${ECLIPSE_VERSION:?} | tr '/' '-')-linux-gtk-${ARCHITECTURE:?}.tar.gz

# Se instala Eclipse desde el mirror de Brasil
sudo rm -rf /opt/eclipse
curl -o "$ECLIPSE_TARBALL" "https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/$ECLIPSE_VERSION/$ECLIPSE_TARBALL"
sudo tar xzf "$ECLIPSE_TARBALL" -C /opt
rm "$ECLIPSE_TARBALL"

# Se agrega la entrada al escritorio
mkdir -pv ~/.local/share/applications
download ".local/share/applications/eclipse.desktop"

# Se instala VSCode siguiendo los requisitos de Microsoft
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt-get update -y
sudo apt-get install -y code

# Se instalan las extensiones recomendadas
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension ms-vscode.hexeditor
code --install-extension matepek.vscode-catch2-test-adapter
code --install-extension eamodio.gitlens
code --install-extension nhoizey.gremlins
