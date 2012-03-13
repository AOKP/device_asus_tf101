# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/asus/tf101/tf101-vendor.mk)

# Prebuilt kernel location
ifeq ($(TARGET_3G), true)
	DEVICE_PACKAGE_OVERLAYS += device/asus/tf101/overlay3g
else
	DEVICE_PACKAGE_OVERLAYS += device/asus/tf101/overlay
endif


# Prebuilt kernel location
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/asus/tf101/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Files needed for boot image
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/ramdisk/init:root/init \
    $(LOCAL_PATH)/ramdisk/init.ventana.rc:root/init.ventana.rc\
    $(LOCAL_PATH)/ramdisk/init.ventana.usb.rc:root/init.ventana.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.ventana.rc:root/ueventd.ventana.rc

# Prebuilt configeration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/asound.conf:system/etc/asound.conf \
    $(LOCAL_PATH)/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/prebuilt/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/prebuilt/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/prebuilt/gpsconfig.xml:system/etc/gps/gpsconfig.xml

	
# Prebuilt keyboard APKs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/app/XT9IME.apk:system/app/XT9IME.apk \
    $(LOCAL_PATH)/prebuilt/system/app/Keyboard.apk:system/app/Keyboard.apk \
    $(LOCAL_PATH)/prebuilt/system/app/LatinImeDictionaryPack.apk:system/app/LatinImeDictionaryPack.apk \
    $(LOCAL_PATH)/prebuilt/system/app/UserDictionaryProvider.apk:system/app/UserDictionaryProvider.apk

