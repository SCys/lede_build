#!/bin/bash         

# REPO_URL=https://github.com/Boos4721/openwrt
# REPO_URL=https://hub.fastgit.xyz/Boos4721/openwrt
REPO_URL=https://hub.fastgit.xyz/coolsnowwolf/lede
REPO_BRANCH=master
CONFIG_FILE=redmi_ax6.config

export HTTPS_PROXY=http://192.168.1.1:3002
export HTTP_PROXY=http://192.168.1.1:3002

[ ! -d lede ] && git clone $REPO_URL -b $REPO_BRANCH lede
[ -e $CONFIG_FILE ] && cp $CONFIG_FILE lede/.config

cp setup.sh lede/
cd lede/

./scripts/feeds update -a
./scripts/feeds install -a -f
./setup.sh

make defconfig
make -j16 download -s

echo -e "$(nproc) thread compile"
make -j$(nproc) V=s

mkdir -p ./artifact/firmware
mkdir -p ./artifact/package
rm -rf $(find ./bin/targets/ -type d -name "packages")
rm -rf $(find ./bin/targets/ -type f -name "*.buildinfo")
cp -rf $(find ./bin/targets/ -type f) ./artifact/firmware/
cp -rf $(find ./bin/packages/ -type f -name "*.ipk") ./artifact/package/

# copy new config
cp .config ./artifact/${CONFIG_FILE}

#7z a ../packages.7z ./artifact/packages
#7z a ../firmware.7z ./artifact/firmware
mv ./artifact ../

