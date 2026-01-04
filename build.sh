#! /bin/bash

rm -rf .repo/local_manifests; \
repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs; \
rm -rf prebuilts/clang/host/linux-x86; \
/opt/crave/resync.sh; \


rm -rf out/target/product/munch; \
rm -rf device/xiaomi/munch; \
rm -rf kernel/xiaomi/munch; \
rm -rf vendor/xiaomi/munch-firmware; \
rm -rf vendor/xiaomi/munch; \
rm -rf hardware/xiaomi; \
rm -rf hardware/dolby; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \
rm -rf packages/apps/ViPER4AndroidFX; \


git clone https://github.com/Lordputin404/android_device_xiaomi_munch -b lunaris device/xiaomi/munch; \

git clone https://github.com/Lordputin404/android_vendor_xiaomi_munch_hdzungx -b 16-exp vendor/xiaomi/munch; \

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware; \

git clone https://github.com/munch-devs/kernel_xiaomi_munch -b munch-ksu kernel/xiaomi/munch; \
cd kernel/xiaomi/munch && git submodule init && git submodule update && rm -rf KernelSU-Next/userspace/su && cd ../../..; \

git clone https://github.com/Lordputin404/android_hardware_xiaomi hardware/xiaomi; \

git clone https://github.com/Pong-Development/hardware_dolby hardware/dolby; \

#git clone https://github.com/munch-devs/android_hardware_dolby hardware/dolby; \

git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \

git clone https://gitlab.com/rik-x777/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX; \

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \


. build/envsetup.sh; \
lunch lineage_munch-bp2a-user
m lunaris
