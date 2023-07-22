#!/bin/bash

PKG_DIR="$(cd ..; pwd)"
PKG_NAME=nft-fullcone
PKG_VERSION=1.0

# apt update -y
# apt upgrade -y
# apt install --reinstall linux-headers-$(uname -r) -y
# apt install --reinstall pve-headers pve-headers-$(uname -r) -y
# apt install build-essential autoconf autogen libtool pkg-config libgmp3-dev bison flex libreadline-dev git libedit-dev libmnl-dev make dkms -y
# apt autoremove -y

cp dkms.conf ..
cp -r ${PKG_DIR} /usr/src/${PKG_NAME}-${PKG_VERSION}

dkms install -m ${PKG_NAME} -v ${PKG_VERSION}
# By default, DKMS only installs the kernel module for the current kernel.
# You can specify a different kernel version, for example, the one you are going to boot into.
# dkms install -m ${PKG_NAME} -v ${PKG_VERSION} -k <Other Kernel Version>
