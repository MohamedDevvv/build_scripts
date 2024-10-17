#!/bin/bash

# Remove existing local manifests
rm -rf .repo/local_manifests/

# Initialize the repo for AOSPA (Uvite branch)
repo init -u https://github.com/SkylineUI-Reborn/manifest.git -b fourteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local manifests
git clone https://github.com/MohamedDevvv/Build-.git -b main .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the source using crave resync script
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export build environment variables
export BUILD_USERNAME=Mohamed
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export SKYLINEUI_MAINTAINER=Mohamed
echo "======= Export Done ======"

# Set up build environment
echo "====== Envsetup Done ======"
. build/envsetup.sh
# Create the missing 'a10' directory if it doesn't exist
# Write the aospa_a10.mk file

cat > device/xiaomi/gale/aosp_gale.mk << 'EOF'
# Copyright (C) 2018 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, device/xiaomi/gale/device.mk)

# Inherit common Aosp configurations
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# SkylineUI Maintainer Flags
SKYLINEUI_MAINTAINER := Mohamed

TARGET_SUPPORTS_QUICK_TAP := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_CALL_RECORDING := false

# Device identifier
PRODUCT_DEVICE := gale
PRODUCT_NAME := aosp_gale
PRODUCT_MODEL := 23106RN0DA
PRODUCT_BRAND := xiaomi 
PRODUCT_MANUFACTURER := xiaomi 
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
EOF

cat > device/xiaomi/gale/AndroidProducts.mk << 'EOF'
PRODUCT_MAKEFILES := \
    device/xiaomi/gale/aosp_gale.mk
COMMON_LUNCH_CHOICES := \
    aosp_gale-eng \
    aosp_gale-user \
    aosp_gale-userdebug
EOF

# Write the aospa.dependencies file
echo "====== aospa_gale.mk Created ======"

# Build for A10
lunch aosp_gale-ap2a-user 
make installclean 
mka bacon
