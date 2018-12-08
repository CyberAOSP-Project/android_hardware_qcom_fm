ifeq ($(BOARD_HAVE_QCOM_FM),true)
#ifneq (,$(filter $(QCOM_BOARD_PLATFORMS),$(TARGET_BOARD_PLATFORM)))
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    FmIoctlsInterface.cpp \
    ConfigFmThs.cpp \
    FmPerformanceParams.cpp \
    ConfFileParser.cpp \
    FmRadioController.cpp \
    LibfmJni.cpp

LOCAL_C_INCLUDES := $(JNI_H_INCLUDE) \
    frameworks/base/core/jni/include \
    frameworks/base/include/media

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libdl \
    liblog \
    libmedia \
    libnativehelper \

ifeq ($(TARGET_FM_LEGACY_PATCHLOADER),true)
    LOCAL_CFLAGS += -DFM_LEGACY_PATCHLOADER
endif

ifeq ($(TARGET_QCOM_NO_FM_FIRMWARE),true)
    LOCAL_CFLAGS += -DQCOM_NO_FM_FIRMWARE
endif

LOCAL_MODULE := libfmjni
include $(BUILD_SHARED_LIBRARY)

#endif

endif # BOARD_HAVE_QCOM_FM
