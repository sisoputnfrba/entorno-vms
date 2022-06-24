#!/bin/bash -x

set -e

sudo add-apt-repository -y ppa:git-core/ppa

sudo apt update -y

sudo apt install -y \
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

echo -e "\nifconfig\n" >> .bashrc
