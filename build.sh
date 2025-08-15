#! /bin/bash

rm -rf .repo/local_manifests; \
repo init -u https://github.com/VoltageOS/manifest.git -b 16 --git-lfs; \
rm -rf prebuilts/clang/host/linux-x86; \
/opt/crave/resync.sh; \

# Clone Voltage signing keys and generate them
git clone https://github.com/VoltageOS/vendor_voltage-priv_keys vendor/voltage-priv/keys
cd vendor/voltage-priv/keys
chmod +x keys.sh && ./keys.sh
cd ../../..

rm -rf out/target/product/munch; \
rm -rf device/xiaomi/munch; \
rm -rf kernel/xiaomi/munch; \
rm -rf vendor/xiaomi/munch-firmware; \
rm -rf vendor/xiaomi/munch; \
rm -rf hardware/xiaomi; \
rm -rf hardware/dolby; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \
#rm -rf packages/apps/ViPER4AndroidFX; \


git clone https://github.com/Lordputin404/android_device_xiaomi_munch_hdzungx -b voltage device/xiaomi/munch; \

git clone https://github.com/munch-devs/android_vendor_xiaomi_munch -b 16 vendor/xiaomi/munch; \

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware; \

git clone https://github.com/Lordputin404/kernel_xiaomi_munch -b 16-ksu kernel/xiaomi/munch; \
cd kernel/xiaomi/munch && git submodule init && git submodule update && rm -rf KernelSU-Next/userspace/su && cd ../../..; \

git clone https://github.com/Lordputin404/android_hardware_xiaomi hardware/xiaomi; \

git clone https://github.com/munch-devs/android_hardware_dolby hardware/dolby; \

git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \

#git clone https://gitlab.com/rik-x777/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX; \

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \


. build/envsetup.sh; \

# Download device_framework_matrix.xml if not present
if [ ! -f vendor/voltage/config/device_framework_matrix.xml ]; then
    echo "Downloading device_framework_matrix.xml..."
    mkdir -p vendor/voltage/config
    curl -L -o vendor/voltage/config/device_framework_matrix.xml \
    https://raw.githubusercontent.com/AxionAOSP/android_vendor_lineage/lineage-23.0/config/device_framework_matrix.xml
fi

brunch munch
