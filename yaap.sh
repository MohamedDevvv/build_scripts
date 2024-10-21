#!/bin/bash

# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init -u https://github.com/yaap/manifest.git -b fourteen --git-lfs

# Clone local_manifests repository
git clone https://github.com/MohamedDevvv/Build-.git --depth 1 -b main .repo/local_manifests

git clone https://github.com/yaap/frameworks_base/tree/fourteen.git --depth -b fourteen frameworks/base

# Sync the repositories
/opt/crave/resync.sh && /opt/crave/resync.sh

export BUILD_USERNAME=shravan
export BUILD_HOSTNAME=crave

# Git-lfs
repo forall -c 'git lfs install && git lfs pull'

# Set up build environment
source build/envsetup.sh
lunch yaap_RMX1901-userdebug
make installclean
m yaap
