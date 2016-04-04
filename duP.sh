!/bin/bash

DIR=$(pwd)

cd $DIR/vendor/du
#Zenfone 2:Add some dirtyness to Zenfone 2
git fetch http://gerrit.dirtyunicorns.com/android_vendor_du refs/changes/44/27844/1 && git cherry-pick FETCH_HEAD

cd $DIR/hardware/ril
#ril: Allow devices to opt-out of building rild
git fetch http://gerrit.dirtyunicorns.com/android_hardware_ril refs/changes/45/27845/1 && git cherry-pick FETCH_HEAD

cd $DIR/frameworks/native
#gui: only support tertiary display if QTI_BSP is defined Non-caf display HALs crap out with this 
git fetch http://gerrit.dirtyunicorns.com/android_frameworks_native refs/changes/39/27839/1 && git cherry-pick FETCH_HEAD


cd $DIR/bionic

#linker: Allow text-relocs for x86 (only)
git fetch http://gerrit.dirtyunicorns.com/android_bionic refs/changes/30/27730/1 && git cherry-pick FETCH_HEAD

cd $DIR/frameworks/base

#intel: Pick the best ABI based on number of libs, not just priority
git fetch http://gerrit.dirtyunicorns.com/android_frameworks_base refs/changes/42/27842/1 && git cherry-pick FETCH_HEAD

#aapt: Fix compiler warning (clobbered by longjmp) 
git fetch http://gerrit.dirtyunicorns.com/android_frameworks_base refs/changes/43/27843/1 && git cherry-pick FETCH_HEAD

cd $DIR/frameworks/av
#nuplayer: Allow devices to force a flush when surface changes
git fetch http://gerrit.dirtyunicorns.com/android_frameworks_av refs/changes/28/27728/1 && git cherry-pick FETCH_HEAD

cd $DIR/system/core
#init: Add property_get_bool
git fetch http://review.cyanogenmod.org/CyanogenMod/android_system_core refs/changes/05/136005/2 && git cherry-pick FETCH_HEAD

#init: Add a hook to turn a shutdown into a reboot 
git fetch http://review.cyanogenmod.org/CyanogenMod/android_system_core refs/changes/32/114532/7 && git cherry-pick FETCH_HEAD

#Software-accelerated Pixel Flinger
#git fetch http://gerrit.dirtyunicorns.com/android_system_core refs/changes/52/26752/1 && git cherry-pick FETCH_HEAD

#init: Allow devices to use user-space tools to set ro.serialno
git fetch http://gerrit.dirtyunicorns.com/android_system_core refs/changes/41/27841/1 && git cherry-pick FETCH_HEAD

cd $DIR/external/tinyalsa

#tinyalsa: Add a board config to drop silence_size for blob compat.
git fetch http://gerrit.dirtyunicorns.com/android_external_tinyalsa refs/changes/13/27213/2 && git cherry-pick FETCH_HEAD

#tinyalsa: Use kernel headers when available
git fetch http://gerrit.dirtyunicorns.com/android_external_tinyalsa refs/changes/12/27212/2 && git cherry-pick FETCH_HEAD
