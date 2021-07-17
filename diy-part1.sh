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

echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# Other customizations
mkdir package/custom

## Theme Argon
git clone -b master https://github.com/jerrykuku/luci-theme-argon.git package/custom/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/custom/luci-app-argon-config

## MTK Driver
### Include driver and luci-app-mtwifi
git clone https://github.com/MeIsReallyBa/Redmi2100-WIFI-ProprietaryDriver-linux5.4 package/custom/mtkdriver