#!/bin/bash


#Export timezone
export TZ=Africa/Cairo

#Export Configuration
export romcuy="Project Matrixx"
export dcdnm="gale"
export botuname="StufffffsBot"
export id_ch="1002183706036"
export id_owner="7448911714"
export btoken="AAFrFOMWANR1yE069wHK1czDrM1zzqUFC-k"
export lmfests="https://github.com/MohamedDevvv/Build-"
export blmfests="main"
export admfests="https://github.com/ProjectMatrixx/android.git"
export badmfests="14.0"
export jembod="m bacon"

#Notify with Telegram Function
stm(){
    local message="$1"
    local cid="$2"
    curl -s -X POST https://api.telegram.org/bot$btoken/sendMessage -d chat_id=$cid -d text="$message" -d disable_web_page_preview="True" -d parse_mode="MarkdownV2"
}

#Send Log with Telegram
stf(){
    local caption="$1"
    local cid="$2"
    curl -s -L -F document=@"$(pwd)/hiya.txt" -F parse_mode="MarkdownV2" -F caption="$caption" -X POST https://api.telegram.org/bot$btoken/sendDocument -F chat_id=$cid
}

#TG Start
echo "================= Start ================="
stm "*_\=\=\=\=\=\= Crave Build Initiated \=\=\=\=\=_*%0A**>*Date: _$(date "+%A, %d %B %Y")_*%0A>*Time: _$(date "+%H:%M:%S %Z")_*%0A>*ROM: _$(echo $romcuy)_*%0A>*Device: _$(echo $dcdnm)_*||%0A*_\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=_*%0A>*See Progress [Here]($(echo $botuname).t.me) \(_Only Owner_\)*%0A%0A*_Script By @ZxhCarkecor_*%0A*_Don't Forget to [Donate](https://saweria.co/zxhcarkecor)_*" "$id_owner" > /dev/null
stm "*_\=\=\=\=\=\= Crave Build Initiated \=\=\=\=\=_*%0A**>*Date: _$(date "+%A, %d %B %Y")_*%0A>*Time: _$(date "+%H:%M:%S %Z")_*%0A>*ROM: _$(echo $romcuy)_*%0A>*Device: _$(echo $dcdnm)_*||%0A*_\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=_*%0A>*See Progress [Here]($(echo $botuname).t.me) \(_Only Owner_\)*%0A%0A*_Script By @ZxhCarkecor_*%0A*_Don't Forget to [Donate](https://saweria.co/zxhcarkecor)_*" "$id_ch" > /dev/null


# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init -u https://github.com/ProjectMatrixx/android.git -b 14.0 --git-lfs

# Clone local_manifests repository
git clone https://github.com/MohamedDevvv/Build- --depth 1 -b main .repo/local_manifests

# Sync the repositories
/opt/crave/resync.sh

#customs
rm -rf frameworks/base
git clone https://github.com/MohamedDevvv/android_frameworks_base_matrix.git -b 14.0 frameworks/base --depth=1

#Private Keys
rm -rf vendor/lineage-priv
git clone https://github.com/MohamedDevvv/private_keys.git -b mat vendor/lineage-priv

export BUILD_USERNAME=Mohamed
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
#build
source build/envsetup.sh
lunch lineage_gale-ap2a-user
m installclean
m bacon


stm "*_\=\=\=\=\= Crave Build Finished \=\=\=\=\=_*%0A**>*Date: _$(date "+%A, %d %B %Y")_*%0A>*Time: _$(date "+%H:%M:%S %Z")_*%0A>*ROM: _$(echo $romcuy)_*%0A>*Device: _$(echo $dcdnm)_*||%0A*_\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=_*%0A**>*\=\=\=\=\=\=\=\= Progress \=\=\=\=\=\=\=\=%0A>▣ Script Executed%0A>▣ Removing Stuffs%0A>▣ Clone local\_manifests%0A>▣ Initializing Repo%0A>▣ Syncing Repositories%0A>▣ Adding Exports%0A>▣ Setup Build Environment%0A>▣ Building ROM*||%0A*_\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=_*%0A>_Log Will Send After Build Finished_%0A%0A*_Script By @ZxhCarkecor_*%0A*_Don't Forget to [Donate](https://saweria.co/zxhcarkecor)_*" "$id_owner" > /dev/null
stm "*_\=\=\=\=\= Crave Build Finished \=\=\=\=\=_*%0A**>*Date: _$(date "+%A, %d %B %Y")_*%0A>*Time: _$(date "+%H:%M:%S %Z")_*%0A>*ROM: _$(echo $romcuy)_*%0A>*Device: _$(echo $dcdnm)_*||%0A*_\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=_*%0A**>*\=\=\=\=\=\=\=\= Progress \=\=\=\=\=\=\=\=%0A>▣ Script Executed%0A>▣ Removing Stuffs%0A>▣ Clone local\_manifests%0A>▣ Initializing Repo%0A>▣ Syncing Repositories%0A>▣ Adding Exports%0A>▣ Setup Build Environment%0A>▣ Building ROM*||%0A*_\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=\=_*%0A>*See Log [Here]($(echo $botuname).t.me) \(_Only Owner_\)*%0A%0A*_Script By @ZxhCarkecor_*%0A*_Don't Forget to [Donate](https://saweria.co/zxhcarkecor)_*" "$id_ch" > /dev/null

#Send Log
echo "================= Done ================="
stf "*Mana Log nya\?
Ini Log nya\!

Where The Log\?
Here NIGGA\!*" "$id_owner" > /dev/null
