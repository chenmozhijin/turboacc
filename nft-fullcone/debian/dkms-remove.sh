#!/bin/bash

PKG_NAME=nft-fullcone
PKG_VERSION=1.0

dkms remove ${PKG_NAME}/${PKG_VERSION} --all
rm -r /usr/src/${PKG_NAME}-${PKG_VERSION}
