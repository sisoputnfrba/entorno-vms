#!/bin/ash -x

# setup-alpine
# reboot

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

sed -i 's/AllowTcpForwarding no/AllowTcpForwarding yes/g' /etc/ssh/sshd_config

rc-service sshd restart