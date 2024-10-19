#!/bin/bash

# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init --depth=1 -u https://github.com/Project-Elixir/manifest -b UNO --git-lfs

# Clone local_manifests repository
git clone https://github.com/MohamedDevvv/Build- --depth 1 -b main .repo/local_manifests

# Sync the repositories
/opt/crave/resync.sh

#customs
rm -rf frameworks/base
git clone https://github.com/Project-Elixir/frameworks_base -b UNO frameworks/base --depth=1

rm -rf hardware/interfaces
git clone https://github.com/shravansayz/hardware_interfaces.git -b fourteen-qpr3 hardware/interfaces --depth=1

rm -rf vendor/aosp/signing
git clone https://github.com/shravansayz/private_keys.git -b pixelpro vendor/aosp/signing --depth=1

export BUILD_USERNAME=shravan
export BUILD_HOSTNAME=crave

#build
source build/envsetup.sh
lunch aosp_RMX1901-user
make installclean
make bacon
