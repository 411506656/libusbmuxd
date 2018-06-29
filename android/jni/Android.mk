LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := plist
#LOCAL_SRC_FILES := ../../libplist/android/$(TARGET_ARCH_ABI)/libplist.a
LOCAL_SRC_FILES := ../libplist.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LIBUSBMUXD_SOURCES := \
	libusbmuxd.c

COMMON_SOURCES := \
    collection.c \
    socket.c 


LOCAL_MODULE := usbmuxd

LOCAL_SRC_FILES := $(addprefix ../../common/, $(COMMON_SOURCES)) \
                   $(addprefix ../../src/, $(LIBUSBMUXD_SOURCES))

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/../../common \
    $(LOCAL_PATH)/../../include \
    $(LOCAL_PATH)/../../../libplist/libcnary/include \
    $(LOCAL_PATH)/../../../libplist/libcnary \
    $(LOCAL_PATH)/../../../libplist/include \
    $(LOCAL_PATH)/../../src

#ifeq ($(TARGET_ARCH), arm)
#    LOCAL_CFLAGS += -DARM
#else ifeq ($(TARGET_ARCH), mips)
#    LOCAL_CFLAGS += -DMIPS
#else 
#    LOCAL_CFLAGS += -DX86
#endif

LOCAL_CFLAGS  += -DHAVE_INOTIFY -DHAVE_FVISIBILITY -g
LOCAL_STATIC_LIBRARIES += libplist
LOCAL_LDFLAGS += -llog


include $(BUILD_STATIC_LIBRARY)
