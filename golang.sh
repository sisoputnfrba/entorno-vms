#!/bin/bash -x

# Función para obtener la última versión estable de Golang
get_latest_version() {
  curl -s https://go.dev/VERSION?m=text | grep go
}

VERSION=$(get_latest_version)

sudo rm -rf /usr/local/go /usr/bin/go > /dev/null 2>&1

ARCH=$(uname -m)

case $ARCH in
  x86_64)
    ARCH="amd64"
    ;;
  aarch64)
    ARCH="arm64"
    ;;
  armv7l)
    ARCH="armv6l"
    ;;
  *)
    echo "Arquitectura no soportada: $ARCH"
    exit 1
    ;;
esac

URL="https://go.dev/dl/${VERSION}.linux-${ARCH}.tar.gz"

wget $URL -O /tmp/go.tar.gz > /dev/null 2>&1
sudo tar -C /usr/local -xzf /tmp/go.tar.gz > /dev/null 2>&1

echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
source ~/.profile > /dev/null 2>&1

go version
exec bash -il