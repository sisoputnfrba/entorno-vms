#!/bin/bash -x

set -e

apt-get update -y && apt-get -y install software-properties-common

curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor --yes -o /etc/apt/keyrings/llvm-snapshot.gpg

ARCHITECTURE=$(dpkg --print-architecture)
LSB_RELEASE=$(lsb_release -cs)

cat > /etc/apt/sources.list.d/llvm.list <<EOF
deb [arch=${ARCHITECTURE:?} signed-by=/etc/apt/keyrings/llvm-snapshot.gpg] http://apt.llvm.org/${LSB_RELEASE:?}/ llvm-toolchain-${LSB_RELEASE:?} main
deb-src [arch=${ARCHITECTURE:?} signed-by=/etc/apt/keyrings/llvm-snapshot.gpg] http://apt.llvm.org/${LSB_RELEASE:?}/ llvm-toolchain-${LSB_RELEASE:?} main
EOF

add-apt-repository -y ppa:git-core/ppa

apt-get update -y && apt-get install -y \
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
clang-format \
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

ssh-keygen -A
/etc/init.d/ssh start
