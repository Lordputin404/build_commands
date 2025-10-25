# repo init
repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs
# repo sync script
/opt/crave/resync.sh

# Remove old device specific repos
remove=(
device/xiaomi
kernel/xiaomi
vendor/xiaomi
hardware/xiaomi
)

rm -rf "${remove[@]}"

# Device Trees
git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_munch -b LunarisAOSP-16 device/xiaomi/munch
git clone https://github.com/Olzhas-Kdyr/android_device_xiaomi_sm8250-common -b LunarisAOSP-16 device/xiaomi/sm8250-common

# Vendor Trees
git clone https://github.com/Olzhas-Kdyr/proprietary_vendor_xiaomi_munch vendor/xiaomi/munch
git clone https://github.com/Olzhas-Kdyr/proprietary_vendor_xiaomi_sm8250-common vendor/xiaomi/sm8250-common

# Munch Firmware
git clone https://github.com/PocoF4Trees/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware

# Kernel Tree
git clone --depth=1 https://github.com/SenseiiX/fusionX_sm8250 -b stable-next kernel/xiaomi/sm8250
cd kernel/xiaomi/sm8250 && git submodule init && git submodule update && rm -rf KernelSU-Next/userspace/su && cd ../../..; \

# Hardware Xiaomi
git clone https://github.com/Project-SenX/android_hardware_xiaomi hardware/xiaomi

# MIUI Camera
git clone https://github.com/PocoF4Trees/vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

# My Keys
#git clone https://github.com/Olzhas-Kdyr/keys.git vendor/lineage-priv/keys

# Building 
. build/envsetup.sh
export BUILD_USERNAME=olzhas
export BUILD_HOSTNAME=ubuntu
export SKIP_ABI_CHECKS=true
lunch lineage_munch-bp2a-user
m lunaris
