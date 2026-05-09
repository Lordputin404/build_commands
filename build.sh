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


git clone https://github.com/Lordputin404/android_device_xiaomi_munch -b lunaris device/xiaomi/munch

git clone https://github.com/Lordputin404/android_vendor_xiaomi_munch -b 16 vendor/xiaomi/munch

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

#git clone https://github.com/SenseiiX/fusionX_sm8250 -b bkp kernel/xiaomi/munch
git clone https://github.com/kvsnr113/xiaomi_sm8250_kernel_e404 -b bpf kernel/xiaomi/munch
cd kernel/xiaomi/munch
git submodule update --init --remote --merge
cd ../../..

git clone https://github.com/Lordputin404/android_hardware_xiaomi hardware/xiaomi

git clone https://github.com/Lordputin404/android_hardware_dolby hardware/dolby

git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings

#git clone https://gitlab.com/rik-x777/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

git clone https://github.com/kenway214/packages_apps_TouchServices.git -b lineage-23.2 packages/apps/TouchServices

https://github.com/Lordputin404/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX

git clone https://github.com/kenway214/packages_apps_GameBar.git packages/apps/GameBar

#cd hard*/line*/compat/ &&git fetch https://github.com/LineageOS/android_hardware_lineage_compat refs/changes/04/447604/1 && git cherry-pick FETCH_HEAD && cd -

. build/envsetup.sh
lunch lineage_munch-bp4a-user
m bacon
