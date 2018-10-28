#
# Copyright (C) 2018 The TwrpBuilder Open-Source Project
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
#

LOCAL_PATH := device/samsung/vivalto5mve3g

TARGET_BOARD_PLATFORM := sc8830
TARGET_BOOTLOADER_BOARD_NAME := vivalto5mve3g
# Assert
TARGET_OTA_ASSERT_DEVICE := vivalto5mve3g,SM-G316HU,SC7727S
TARGET_USERIMAGES_USE_F2FS := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 0
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_RECOVERY_SWIPE := true
BOARD_USES_MMCUTILS := true
BOARD_SUPPRESS_EMMC_WIPE := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"

# Kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dt $(LOCAL_PATH)/dt.img

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
ifneq ($(filter msm8974 msm8227 msm8627 msm8230 apq8030 msm8630 msm8930 msm8930AA apq8060A msm8260A msm8660A msm8960 MPQ8064 msm8674 msm8274 apq8084,$(TARGET_BOARD_PLATFORM)),)
TARGET_CPU_VARIANT := krait
TARGET_RECOVERY_QCOM_RTC_FIX := true
else 
TARGET_CPU_VARIANT := cortex-a7
endif

# TWRP
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
ifeq ($(TW_THEME),)
TW_THEME := portrait_hdpi
endif
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/battery
TW_BRIGHTNESS_PATH := /sys/class/backlight/panel/brightness
