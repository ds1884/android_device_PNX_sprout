#
# Copyright (C) 2018,2020 The lineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),PNX_sprout)
   subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
   $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

include $(CLEAR_VARS)

GPS_CONF_SYMLINK := $(PRODUCT_OUT)/system/etc/gps.conf
$(GPS_CONF_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf /vendor/etc/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(GPS_CONF_SYMLINK)

IMS_LIBS := libimscamera_jni.so libimsmedia_jni.so
IMS_SYMLINKS := $(addprefix $(TARGET_OUT_PRODUCT_APPS_PRIVILEGED)/ims/lib/arm64/,$(notdir $(IMS_LIBS)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "IMS lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /product/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(IMS_SYMLINKS)

endif
