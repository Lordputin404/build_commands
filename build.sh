#! /bin/bash

rm -rf .repo/local_manifests/
repo init -u https://github.com/PixelOS-AOSP/android_manifest.git -b sixteen-qpr2 --git-lfs
/opt/crave/resync.sh

mf=(
out/target/product/munch
device/xiaomi/munch
kernel/xiaomi/munch
vendor/xiaomi/munch
vendor/xiaomi/munch-firmware
hardware/xiaomi
hardware/dolby
packages/resources/devicesettings
vendor/xiaomi/miuicamera
)

rm -rf "${mf[@]}"

git clone https://github.com/Lordputin404/android_device_xiaomi_munch -b pixelwip device/xiaomi/munch

git clone https://github.com/Lordputin404/android_vendor_xiaomi_munch -b 16 vendor/xiaomi/munch

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

git clone https://github.com/SenseiiX/fusionX_sm8250 -b bkp kernel/xiaomi/munch

git clone https://github.com/Kenskuyy-Prjkt/hardware_xiaomi hardware/xiaomi

git clone https://github.com/munch-devs/android_hardware_dolby hardware/dolby

git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

cd hard*/line*/compat/ &&git fetch https://github.com/LineageOS/android_hardware_lineage_compat refs/changes/04/447604/1 && git cherry-pick FETCH_HEAD && cd -
source build/envsetup.sh
breakfast munch
m pixelos
