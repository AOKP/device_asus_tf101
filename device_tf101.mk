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

DEVICE_PACKAGE_OVERLAYS += device/asus/tf101/overlay

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
    $(LOCAL_PATH)/ramdisk/sbin/adbd:root/sbin/adbd \
    $(LOCAL_PATH)/ramdisk/sbin/ueventd:root/sbin/ueventd \
    $(LOCAL_PATH)/ramdisk/default.prop:root/default.prop \
    $(LOCAL_PATH)/ramdisk/init.00.rc:root/init.00.rc \
    $(LOCAL_PATH)/ramdisk/init.01.rc:root/init.01.rc \
    $(LOCAL_PATH)/ramdisk/init.08.rc:root/init.08.rc \
    $(LOCAL_PATH)/ramdisk/init.goldfish.rc:root/init.goldfish.rc \
    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
    $(LOCAL_PATH)/ramdisk/init.ventana.rc:root/init.ventana.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.ventana.rc:root/ueventd.ventana.rc

# Prebuilt configeration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/asound.conf:system/etc/asound.conf \
    $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/prebuilt/etc/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/prebuilt/etc/gps/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
    $(LOCAL_PATH)/prebuilt/data/srs_processing.cfg:system/data/srs_processing.cfg

# Input device configeration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/elantech_touchscreen.idc:system/usr/idc/elantech_touchscreen.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/panjit_touch.idc:system/usr/idc/panjit_touch.idc \
    $(LOCAL_PATH)/prebuilt/usr/keychars/asusec.kcm:system/usr/keychars/asusec.kcm \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/asusec.kl:system/usr/keylayout/asusec.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl 

# Any prebuilt kernel modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/lib/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
    $(LOCAL_PATH)/prebuilt/lib/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    $(LOCAL_PATH)/prebuilt/lib/modules/battery_rvsd.ko:system/lib/modules/battery_rvsd.ko \
    $(LOCAL_PATH)/prebuilt/lib/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    $(LOCAL_PATH)/prebuilt/lib/modules/cifs.ko:system/lib/modules/cifs.ko \
    $(LOCAL_PATH)/prebuilt/lib/modules/md4.ko:system/lib/modules/md4.ko \
    $(LOCAL_PATH)/prebuilt/lib/modules/texfat.ko:system/lib/modules/texfat.ko \
    $(LOCAL_PATH)/prebuilt/lib/modules/tntfs.ko:system/lib/modules/tntfs.ko

