#!/bin/bash -x

set -e

sudo sed -i "s/\#\$nrconf{restart} = 'i';/\$nrconf {restart} = 'l';/" /etc/needrestart/needrestart.conf

sudo apt-get update -y

sudo apt-get install -y \
aptitude \
xorg \
xfce4 \
xfce4-screenshooter \
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
ECLIPSE_VERSION=$(curl -fsS https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/release.xml | grep -oPm1 "(?<=<present>)[^<]+")
ARCHITECTURE=$(case "$(dpkg --print-architecture)" in ("amd64") echo "x86_64" ;; ("arm64") echo "aarch64" ;; esac)
ECLIPSE_TARBALL=eclipse-cpp-$(echo ${ECLIPSE_VERSION:?} | tr '/' '-')-linux-gtk-${ARCHITECTURE:?}.tar.gz

# Se instala Eclipse desde el mirror de Brasil
sudo rm -rf /opt/eclipse
curl -fsS "https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/$ECLIPSE_VERSION/$ECLIPSE_TARBALL" | sudo tar xvzC /opt

# Se agrega la entrada al escritorio
mkdir -pv ~/.local/share/applications
cat > ~/.local/share/applications/eclipse.desktop <<EOF
[Desktop Entry]
Version=1.1
Type=Application
Name=Eclipse
Icon=/opt/eclipse/icon.xpm
Exec=/opt/eclipse/eclipse
Comment=An IDE for C/C++ Developers
Categories=Development;IDE;
Terminal=false
Encoding=UTF-8
StartupNotify=false
EOF

# Se instala VSCode siguiendo los requisitos de Microsoft
sudo snap install code --classic

# Se instalan las extensiones recomendadas
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension ms-vscode.hexeditor
code --install-extension matepek.vscode-catch2-test-adapter
code --install-extension eamodio.gitlens
code --install-extension nhoizey.gremlins
