#! /bin/bash

rm -rf .repo/local_manifests/
repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault
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

git clone https://github.com/Lordputin404/android_device_xiaomi_munch -b infinity device/xiaomi/munch
git clone https://github.com/Lordputin404/android_vendor_xiaomi_munch_hdzungx -b 16-exp vendor/xiaomi/munch

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

git clone https://github.com/munch-devs/kernel_xiaomi_munch -b munch-ksu kernel/xiaomi/munch
cd kernel/xiaomi/munch && git submodule init && git submodule update && rm -rf KernelSU-Next/userspace/su && cd ../../..

git clone https://github.com/Lordputin404/android_hardware_xiaomi hardware/xiaomi

git clone https://github.com/munch-devs/android_hardware_dolby hardware/dolby

git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera


git clone https://github.com/UdayKumarChunduru/android_vendor_bcr -b vic vendor/bcr


source build/envsetup.sh
lunch infinity_munch-user
make installclean
m bacon
