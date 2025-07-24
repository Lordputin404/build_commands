#! /bin/bash

rm -rf .repo/local_manifests; \
repo init -u https://github.com/yaap/manifest -b sixteen --git-lfs; \
rm -rf prebuilts/clang/host/linux-x86; \
/opt/crave/resync.sh; \

mf=(
device/xiaomi
kernel/xiaomi
vendor/xiaomi
hardware/xiaomi
hardware/dolby
packages/resources/devicesettings
packages/apps/FastCharge
packages/apps/ViPER4AndroidFX
)

rm -rf "${mf[@]}"

git clone https://github.com/Lordputin404/android_device_xiaomi_munch_hdzungx -b yaap device/xiaomi/munch

git clone https://github.com/Lordputin404/android_vendor_xiaomi_munch_hdzungx -b 16 vendor/xiaomi/munch

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

git clone https://github.com/Lordputin404/kernel_xiaomi_munch -b 16-ksu kernel/xiaomi/munch
cd kernel/xiaomi/munch && git submodule init && git submodule update && rm -rf KernelSU-Next/userspace/su && cd ../../..; \

git clone https://github.com/Lordputin404/android_hardware_xiaomi hardware/xiaomi
#git clone https://github.com/yaap/hardware_xiaomi hardware/xiaomi; \

git clone https://github.com/munch-devs/android_hardware_dolby hardware/dolby

#git clone https://github.com/rik-x777/android_device_lineage_sepolicy -b qpr2 device/yaap/sepolicy; \

git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings

git clone https://gitlab.com/rik-x777/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

git clone https://github.com/cyberknight777/android_packages_apps_FastCharge packages/apps/FastCharge
rm -rf bionic
git clone https://github.com/Lordputin404/bionic bionic
source build/envsetup.sh

lunch yaap_munch-userdebug && m yaap
