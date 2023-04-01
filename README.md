# turboacc
兼容官方openwrt(22.03) firewall4的 turboacc的依赖
## 使用方法
 1.Clone 项目
 ```
 cd package
 git clone https://github.com/chenmozhijin/turboacc -b package
 cd turboacc
 git clone https://github.com/chenmozhijin/turboacc 
 ```
 2.移动hack-5.10中的patch到 openwrt/target/linux/generic/hack-5.10
 
 3.移动turboacc/firewall4-XXX/firewall4到openwrt/package/network/config/firewall4 
 
  移动turboacc/nftables-X.X.X/nftables到openwrt/package/network/utils/nftables 
 
  移动turboacc/libs-X.X.X/libnftnl到openwrt/package/libs/libnftn覆盖原文件
 
## 来自
https://github.com/coolsnowwolf/lede/tree/master/package/lean/shortcut-fe 
https://github.com/coolsnowwolf/lede/blob/master/target/linux/generic/hack-5.10/952-net-conntrack-events-support-multiple-registrant.patch
https://github.com/coolsnowwolf/lede/blob/master/target/linux/generic/hack-5.10/953-net-patch-linux-kernel-to-support-shortcut-fe.patch
https://github.com/coolsnowwolf/lede/blob/master/target/linux/generic/hack-5.10/982-add-bcm-fullconenat-support.patch
https://github.com/fullcone-nat-nftables/nft-fullcone
https://github.com/wongsyrone/lede-1/blob/master/package/network/config/firewall4/patches/999-01-firewall4-add-fullcone-support.patch
https://github.com/wongsyrone/lede-1/blob/master/package/network/utils/nftables/patches/999-01-nftables-add-fullcone-expression-support.patch
https://github.com/wongsyrone/lede-1/blob/master/package/libs/libnftnl/patches/999-01-libnftnl-add-fullcone-expression-support.patch  
#22.03.3
https://github.com/wongsyrone/lede-1/commit/3a1c45e70bae4a0b84e7c1db1c6e806980379ca2 
https://github.com/wongsyrone/lede-1/commit/2064b9db3c2ee5f3b7d6b190e5744548a277904a
