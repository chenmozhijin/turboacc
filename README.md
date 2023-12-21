# luci-app-turboacc

中文|[English](https://github.com/chenmozhijin/turboacc/blob/luci/README_EN.md)

一个适用于官方openwrt(22.03/23.05) firewall4的turboacc  
包括以下功能：软件流量分载、Shortcut-FE、全锥型 NAT、BBR 拥塞控制算法  

 编译测试：[![TEST Status](https://github.com/chenmozhijin/turboacc/actions/workflows/test.yml/badge.svg)](https://github.com/chenmozhijin/turboacc/actions/workflows/test.yml)  
 依赖自动更新：[![UPDATE Status](https://github.com/chenmozhijin/turboacc/actions/workflows/update.yml/badge.svg)](https://github.com/chenmozhijin/turboacc/actions/workflows/update.yml)

## 使用方法

+ 在openwrt源代码所在目录执行：

```bash
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh
```

> 这将会下载luci-app-turboacc、nft-fullcone 替换firewall4、libnftnl、nftables并打上952、953补丁。

+ 之后执行

```bash
make menuconfig
```

+ 在 > LuCI > 3. Applications中选中luci-app-turboacc
+ 如果你想用要一个用GitHub Actions云编译带turboacc官方源码的openwrt可以看看这个仓库[OpenWrt-K](https://github.com/chenmozhijin/OpenWrt-K)

## 注意

1. 软件流量分载为firewall4自带的功能(见firewall4的[Makefile](https://github.com/openwrt/openwrt/blob/afa229038c05ba0ca20595d7f73bea94db21d3a6/package/network/config/firewall4/Makefile#L25C31-L25C48))按理来说其兼容性与稳定性都比较好，一般不需要sfe(sfe相关的功能我都没有测试过)。
2. 如不需要sfe可以删除953与613补丁。
3. 默认的使用方法会把firewall4、libnftnl、nftables替换最新修补后的版本，如你遇到问题可以尝试使用旧版firewall4、libnftnl、nftables。（package分支中有旧版存档）

## 插件预览

![插件预览](https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/img/1.png)
![效果预览](https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/img/2.png)

## 关于

此仓库的luci-app-turboacc是基于LEDE仓库的[luci-app-turboacc](https://github.com/coolsnowwolf/luci/tree/master/applications/luci-app-turboacc)修改而来的，去除了DNS相关功能并使其支持firewall4，但不再支持firewall3。

各功能的依赖：

软件流量分载(Flow Offload)：[kmod-nft-offload](https://github.com/openwrt/openwrt/blob/80edfaf675364835e6d2e17d97ebec6afc6b2103/package/kernel/linux/modules/netfilter.mk#L1182C1-L1199C42)(官方openwrt自带)

Shortcut-FE：[shortcut-fe](https://github.com/chenmozhijin/turboacc/tree/package/shortcut-fe)、952补丁、953补丁

全锥型 NAT（FULLCONE NAT）：[nft-fullcone](https://github.com/fullcone-nat-nftables/nft-fullcone)、修补的firewall4、libnftnl、nftables与952补丁

BBR 拥塞控制算法：[kmod-tcp-bbr](https://github.com/openwrt/openwrt/blob/80edfaf675364835e6d2e17d97ebec6afc6b2103/package/kernel/linux/modules/netsupport.mk#L1036C1-L1057C38)(官方openwrt自带)

非官方openwrt自带的依赖存档在[package分支](https://github.com/chenmozhijin/turboacc/tree/package)。

## 感谢

 感谢以下项目：

+ [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)(952、953补丁与sfe来源)
+ [wongsyrone/lede-1](https://github.com/wongsyrone/lede-1)(firewall4、libnftnl、nftables修补补丁来源)
+ [fullcone-nat-nftables/nft-fullcone](https://github.com/fullcone-nat-nftables/nft-fullcone)(全锥型 NAT依赖)
