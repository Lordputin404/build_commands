#! /bin/bash

rm -rf .repo/local_manifests; \
repo init -u https://github.com/Lunaris-AOSP/android -b 16.2 --git-lfs
rm -rf prebuilts/clang/host/linux-x86; \
/opt/crave/resync.sh; \

rm -rf device/xiaomi/munch; \
rm -rf kernel/xiaomi/munch; \
rm -rf vendor/xiaomi/munch-firmware; \
rm -rf vendor/xiaomi/munch; \
rm -rf hardware/xiaomi; \
rm -rf hardware/dolby; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \
rm -rf packages/apps/ViPER4AndroidFX; \
rm -rf packages/apps/TouchServices


git clone https://github.com/Lordputin404/android_device_xiaomi_munch -b lunaris device/xiaomi/munch

git clone https://github.com/Lordputin404/android_vendor_xiaomi_munch -b 16-qpr2 vendor/xiaomi/munch

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

#git clone https://github.com/SenseiiX/fusionX_sm8250 -b bkp kernel/xiaomi/munch
git clone https://github.com/Lordputin404/xiaomi_sm8250_kernel_e404 -b main-test kernel/xiaomi/munch
cd kernel/xiaomi/munch
git submodule update --init --remote --merge
cd ../../..

git clone https://github.com/Lordputin404/android_hardware_xiaomi hardware/xiaomi

git clone https://github.com/Lordputin404/android_hardware_dolby -b main hardware/dolby

git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

git clone https://github.com/kenway214/packages_apps_TouchServices.git -b lineage-23.2 packages/apps/TouchServices

git clone https://github.com/Lordputin404/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX

git clone https://github.com/kenway214/packages_apps_GameBar.git packages/apps/GameBar

. build/envsetup.sh
lunch lineage_munch-bp4a-user
m bacon
