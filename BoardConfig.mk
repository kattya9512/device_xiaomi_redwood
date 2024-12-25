#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/redwood

# Ignore overriding commands errors
BUILD_BROKEN_DUP_RULES := true

RELAX_USES_LIBRARY_CHECK=true

# Inherit from sm7325-common
include device/xiaomi/sm7325-common/BoardConfigCommon.mk

# Board
TARGET_BOOTLOADER_BOARD_NAME := redwood

# Kernel
TARGET_KERNEL_CONFIG += vendor/redwood-fragment.config

# Kernel modules
BOOT_KERNEL_MODULES := \
    goodix_core.ko \
    xiaomi_touch.ko

BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

# Include proprietary files
include vendor/xiaomi/redwood/BoardConfigVendor.mk

# Include firmware
include vendor/xiaomi/redwood-firmware/config.mk
