#! /bin/bash

rm -rf .repo/local_manifests; \
repo init -u https://github.com/CherishOS/android_manifest -b sixteen --git-lfs; \
/opt/crave/resync.sh; \

rm -rf out/target/product/munch; \
rm -rf device/xiaomi/munch; \
rm -rf kernel/xiaomi/sm8250; \
rm -rf vendor/xiaomi/munch; \
rm -rf hardware/xiaomi; \
rm -rf hardware/dolby; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \
rm -rf device/cherish/sepolicy; \

git clone https://github.com/Lordputin404/android_device_xiaomi_munch_hdzungx -b cherish device/xiaomi/munch; \

git clone https://github.com/Lordputin404/android_vendor_xiaomi_munch_hdzungx -b 16 vendor/xiaomi/munch; \

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware; \

git clone https://github.com/SenseiiX/fusionX_sm8250 -b nxt-a16 kernel/xiaomi/sm8250; \
cd kernel/xiaomi/sm8250 && git submodule init && git submodule update && rm -rf KernelSU-Next/userspace/su && cd ../../..; \

git clone https://github.com/Lordputin404/android_hardware_xiaomi hardware/xiaomi; \

git clone https://github.com/munch-devs/android_hardware_dolby hardware/dolby; \

git clone https://github.com/rik-x777/android_device_lineage_sepolicy -b qpr2 device/cherish/sepolicy; \

git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \

git clone https://gitlab.com/rik-x777/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX; \

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \


. build/envsetup.sh; \

brunch munch
