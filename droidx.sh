#!/bin/bash
crave run "
# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init --depth=1 -u https://github.com/DroidX-UI/manifest.git -b 14_v3 --git-lfs --depth=1

# Clone local_manifests repository
git clone https://github.com/MohamedDevvv/Build- --depth 1 -b main .repo/local_manifests

# Sync the repositories
/opt/crave/resync.sh

#customs
rm -rf frameworks/base
git clone https://github.com/shravansayz/frameworks_base_droidx.git -b 14_v3 frameworks/base --depth=1

rm -rf vendor/droidx-priv
git clone https://github.com/shravansayz/private_keys.git -b droidx vendor/droidx-priv --depth=1

export BUILD_USERNAME=Mohamed
export BUILD_HOSTNAME=crave

#build
source build/envsetup.sh
lunch droidx_gale-ap2a-user
make installclean
mka bacon"
