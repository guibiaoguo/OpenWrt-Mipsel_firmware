#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
git clone https://github.com/kiddin9/openwrt-bypass.git package/bypass
git clone https://github.com/linkease/istore.git package/istore
git clone https://github.com/linkease/istore-ui.git package/istore-ui
git clone https://github.com/1wrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
# 删除自定义源默认的 argon 主题
rm -rf package/lean/luci-theme-argon

# 拉取 argon 原作者的源码
git clone https://github.com/kiddin9/luci-theme-edge.git package/lean/luci-theme-edge

# 替换默认主题为 luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-edge/' feeds/luci/collections/luci/Makefile
