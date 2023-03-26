# luci-app-turboacc
一个兼容官方openwrt firewall4(22.03)的turboacc

需要的依赖/䃼丁:
https://github.com/coolsnowwolf/lede/tree/master/package/lean/shortcut-fe
https://github.com/coolsnowwolf/lede/blob/master/target/linux/generic/hack-5.10/952-net-conntrack-events-support-multiple-registrant.patch
https://github.com/coolsnowwolf/lede/blob/master/target/linux/generic/hack-5.10/953-net-patch-linux-kernel-to-support-shortcut-fe.patch
https://github.com/coolsnowwolf/lede/blob/master/target/linux/generic/hack-5.10/982-add-bcm-fullconenat-support.patch
https://github.com/fullcone-nat-nftables/nft-fullcone
https://github.com/wongsyrone/lede-1/blob/master/package/network/config/firewall4/patches/999-01-firewall4-add-fullcone-support.patch
https://github.com/wongsyrone/lede-1/blob/master/package/network/utils/nftables/patches/999-01-nftables-add-fullcone-expression-support.patch
https://github.com/wongsyrone/lede-1/blob/master/package/libs/libnftnl/patches/999-01-libnftnl-add-fullcone-expression-support.patch
如果编译22.03.3则将
https://github.com/wongsyrone/lede-1/blob/master/package/network/utils/nftables/patches/999-01-nftables-add-fullcone-expression-support.patch
https://github.com/wongsyrone/lede-1/blob/master/package/libs/libnftnl/patches/999-01-libnftnl-add-fullcone-expression-support.patch
替换成
https://github.com/wongsyrone/lede-1/commit/3a1c45e70bae4a0b84e7c1db1c6e806980379ca2
https://github.com/wongsyrone/lede-1/commit/2064b9db3c2ee5f3b7d6b190e5744548a277904a