# Input device configeration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    $(LOCAL_PATH)/lib/libjni_mosaic.so:system/lib/libjni_mosaic.so \
    $(LOCAL_PATH)/lib/libjni_xt9input.so:system/lib/libjni_xt9input.so \
    $(LOCAL_PATH)/lib/libjni_xt9kcm.so:system/lib/libjni_xt9kcm.so \
    $(LOCAL_PATH)/lib/libjni_xt9korean.so:system/lib/libjni_xt9korean.so \
    $(LOCAL_PATH)/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    $(LOCAL_PATH)/usr/idc/elantech_touchscreen.idc:system/usr/idc/elantech_touchscreen.idc \
    $(LOCAL_PATH)/usr/idc/panjit_touch.idc:system/usr/idc/panjit_touch.idc \
    $(LOCAL_PATH)/usr/keychars/asusec.kcm:system/usr/keychars/asusec.kcm \
    $(LOCAL_PATH)/usr/keylayout/asusec.kl:system/usr/keylayout/asusec.kl \
    $(LOCAL_PATH)/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/usr/xt9/config/databases.conf:system/usr/xt9/config/databases.conf \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/azerty.french.center.kdb:system/usr/xt9/databases/kdb/azerty.french.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/kohqd.kdb:system/usr/xt9/databases/kdb/kohqd.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/qwerty.arabic.center.kdb:system/usr/xt9/databases/kdb/qwerty.arabic.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/qwerty.danish.center.kdb:system/usr/xt9/databases/kdb/qwerty.danish.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/qwerty.english.center.kdb:system/usr/xt9/databases/kdb/qwerty.english.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/qwerty.farsi.center.kdb:system/usr/xt9/databases/kdb/qwerty.farsi.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/qwerty.finish.center.kdb:system/usr/xt9/databases/kdb/qwerty.finish.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/qwerty.greek.center.kdb:system/usr/xt9/databases/kdb/qwerty.greek.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/qwerty.hebrew.center.kdb:system/usr/xt9/databases/kdb/qwerty.hebrew.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/qwerty.norwegian.center.kdb:system/usr/xt9/databases/kdb/qwerty.norwegian.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/qwerty.russian.center.kdb:system/usr/xt9/databases/kdb/qwerty.russian.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/qwerty.swedish.center.kdb:system/usr/xt9/databases/kdb/qwerty.swedish.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/qwerty.thai.center.kdb:system/usr/xt9/databases/kdb/qwerty.thai.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/qwertz.german.center.kdb:system/usr/xt9/databases/kdb/qwertz.german.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/reduced_azerty.french.center.kdb:system/usr/xt9/databases/kdb/reduced_azerty.french.center.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/kdb/ZHhpd_pinyin_bpmf_stroke_cangjie.kdb:system/usr/xt9/databases/kdb/ZHhpd_pinyin_bpmf_stroke_cangjie.kdb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/ARlsUN_xt9.ldb:system/usr/xt9/databases/ldb/ARlsUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/CSlsUN_xt9.ldb:system/usr/xt9/databases/ldb/CSlsUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/DAusUN_xt9.ldb:system/usr/xt9/databases/ldb/DAusUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/DEusUN_xt9_2.ldb:system/usr/xt9/databases/ldb/DEusUN_xt9_2.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/ELlsUN_xt9.ldb:system/usr/xt9/databases/ldb/ELlsUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/ENubUN_xt9_2.ldb:system/usr/xt9/databases/ldb/ENubUN_xt9_2.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/ESusUN_xt9_2.ldb:system/usr/xt9/databases/ldb/ESusUN_xt9_2.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/FAlsUN_xt9.ldb:system/usr/xt9/databases/ldb/FAlsUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/FIusUN_xt9_2.ldb:system/usr/xt9/databases/ldb/FIusUN_xt9_2.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/FRusUN_xt9_2.ldb:system/usr/xt9/databases/ldb/FRusUN_xt9_2.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/HElsUN_xt9.ldb:system/usr/xt9/databases/ldb/HElsUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/HUlsUN_xt9.ldb:system/usr/xt9/databases/ldb/HUlsUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/ITusUN_xt9_2.ldb:system/usr/xt9/databases/ldb/ITusUN_xt9_2.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/NLlsUN_xt9_2.ldb:system/usr/xt9/databases/ldb/NLlsUN_xt9_2.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/NOlsUN_xt9.ldb:system/usr/xt9/databases/ldb/NOlsUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/PLlsUN_xt9.ldb:system/usr/xt9/databases/ldb/PLlsUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/PTusUN_xt9.ldb:system/usr/xt9/databases/ldb/PTusUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/RUlsUN_xt9_2.ldb:system/usr/xt9/databases/ldb/RUlsUN_xt9_2.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/SKlsUN_xt9.ldb:system/usr/xt9/databases/ldb/SKlsUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/SVusUN_xt9.ldb:system/usr/xt9/databases/ldb/SVusUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/THlsUN_xt9.ldb:system/usr/xt9/databases/ldb/THlsUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/TRlsUN_xt9.ldb:system/usr/xt9/databases/ldb/TRlsUN_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/ZHsbUNps_GB2312_xt9.ldb:system/usr/xt9/databases/ldb/ZHsbUNps_GB2312_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/ldb/ZHtbUNps_Big5_bpmf_pinyin_CJ_xt9.ldb:system/usr/xt9/databases/ldb/ZHtbUNps_Big5_bpmf_pinyin_CJ_xt9.ldb \
    $(LOCAL_PATH)/usr/xt9/databases/mdb/DE.txt:system/usr/xt9/databases/mdb/DE.txt \
    $(LOCAL_PATH)/usr/xt9/databases/mdb/EN.txt:system/usr/xt9/databases/mdb/EN.txt \
    $(LOCAL_PATH)/usr/xt9/databases/mdb/ES.txt:system/usr/xt9/databases/mdb/ES.txt \
    $(LOCAL_PATH)/usr/xt9/databases/mdb/FR.txt:system/usr/xt9/databases/mdb/FR.txt \
    $(LOCAL_PATH)/usr/xt9/databases/mdb/IT.txt:system/usr/xt9/databases/mdb/IT.txt \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-ar_EG.kcm:system/usr/xt9/keychars/qwerty-ar_EG.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-cs_CZ.kcm:system/usr/xt9/keychars/qwerty-cs_CZ.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-da_DK.kcm:system/usr/xt9/keychars/qwerty-da_DK.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-de_CH.kcm:system/usr/xt9/keychars/qwerty-de_CH.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-de_DE.kcm:system/usr/xt9/keychars/qwerty-de_DE.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-el_GR.kcm:system/usr/xt9/keychars/qwerty-el_GR.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-en_CA.kcm:system/usr/xt9/keychars/qwerty-en_CA.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-en_GB.kcm:system/usr/xt9/keychars/qwerty-EN_GB.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-en_GR.kcm:system/usr/xt9/keychars/qwerty-en_GR.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-en_US.kcm:system/usr/xt9/keychars/qwerty-en_US.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-es_ES.kcm:system/usr/xt9/keychars/qwerty-es_ES.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-es_US.kcm:system/usr/xt9/keychars/qwerty-es_US.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-fa_IR.kcm:system/usr/xt9/keychars/qwerty-fa_IR.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-fi_FI.kcm:system/usr/xt9/keychars/qwerty-fi_FI.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-fr_BE.kcm:system/usr/xt9/keychars/qwerty-fr_BE.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-fr_CA.kcm:system/usr/xt9/keychars/qwerty-fr_CA.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-fr_CH.kcm:system/usr/xt9/keychars/qwerty-fr_CH.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-fr_FR.kcm:system/usr/xt9/keychars/qwerty-fr_FR.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-hu_HU.kcm:system/usr/xt9/keychars/qwerty-hu_HU.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-it_CH.kcm:system/usr/xt9/keychars/qwerty-it_CH.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-it_IT.kcm:system/usr/xt9/keychars/qwerty-it_IT.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-iw_IL.kcm:system/usr/xt9/keychars/qwerty-iw_IL.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-ko_KR.kcm:system/usr/xt9/keychars/qwerty-ko_KR.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-nb_NO.kcm:system/usr/xt9/keychars/qwerty-nb_NO.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-nl_BE.kcm:system/usr/xt9/keychars/qwerty-nl_BE.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-nl_NL.kcm:system/usr/xt9/keychars/qwerty-nl_NL.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-pl_PL.kcm:system/usr/xt9/keychars/qwerty-pl_PL.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-pt_BR.kcm:system/usr/xt9/keychars/qwerty-pt_BR.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-pt_PT.kcm:system/usr/xt9/keychars/qwerty-pt_PT.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-ru_RU.kcm:system/usr/xt9/keychars/qwerty-ru_RU.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-sk_SK.kcm:system/usr/xt9/keychars/qwerty-sk_SK.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-sv_SE.kcm:system/usr/xt9/keychars/qwerty-sv_SE.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-th_TH.kcm:system/usr/xt9/keychars/qwerty-th_TH.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-tr_TR.kcm:system/usr/xt9/keychars/qwerty-tr_TR.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-zh_CN.kcm:system/usr/xt9/keychars/qwerty-zh_CN.kcm \
    $(LOCAL_PATH)/usr/xt9/keychars/qwerty-zh_TW.kcm:system/usr/xt9/keychars/qwerty-zh_TW.kcm \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-ar_EG.kl:system/usr/xt9/keylayout/qwerty-ar_EG.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-cs_CZ.kl:system/usr/xt9/keylayout/qwerty-cs_CZ.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-cs_CZ-qwerty.kl:system/usr/xt9/keylayout/qwerty-cs_CZ-qwerty.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-da_DK.kl:system/usr/xt9/keylayout/qwerty-da_DK.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-de_CH.kl:system/usr/xt9/keylayout/qwerty-de_CH.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-de_DE.kl:system/usr/xt9/keylayout/qwerty-de_DE.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-el_GR.kl:system/usr/xt9/keylayout/qwerty-el_GR.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-en_CA.kl:system/usr/xt9/keylayout/qwerty-en_CA.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-en_GB.kl:system/usr/xt9/keylayout/qwerty-EN_GB.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-en_GR.kl:system/usr/xt9/keylayout/qwerty-en_GR.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-en_US.kl:system/usr/xt9/keylayout/qwerty-en_US.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-es_ES.kl:system/usr/xt9/keylayout/qwerty-es_ES.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-es_US.kl:system/usr/xt9/keylayout/qwerty-es_US.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-fa_IR.kl:system/usr/xt9/keylayout/qwerty-fa_IR.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-fi_FI.kl:system/usr/xt9/keylayout/qwerty-fi_FI.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-fr_BE.kl:system/usr/xt9/keylayout/qwerty-fr_BE.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-fr_CA.kl:system/usr/xt9/keylayout/qwerty-fr_CA.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-fr_CH.kl:system/usr/xt9/keylayout/qwerty-fr_CH.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-fr_FR.kl:system/usr/xt9/keylayout/qwerty-fr_FR.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-hu_HU.kl:system/usr/xt9/keylayout/qwerty-hu_HU.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-it_CH.kl:system/usr/xt9/keylayout/qwerty-it_CH.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-it_IT.kl:system/usr/xt9/keylayout/qwerty-it_IT.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-iw_IL.kl:system/usr/xt9/keylayout/qwerty-iw_IL.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-ko_KR.kl:system/usr/xt9/keylayout/qwerty-ko_KR.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-nb_NO.kl:system/usr/xt9/keylayout/qwerty-nb_NO.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-nl_BE.kl:system/usr/xt9/keylayout/qwerty-nl_BE.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-nl_NL.kl:system/usr/xt9/keylayout/qwerty-nl_NL.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-pl_PL.kl:system/usr/xt9/keylayout/qwerty-pl_PL.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-pt_BR.kl:system/usr/xt9/keylayout/qwerty-pt_BR.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-pt_PT.kl:system/usr/xt9/keylayout/qwerty-pt_PT.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-ru_RU.kl:system/usr/xt9/keylayout/qwerty-ru_RU.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-sk_SK.kl:system/usr/xt9/keylayout/qwerty-sk_SK.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-sv_SE.kl:system/usr/xt9/keylayout/qwerty-sv_SE.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-th_TH.kl:system/usr/xt9/keylayout/qwerty-th_TH.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-tr_TR.kl:system/usr/xt9/keylayout/qwerty-tr_TR.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-zh_CN.kl:system/usr/xt9/keylayout/qwerty-zh_CN.kl \
    $(LOCAL_PATH)/usr/xt9/keylayout/qwerty-zh_TW.kl:system/usr/xt9/keylayout/qwerty-zh_TW.kl

