# luci-app-turboacc
一个兼容官方openwrt(22.03) firewall4的turboacc
包括以下功能：软件流量分载、Shortcut-FE、全锥型 NAT、BBR 拥塞控制算法


## 需要的依赖/䃼丁
Shortcut-FE需要：
[ fast-classifier、shortcut-fe、simulated-driver ](https://github.com/coolsnowwolf/lede/tree/master/package/lean/shortcut-fe)、[ 952-net-conntrack-events-support-multiple-registrant.patch ](https://github.com/coolsnowwolf/lede/blob/master/target/linux/generic/hack-5.10/952-net-conntrack-events-support-multiple-registrant.patch)、[953-net-patch-linux-kernel-to-support-shortcut-fe.patch](https://github.com/coolsnowwolf/lede/blob/master/target/linux/generic/hack-5.10/953-net-patch-linux-kernel-to-support-shortcut-fe.patch)

全锥型 NAT需要：[nft-fullcone](https://github.com/fullcone-nat-nftables/nft-fullcone)、[982-add-bcm-fullconenat-support.patch](https://github.com/coolsnowwolf/lede/blob/master/target/linux/generic/hack-5.10/982-add-bcm-fullconenat-support.patch)并为新的“fullcone”语句修补firewall4、libnftnl和nftables

修补firewall4、libnftnl和nftables需要：
[firewall4 patch](https://github.com/wongsyrone/lede-1/blob/master/package/network/config/firewall4/patches/999-01-firewall4-add-fullcone-support.patch)、
[nftables patch](https://github.com/wongsyrone/lede-1/blob/master/package/network/utils/nftables/patches/999-01-nftables-add-fullcone-expression-support.patch)与
[libnftnl patch](https://github.com/wongsyrone/lede-1/blob/master/package/libs/libnftnl/patches/999-01-libnftnl-add-fullcone-expression-support.patch)或[firewall4修补的存储库](https://github.com/wongsyrone/openwrt-firewall4-with-fullcone)、[nftables修补的存储库](https://github.com/wongsyrone/nftables-1.0.2-with-fullcone)与[libnftnl修补的存储库](https://github.com/wongsyrone/libnftnl-1.2.1-with-fullcone)
## 使用方法
+  在openwrt源代码所在目录执行：
```
mkdir -p turboacc_tmp ./package/turboacc
cd turboacc_tmp 
git clone https://github.com/chenmozhijin/turboacc -b package
cd ../package/turboacc
git clone https://github.com/fullcone-nat-nftables/nft-fullcone
git clone https://github.com/chenmozhijin/turboacc
mv ./turboacc/luci-app-turboacc ./luci-app-turboacc
rm -rf ./turboacc
cd ../..
cp turboacc_tmp/turboacc/hack-5.10/952-net-conntrack-events-support-multiple-registrant.patch ./target/linux/generic/hack-5.10
cp turboacc_tmp/turboacc/hack-5.10/953-net-patch-linux-kernel-to-support-shortcut-fe.patch ./target/linux/generic/hack-5.10
rm -rf ./package/libs/libnftnl ./package/network/config/firewall4 ./package/network/utils/nftables
mkdir -p ./package/network/config/firewall4 ./package/libs/libnftnl ./package/network/utils/nftables
cp -r ./turboacc_tmp/turboacc/shortcut-fe ./package/turboacc
cp -RT ./turboacc_tmp/turboacc/firewall4-04a06bd70b9808b14444cae81a2faba4708ee231/firewall4 ./package/network/config/firewall4
cp -RT ./turboacc_tmp/turboacc/libnftnl-1.2.5/libnftnl ./package/libs/libnftnl
cp -RT ./turboacc_tmp/turboacc/nftables-1.0.7/nftables ./package/network/utils/nftables
rm -rf turboacc_tmp
./scripts/feeds update -a
./scripts/feeds install -a
```
+  这将会下载luci-app-turboacc、nft-fullcone替换firewall4、libnftnl、nftables并打上952、953补丁。

+  之后执行
```
make menuconfig
```
+  在 > LuCI > 3. Applications中选中luci-app-turboacc
+  如果不需要sfe建议删除 target/linux/generic/hack-5.10/953-net-patch-linux-kernel-to-support-shortcut-fe.patch

+  如果你只是想要一个带turboacc官方稳定版openwrt可以看看[我的OpenWrt自动编译](https://github.com/chenmozhijin/OpenWrt-K)



