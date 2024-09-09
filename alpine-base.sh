#!/bin/ash -x

# setup-alpine
# reboot

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root"
    exit 255
fi

sed -i 's/#http/http/g' /etc/apk/repositories

apk update
apk add sudo \
  coreutils \
  bash \
  zsh \
  curl \
  git \
  tig \
  htop \
  xclip \
  nano \
  vim \
  emacs \
  build-base \
  gdb \
  valgrind \
  strace \
  ltrace \
  readline-dev \
  ncurses-dev \
  fuse-dev \
  libevent-dev \
  libuv-dev \
  cunit-dev \
  cmake \
  automake \
  autoconf \
  procps-ng

echo "utnso ALL=(ALL:ALL) ALL" >> /etc/sudoers

sed -i 's/AllowTcpForwarding no/AllowTcpForwarding yes/g' /etc/ssh/sshd_config

rc-service sshd restart
