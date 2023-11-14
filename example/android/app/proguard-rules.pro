# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /usr/local/Cellar/android-sdk/24.3.3/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:
        -dontoptimize
        -dontpreverify

        -dontwarn cn.jpush.**
        -keep class cn.jpush.** {*;}
        -dontwarn cn.jiguang.**
        -keep class cn.jiguang.** {*;}
        
        -dontwarn cn.com.chinatelecom.**
        -keep class cn.com.chinatelecom.** {*;}
        -dontwarn com.ct.**
        -keep class com.ct.** {*;}
        -dontwarn a.a.**
        -keep class a.a.** {*;}
        -dontwarn com.cmic.**
        -keep class com.cmic.** {*;}
        -dontwarn com.unicom.**
        -keep class com.unicom.** {*;}
        -dontwarn com.sdk.**
        -keep class com.sdk.** {*;}

        -dontwarn com.sdk.**
        -keep class com.sdk.** {*;}

        
        
