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
7zip \
tig \
tree \
wget \
xclip \
openjdk-17-jdk \
hexedit \
nano \
vim \
emacs

apt remove -y unattended-upgrades

ssh-keygen -A
/etc/init.d/ssh start
