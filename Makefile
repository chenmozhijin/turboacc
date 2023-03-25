# SPDX-Identifier-License: GPL-3.0-only
#
# Copyright (C) 2022 Lean <coolsnowwolf@gmail.com>
# Copyright (C) 2019-2022 ImmortalWrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-turboacc
PKG_RELEASE:=$(COMMITCOUNT)

PKG_LICENSE:=GPL-3.0-only
PKG_MAINTAINER:=cTianling Shen <cnsztl@immortalwrt.org>

PKG_CONFIG_DEPENDS:= \
		CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_BBR_CCA \
		CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_SHORTCUT_FE \
		CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_SHORTCUT_FE_CM \
		CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_SHORTCUT_FE_DRV
	
LUCI_TITLE:=LuCI support for Flow Offload / Shortcut-FE
LUCI_PKGARCH:=all
LUCI_DEPENDS:= \
		+PACKAGE_$(PKG_NAME)_INCLUDE_SHORTCUT_FE:kmod-fast-classifier \
		+PACKAGE_$(PKG_NAME)_INCLUDE_SHORTCUT_FE_CM:kmod-shortcut-fe-cm \
		+PACKAGE_$(PKG_NAME)_INCLUDE_SHORTCUT_FE_DRV:kmod-shortcut-fe-drv

define Package/$(PKG_NAME)/config

config PACKAGE_$(PKG_NAME)_INCLUDE_SHORTCUT_FE
	bool "Include Shortcut-FE"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_SHORTCUT_FE_CM
	bool "Include Shortcut-FE CM"
	default y if !(TARGET_ipq60xx||TARGET_ipq806x||TARGET_ipq807x)

config PACKAGE_$(PKG_NAME)_INCLUDE_SHORTCUT_FE_DRV
	bool "Include Shortcut-FE ECM"
	depends on PACKAGE_$(PKG_NAME)_INCLUDE_SHORTCUT_FE_CM=n
	depends on (TARGET_ipq60xx||TARGET_ipq806x||TARGET_ipq807x)
	default y

config PACKAGE_$(PKG_NAME)_INCLUDE_BBR_CCA
	bool "Include BBR CCA"
	default y
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature