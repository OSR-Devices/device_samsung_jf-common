# Copyright (C) 2009 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/jf-common/include

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_CPU_VARIANT := krait

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 zcache msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_BASE := 0x80200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := cyanogen_jf_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/jf

# linaro
TARGET_KERNEL_CUSTOM_TOOLCHAIN := linaro-4.7-12.10/bin/arm-linux-gnueabihf-

# Audio
BOARD_HAVE_AUDIENCE_ES325_2MIC := true
BOARD_HAVE_DOCK_USBAUDIO := true
BOARD_HAVE_SAMSUNG_AUDIO := true
BOARD_HAVE_SAMSUNG_CSDCLIENT := true
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_FLUENCE_FOR_VOIP := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_USES_SEPERATED_HEADSET_MIC := true
BOARD_USES_SEPERATED_VOICE_SPEAKER := true
BOARD_USES_SEPERATED_VOIP := true
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_USES_QCOM_COMPRESSED_AUDIO := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/jf-common/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/jf-common/bluetooth/vnd_jf.txt
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Camera
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGING_CMDLINE_NAME := "androidboot.bootchg"
BOARD_CHARGING_CMDLINE_VALUE := "true"

# Hardware
BOARD_HARDWARE_CLASS := device/samsung/jf-common/cmhw

# Display
BOARD_EGL_CFG := device/samsung/jf-common/configs/egl.cfg
COMMON_GLOBAL_CFLAGS += -DNEW_ION_API
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_NO_INITLOGO := true
TARGET_QCOM_DISPLAY_VARIANT := caf

# The "new" GPS is really the old GPS, override it.
BOARD_HAVE_NEW_QC_GPS :=
TARGET_PROVIDES_GPS_LOC_API := true

# We don't use old-ass RPC
TARGET_NO_RPC := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_QCOM_MEDIA_VARIANT := caf

# NFC
BOARD_NFC_HAL_SUFFIX := msm8960

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1572864000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28651290624
BOARD_FLASH_BLOCK_SIZE := 131072

# Power
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm support
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
TARGET_USES_QCOM_BSP := true

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_FSTAB := device/samsung/jf-common/rootdir/etc/fstab.qcom

# External apps on SD
TARGET_EXTERNAL_APPS = sdcard1

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/jf-common/releasetools

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/jf-common/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    app.te \
    bluetooth.te \
    device.te \
    domain.te \
    drmserver.te \
    file.te \
    hci_init.te \
    healthd.te \
    init.te \
    init_shell.te \
    keystore.te \
    kickstart.te \
    mediaserver.te \
    nfc.te \
    rild.te \
    surfaceflinger.te \
    system.te \
    ueventd.te \
    wpa.te \
    wpa_socket.te

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_jflte
TARGET_LIBINIT_DEFINES_FILE := device/samsung/jf-common/init/init_jflte.c

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 28
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi module
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_BAND := 802_11_ABG
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin"
