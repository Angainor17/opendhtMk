# Copyright (C) 2010 The Android Open Source Project
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

#LOCAL_PATH := $(call my-dir)
#
#include $(LOCAL_PATH)/../../common.mk
#C:/Users/angai/AndroidStudioProjects/ndk-samples/hello-libs/app/src/main/cpp
#JNI_SRC_PATH := $(SAMPLES_ROOT)/hello-libs/app/src/main/cpp
JNI_SRC_PATH := C:/Users/angai/AndroidStudioProjects/ndk-samples/hello-libs/app/src/main/cpp
EXT_LIB_ROOT := C:/Users/angai/AndroidStudioProjects/ndk-samples/hello-libs/distribution
#EXT_LIB_ROOT := $(SAMPLES_ROOT)/hello-libs/distribution


# import 2 libs: remember to generate them SEPARATELY in terminal/command line first!
#include $(CLEAR_VARS)
#LOCAL_MODULE := local_gopendht_static
#LOCAL_SRC_FILES := $(EXT_LIB_ROOT)/gopendht/lib/$(TARGET_ARCH_ABI)/libopendht.a
#LOCAL_EXPORT_C_INCLUDES := $(EXT_LIB_ROOT)/gopendht/include
#include $(PREBUILT_STATIC_LIBRARY)

# ###############################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE := local_gopendht_static
LOCAL_SRC_FILES := $(EXT_LIB_ROOT)/gopendht/lib/$(TARGET_ARCH_ABI)/libopendht.a
LOCAL_EXPORT_C_INCLUDES := $(EXT_LIB_ROOT)/gopendht/include
include $(PREBUILT_STATIC_LIBRARY)
# ###############################################################################################
#include $(CLEAR_VARS)
#LOCAL_MODULE := local_gopendht_shared
#LOCAL_SRC_FILES := $(EXT_LIB_ROOT)/gopendht/lib/$(TARGET_ARCH_ABI)/libopendht_2_0_0.so
#LOCAL_EXPORT_C_INCLUDES := $(EXT_LIB_ROOT)/gopendht/include
#include $(PREBUILT_SHARED_LIBRARY)
# ###############################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := local_msgpack_static
LOCAL_SRC_FILES := $(EXT_LIB_ROOT)/gmsgpack/lib/$(TARGET_ARCH_ABI)/libmsgpackc.a
LOCAL_EXPORT_C_INCLUDES := $(EXT_LIB_ROOT)/gmsgpack/include
include $(PREBUILT_STATIC_LIBRARY)

# ###############################################################################################
#include $(CLEAR_VARS)
#LOCAL_MODULE := local_gnutls_shared
#LOCAL_SRC_FILES := $(EXT_LIB_ROOT)/gnutls/lib/$(TARGET_ARCH_ABI)/libgnutls_30_0_0.so
#LOCAL_EXPORT_C_INCLUDES := $(EXT_LIB_ROOT)/gnutls/include
#include $(PREBUILT_SHARED_LIBRARY)

# ###############################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := local_gnutls_static
LOCAL_SRC_FILES := $(EXT_LIB_ROOT)/gnutls/lib/$(TARGET_ARCH_ABI)/libgnutls.a
LOCAL_EXPORT_C_INCLUDES := $(EXT_LIB_ROOT)/gnutls/include
include $(PREBUILT_STATIC_LIBRARY)

# ###############################################################################################
#include $(CLEAR_VARS)
#LOCAL_MODULE := local_gperf
#LOCAL_SRC_FILES := $(EXT_LIB_ROOT)/gperf/lib/$(TARGET_ARCH_ABI)/libgperf.so
#LOCAL_EXPORT_C_INCLUDES := $(EXT_LIB_ROOT)/gperf/include
#include $(PREBUILT_SHARED_LIBRARY)
# ###############################################################################################

# build our app's shared lib
include $(CLEAR_VARS)
LOCAL_CFLAGS := -std=c++14
LOCAL_MODULE    := hellolibs
LOCAL_SRC_FILES := $(JNI_SRC_PATH)/hello-libs.cpp
#LOCAL_SHARED_LIBRARIES := local_gopendht_shared
LOCAL_STATIC_LIBRARIES := local_gnutls_static local_msgpack_static local_gopendht_static
LOCAL_LDLIBS    := -llog -landroid

include $(BUILD_SHARED_LIBRARY)
