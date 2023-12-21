# luci-app-turboacc

[中文](https://github.com/chenmozhijin/turboacc/blob/luci/README.md)|English

A turboacc package for official OpenWrt (22.03/23.05) firewall4, including the following features: software flow offloading, Shortcut-FE, full-cone NAT, and BBR congestion control algorithm.

Compilation and Testing:

- TEST Status: [![TEST Status](https://github.com/chenmozhijin/turboacc/actions/workflows/test.yml/badge.svg)](https://github.com/chenmozhijin/turboacc/actions/workflows/test.yml)
- Automatic Dependency Updates: [![UPDATE Status](https://github.com/chenmozhijin/turboacc/actions/workflows/update.yml/badge.svg)](https://github.com/chenmozhijin/turboacc/actions/workflows/update.yml)

## Usage

- In the directory where the OpenWrt source code is located, execute the following commands:

```bash
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh
```

> This will download luci-app-turboacc, nft-fullcone, replace firewall4, libnftnl, nftables and apply 952 and 953 patches.

After the setup, execute:

```bash
make menuconfig
```

Navigate to > LuCI > 3. Applications and select "luci-app-turboacc".

If you want to use GitHub Actions for cloud compiling OpenWrt with the official source code and turboacc, you can refer to this repository:  [OpenWrt-K](https://github.com/chenmozhijin/OpenWrt-K).

## Notes

1. Software flow offloading (Flow Offload) is a feature built into firewall4 (see [firewall4 Makefile](https://github.com/openwrt/openwrt/blob/afa229038c05ba0ca20595d7f73bea94db21d3a6/package/network/config/firewall4/Makefile#L25C31-L25C48)). It is generally well-compatible and stable, so SFE (SFE-related features) might not be necessary.
2. If SFE is not required, you can skip the 953 and 613 patches.
3. The default method provided will replace firewall4, libnftnl, and nftables with the latest patched versions. If you encounter issues, you can try using older versions of firewall4, libnftnl, and nftables (available in the "package" branch).

## Plugin Preview

![Plugin Preview](https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/img/1.png)
![Effect preview](https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/img/2.png)

## About

The luci-app-turboacc in this repository is based on the [luci-app-turboacc](https://github.com/coolsnowwolf/luci/tree/master/applications/luci-app-turboacc) from the LEDE repository. It has been modified to remove DNS-related features and add support for firewall4, but it no longer supports firewall3.

Dependencies for Each Feature:

- Software Flow Offloading (Flow Offload): [kmod-nft-offload](https://github.com/openwrt/openwrt/blob/80edfaf675364835e6d2e17d97ebec6afc6b2103/package/kernel/linux/modules/netfilter.mk#L1182C1-L1199C42) (Included in official OpenWrt)
- Shortcut-FE: [shortcut-fe](https://github.com/chenmozhijin/turboacc/tree/package/shortcut-fe), 952 patch, 953 patch
- Full Cone NAT (FULLCONE NAT): [nft-fullcone](https://github.com/fullcone-nat-nftables/nft-fullcone), patched firewall4, libnftnl, nftables, and 952 patch
- BBR Congestion Control Algorithm: [kmod-tcp-bbr](https://github.com/openwrt/openwrt/blob/80edfaf675364835e6d2e17d97ebec6afc6b2103/package/kernel/linux/modules/netsupport.mk#L1036C1-L1057C38) (Included in official OpenWrt)

Unofficial dependencies for OpenWrt not included by default are available in the [package branch](https://github.com/chenmozhijin/turboacc/tree/package).

## Acknowledgments

Special thanks to the following projects:

- [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede) (Source of 952, 953 patches, and SFE)
- [wongsyrone/lede-1](https://github.com/wongsyrone/lede-1) (Source of firewall4, libnftnl, nftables patched patches)
- [fullcone-nat-nftables/nft-fullcone](https://github.com/fullcone-nat-nftables/nft-fullcone) (Dependency for Full Cone NAT)
