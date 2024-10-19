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
git clone https://github.com/Project-Elixir/frameworks_base.git -b UNO frameworks/base --depth=1

rm -rf vendor/aosp
git clone https://github.com/Project-Elixir/vendor_aosp.git -b UNO vendor/aosp --depth=1

rm -rf packages/apps/Settings 
git clone https://github.com/Project-Elixir/packages_apps_Settings.git -b UNO-QPR2 packages/apps/Settings --depth=1

export BUILD_USERNAME=Mohamed
export BUILD_HOSTNAME=crave

#build
. build/envsetup.sh
lunch aosp_gale-userdebug
mka bacon 
