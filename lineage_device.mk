#
# Copyright (C) 2018-2019 The lineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Project lineage stuff.
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_FACE_UNLOCK_SUPPORTED := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device Stuff
$(call inherit-product, device/nokia/PNX_sprout/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_PNX_sprout
PRODUCT_DEVICE := PNX_sprout
PRODUCT_BRAND := nokia
PRODUCT_MODEL := Nokia 8.1
PRODUCT_MANUFACTURER := FIH

BUILD_FINGERPRINT := "Nokia/Phoenix_00WW/PNX_sprout:11/RKQ1.200906.002/00WW_6_210:user/release-key"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="PNX_00WW_FIH-user 11 00WW_6_210 00WW_6_210 release-keys" \
    PRODUCT_NAME="Phoenix_00WW"

PRODUCT_GMS_CLIENTID_BASE := android-nokia
    TARGET_USES_BLUR := true
    TARGET_FACE_UNLOCK_SUPPORTED := true
    lineage_BUILD_TYPE := Unofficial
    lineage_DEVICE_MAINTAINER := Dhruv Singh
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
