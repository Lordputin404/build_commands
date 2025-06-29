#! /bin/bash

rm -rf .repo/local_manifests; \
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs; \
/opt/crave/resync.sh; \

rm -rf out/target/product/munch; \
rm -rf device/xiaomi/munch; \
rm -rf kernel/xiaomi/sm8250; \
rm -rf vendor/xiaomi/munch; \
rm -rf hardware/xiaomi; \
rm -rf hardware/dolby; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \
#rm -rf vendor/lineage-priv/keys; \

# ==== Fix for Trusty Soong Error (dummy module define) ====

mkdir -p trusty/vendor/google/aosp/scripts/dummy

cat > trusty/vendor/google/aosp/scripts/Android.bp << 'EOF'
bootstrap_go_package {
    name: "trusty_dirgroup_prebuilts_clang_host_linux-x86",
    pkgPath: "trusty/vendor/google/aosp/scripts/dummy",
    deps: [],
    srcs: ["dummy.go"],
}
EOF

echo "package dummy" > trusty/vendor/google/aosp/scripts/dummy/dummy.go

# ==== End of Trusty Fix ====

#dt
#git clone https://github.com/Lordputin404/android_device_xiaomi_munch device/xiaomi/munch; \
git clone https://github.com/Lordputin404/android_device_xiaomi_munch_hdzungx -b 16 device/xiaomi/munch; \

#git clone https://github.com/Lordputin404/android_device_xiaomi_sm8250-common device/xiaomi/sm8250-common; \

#vendor
git clone https://github.com/munch-devs/android_vendor_xiaomi_munch -b 16 vendor/xiaomi/munch; \
#git clone https://gitlab.com/rik-x777/vendor_xiaomi_munch vendor/xiaomi/munch; \
#git clone https://gitlab.com/rik-x777/vendor_xiaomi_sm8250-common vendor/xiaomi/sm8250-common; \

#firmware
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware; \
#git clone https://gitlab.com/rik-x777/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware; \

#kernel
git clone https://github.com/SenseiiX/fusionX_sm8250 -b nxt-a16 kernel/xiaomi/sm8250; \
cd kernel/xiaomi/sm8250 && git submodule init && git submodule update && rm -rf KernelSU-Next/userspace/su && cd ../../..; \
#git clone https://gitlab.com/rik-x777/kernel_xiaomi_sm8250 kernel/xiaomi/sm8250; \

#hardware
git clone https://github.com/Evolution-X-Devices/hardware_xiaomi hardware/xiaomi; \
#git clone https://github.com/Lordputin404/android_hardware_xiaomi hardware/xiaomi; \

#additonals
git clone https://github.com/Lordputin404/android_hardware_dolby hardware/dolby; \
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \
git clone https://gitlab.com/rik-x777/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX; \
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

#keys
#git clone https://github.com/munch-devs/private-keys vendor/lineage-priv; \
#git clone https://gitlab.com/rik-x777/keys vendor/lineage-priv/keys; \

#rm -rf device/lineage/sepolicy; \
#git clone https://github.com/rik-x777/android_device_lineage_sepolicy -b qpr2 device/lineage/sepolicy; \



. build/envsetup.sh; \
lunch lineage_munch-bp2a-userdebug; \
m evolution
