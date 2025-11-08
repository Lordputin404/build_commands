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

git clone https://github.com/Ronin-293/android_device_xiaomi_onyx -b lineage-23.0 device/xiaomi/onyx

git clone https://github.com/Ronin-293/proprietary_vendor_xiaomi_onyx -b lineage-23.0 vendor/xiaomi/onyx

git clone https://github.com/Ronin-293/android_device_xiaomi_onyx-kernel -b lineage-23.0 kernel/xiaomi/onyx

git clone https://github.com/Ronin-293/android_hardware_xiaomi hardware/xiaomi

https://github.com/Ronin-293/android_packages_apps_XiaomiDolby packages/apps/XiaomiDolby


source build/envsetup.sh
lunch clover_onyx-bp2a-user
make installclean
mka clover
