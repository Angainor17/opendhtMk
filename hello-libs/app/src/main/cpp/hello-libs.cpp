#include <cstring>
#include <jni.h>
#include <cinttypes>
#include <android/log.h>
#include <string>

#include <opendht.h>
#include <vector>

extern "C" JNIEXPORT jstring JNICALL
Java_com_example_hellolibs_MainActivity_stringFromJNI(JNIEnv *env, jobject thiz) {

    return env->NewStringUTF("! Hello from JNI LIBS!");
}