# Any prebuilt kernel modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
    $(LOCAL_PATH)/modules/battery_rvsd.ko:system/lib/modules/battery_rvsd.ko \
    $(LOCAL_PATH)/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    $(LOCAL_PATH)/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko

# Camera/WiFi/BT Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/firmware/BCM4329B1_002.002.023.0797.0863.hcd:system/etc/firmware/BCM4329B1_002.002.023.0797.0863.hcd \
    $(LOCAL_PATH)/prebuilt/firmware/fw_bcm4329.bin:system/vendor/firmware/fw_bcm4329.bin \
    $(LOCAL_PATH)/prebuilt/firmware/fw_bcm4329_apsta.bin:system/vendor/firmware/fw_bcm4329_apsta.bin \
    $(LOCAL_PATH)/wifi/nvram_murata.txt:system/etc/nvram_murata.txt \
    $(LOCAL_PATH)/wifi/nvram_nh615_sl101.txt:system/etc/nvram_nh615_sl101.txt \
    $(LOCAL_PATH)/wifi/nvram_nh615.txt:system/etc/nvram_nh615.txt \
    $(LOCAL_PATH)/wifi/nvram.txt:system/etc/nvram.txt

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.asus.hardware.00.xml:system/etc/permissions/com.asus.hardware.00.xml \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Build characteristics setting 
PRODUCT_CHARACTERISTICS := tablet

# This device have enough room for precise davick
PRODUCT_TAGS += dalvik.gc.type-precise

# Extra packages to build for this device
PRODUCT_PACKAGES += \
    	librs_jni \
	com.android.future.usb.accessory \
	make_ext4fs \
	setup_fs \
        audio.a2dp.default \
        libaudioutils \
	libinvensense_mpl \
        blobpack_tf

# Propertys spacific for this device
#ro.build.branch and ro.build.modversion is for system update (still in dev)(timbit123)
PRODUCT_PROPERTY_OVERRIDES := \
	ro.wifi.country=GB \
        ro.build.branch=tf101 \
	ro.build.modversion=1.0.0 \
        ro.ethernet.interface=eth0 \
        ro.ethernet.autoEnable=yes \
    	wifi.interface=wlan0 \
    	wifi.supplicant_scan_interval=15 \
    	ro.opengles.version=131072 \
	persist.sys.usb.config=mtp,adb \
	dalvik.vm.dexopt-data-only=1

# Inherit tablet dalvik settings
$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)

# Call the vendor to setup propiatory files
$(call inherit-product-if-exists, vendor/asus/tf101/tf101-vendor.mk)
PRODUCT_MANUFACTURER := Asus
