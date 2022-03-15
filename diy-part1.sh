#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

git clone https://github.com/linkease/istore.git package/istore
git clone https://github.com/linkease/istore.git package/istore-ui
# 删除自定义源默认的 argon 主题
rm -rf package/lean/luci-theme-argon

# 拉取 argon 原作者的源码
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

# 替换默认主题为 luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/' feeds/luci/collections/luci/Makefile