# Camera/WiFi/BT Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/bdaddr:system/etc/bluetooth/bdaddr \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/network.conf:system/etc/bluetooth/network.conf \
    $(LOCAL_PATH)/prebuilt/etc/nvram.txt:system/etc/nvram.txt \
    $(LOCAL_PATH)/prebuilt/etc/nvram_murata.txt:system/etc/nvram_murata.txt \
    $(LOCAL_PATH)/prebuilt/etc/nvram_nh615.txt:system/etc/nvram_nh615.txt \
    $(LOCAL_PATH)/prebuilt/etc/nvram_nh615_sl101.txt:system/etc/nvram_nh615_sl101.txt \
    $(LOCAL_PATH)/prebuilt/etc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    $(LOCAL_PATH)/prebuilt/etc/firmware/BCM4329B1_002.002.023.0797.0863.hcd:system/etc/firmware/BCM4329B1_002.002.023.0797.0863.hcd \
    $(LOCAL_PATH)/prebuilt/etc/firmware/BCM4329B1_002.002.023.0797.0879.hcd:system/etc/firmware/BCM4329B1_002.002.023.0797.0879.hcd \
    $(LOCAL_PATH)/prebuilt/etc/firmware/BCM4329B1_002.002.023.0797.0942.hcd:system/etc/firmware/BCM4329B1_002.002.023.0797.0942.hcd \
    $(LOCAL_PATH)/prebuilt/etc/BtService.sh:system/etc/BtService.sh \
    $(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/vendor/firmware/fw_bcm4329.bin:system/vendor/firmware/fw_bcm4329.bin \
    $(LOCAL_PATH)/prebuilt/vendor/firmware/fw_bcm4329_apsta.bin:system/vendor/firmware/fw_bcm4329_apsta.bin \
    $(LOCAL_PATH)/prebuilt/vendor/firmware/bcm4329/fw_bcmdhd.bin:system/vendor/firmware/bcm4329/fw_bcmdhd.bin \
    $(LOCAL_PATH)/prebuilt/vendor/firmware/bcm4329/fw_bcmdhd_apsta.bin:system/vendor/firmware/bcm4329/fw_bcmdhd_apsta.bin \
    $(LOCAL_PATH)/prebuilt/vendor/firmware/bcm4329/fw_bcmdhd_p2p.bin:system/vendor/firmware/bcm4329/fw_bcmdhd_p2p.bin \
    $(LOCAL_PATH)/prebuilt/bin/brcm_patchram_plus:system/bin/brcm_patchram_plus \
    $(LOCAL_PATH)/prebuilt/bin/pppd_btdun:system/bin/pppd_btdun \
    $(LOCAL_PATH)/prebuilt/bin/wifimacwriter:system/bin/wifimacwriter

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
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
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    $(LOCAL_PATH)/prebuilt/etc/permissions/com.asus.hardware.00.xml:system/etc/permissions/com.asus.hardware.00.xml \
    $(LOCAL_PATH)/prebuilt/etc/permissions/com.asus.hardware.01.xml:system/etc/permissions/com.asus.hardware.01.xml \
    $(LOCAL_PATH)/prebuilt/etc/permissions/com.asus.hardware.08.xml:system/etc/permissions/com.asus.hardware.08.xml \
    $(LOCAL_PATH)/prebuilt/etc/permissions/com.asus.hardware.10.xml:system/etc/permissions/com.asus.hardware.10.xml

# ALSA Config files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/alsa.conf:system/usr/share/alsa/alsa.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
    $(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf

#Misc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/app/LatinIME.apk:system/app/LatinIME.apk \
    $(LOCAL_PATH)/prebuilt/app/LatinImeDictionaryPack.apk:system/app/LatinImeDictionaryPack.apk \
    $(LOCAL_PATH)/prebuilt/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    $(LOCAL_PATH)/prebuilt/xbin/remount:system/xbin/remount \
    $(LOCAL_PATH)/prebuilt/bin/sensors-config:system/bin/sensors-config \
    $(LOCAL_PATH)/prebuilt/bin/glgps:system/bin/glgps \
    $(LOCAL_PATH)/prebuilt/bin/ps3service:system/bin/ps3service \
    $(LOCAL_PATH)/prebuilt/xbin/rfcomm:system/xbin/rfcomm \
    $(LOCAL_PATH)/prebuilt/xbin/ps3bttest:system/xbin/ps3bttest \
    $(LOCAL_PATH)/prebuilt/bin/sixpair:system/bin/sixpair \
    $(LOCAL_PATH)/prebuilt/etc/permissions/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    $(LOCAL_PATH)/prebuilt/lib/libhuawei-ril.so:system/lib/libhuawei-ril.so \
    $(LOCAL_PATH)/prebuilt/etc/init.d/02ppp:system/etc/init.d/02ppp \
    $(LOCAL_PATH)/prebuilt/etc/init.d/05modules:system/etc/init.d/05modules \
    $(LOCAL_PATH)/prebuilt/etc/ppp/peers/gprs:system/etc/ppp/peers/gprs \
    $(LOCAL_PATH)/prebuilt/etc/ppp/peers/pppd-ril.options:system/etc/ppp/peers/pppd-ril.options \
    $(LOCAL_PATH)/prebuilt/etc/ppp/chap-secrets:system/etc/ppp/chap-secrets \
    $(LOCAL_PATH)/prebuilt/etc/ppp/gprs-connect-chat:system/etc/ppp/gprs-connect-chat \
    $(LOCAL_PATH)/prebuilt/etc/ppp/ip-down:system/etc/ppp/ip-down \
    $(LOCAL_PATH)/prebuilt/etc/ppp/ip-down-HUAWEI:system/etc/ppp/ip-down-HUAWEI \
    $(LOCAL_PATH)/prebuilt/etc/ppp/ip-up:system/etc/ppp/ip-up \
    $(LOCAL_PATH)/prebuilt/etc/ppp/ip-up-HUAWEI:system/etc/ppp/ip-up-HUAWEI \
    $(LOCAL_PATH)/prebuilt/etc/ppp/ip-up-vpn:system/etc/ppp/ip-up-vpn \
    $(LOCAL_PATH)/prebuilt/etc/ppp/options.huawei:system/etc/ppp/options.huawei \
    $(LOCAL_PATH)/prebuilt/etc/ppp/pap-secrets:system/etc/ppp/pap-secrets
   
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
        blobpack_tf \
        l2ping \
        hcitool \
        bttest \
        whisperd

# Propertys spacific for this device
PRODUCT_PROPERTY_OVERRIDES := \
    	wifi.interface=wlan0 \
    	wifi.supplicant_scan_interval=15 \
    	ro.opengles.version=131072 \
	persist.sys.usb.config=mtp,adb \
	dalvik.vm.dexopt-data-only=1

# Inherit tablet dalvik settings
$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)

# Call the vendor to setup propiatory files
$(call inherit-product-if-exists, vendor/asus/tf101/tf101-vendor.mk)

# Device nameing
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_tf101
PRODUCT_DEVICE := tf101
PRODUCT_MODEL := tf101
PRODUCT_BRAND := asus
PRODUCT_MANUFACTURER := asus
