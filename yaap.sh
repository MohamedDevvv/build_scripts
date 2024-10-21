#!/bin/bash

rm -rf .repo/local_manifests && \
repo init --depth=1 --no-repo-verify -u https://github.com/yaap/manifest.git -b fourteen -git-lfs -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/MohamedDevvv/Build-.git -b main .repo/local_manifests && \
/opt/crave/resync.sh && \
export TARGET_BUILD_GAPPS=true ; \
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true ; \
source build/envsetup.sh && \
lunch yaap_gale-user && \
make installclean ; \
m yaap
