#! /bin/bash

rm -rf .repo/local_manifests/
repo init -u https://github.com/The-Clover-Project/manifest.git -b 16 --git-lfs
/opt/crave/resync.sh

mf=(
out/target/product/onyx
device/xiaomi
kernel/xiaomi
vendor/xiaomi
hardware/xiaomi
packages/apps/XiaomiDolby
)

rm -rf "${mf[@]}"

git clone https://github.com/Lordputin404/android_device_xiaomi_munch -b infinity device/xiaomi/munch
git clone https://github.com/Lordputin404/android_vendor_xiaomi_munch_hdzungx -b 16-exp vendor/xiaomi/munch

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

git clone https://github.com/Ronin-293/android_device_xiaomi_onyx-kernel -b 16-ksu kernel/xiaomi/onyx
cd kernel/xiaomi/munch && git submodule init && git submodule update && rm -rf KernelSU-Next/userspace/su && cd ../../..

git clone https://github.com/Ronin-293/android_hardware_xiaomi hardware/xiaomi




source build/envsetup.sh
lunch infinity_munch-user
make installclean
m bacon
