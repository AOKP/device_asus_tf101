LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libasusdec_jni

ifeq ($(TARGET_ASUSDEC_DEVICE_NODE),)
	TARGET_ASUSDEC_DEVICE_NODE := /dev/asusdec
endif

LOCAL_CFLAGS := -DASUSDEC_DEV=\"$(TARGET_ASUSDEC_DEVICE_NODE)\"

# All of the source files that we will compile.
LOCAL_SRC_FILES:= \
	com_cyanogenmod_asusdec_AsusdecNative.cpp

# All of the shared libraries we link against.
LOCAL_SHARED_LIBRARIES := \
	libandroid_runtime \
	libnativehelper \
	libcutils \
	libutils

# Also need the JNI headers.
LOCAL_C_INCLUDES += \
	$(JNI_H_INCLUDE)

include $(BUILD_SHARED_LIBRARY)
