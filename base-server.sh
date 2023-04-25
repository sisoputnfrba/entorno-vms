#!/bin/bash -x

set -e

apt-get update -y && apt-get -y install software-properties-common

add-apt-repository -y ppa:git-core/ppa

apt-get install -y \
libbison-dev \
libcunit1-dev \
libevent-dev \
libfl-dev \
libfuse-dev \
libncurses5-dev \
libreadline-dev \
autotools-dev \
build-essential \
cmake \
g++ \
gcc \
gdb \
ltrace \
make \
strace \
valgrind \
curl \
git-all \
htop \
ssh \
net-tools \
neofetch \
tar \
unzip \
p7zip-full \
tig \
tree \
wget \
xclip \
openjdk-17-jdk \
hexedit \
nano \
vim \
emacs

ARCHITECTURE=$(dpkg --print-architecture)
wget -O "/tmp/gdb_12.1-0ubuntu1~22.04_${ARCHITECTURE:?}.deb" \
  "https://launchpad.net/~ubuntu-toolchain-r/+archive/ubuntu/ppa/+build/23606523/+files/gdb_12.1-0ubuntu1~22.04_${ARCHITECTURE:?}.deb"
apt-get install -yf "/tmp/gdb_12.1-0ubuntu1~22.04_${ARCHITECTURE:?}.deb"
rm -f "/tmp/gdb_12.1-0ubuntu1~22.04_${ARCHITECTURE:?}.deb"

ssh-keygen -A
/etc/init.d/ssh start

