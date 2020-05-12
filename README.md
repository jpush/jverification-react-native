# JVerification-React-Native

## ChangeLog

### v 2.4.3
- iOS、android增加弹窗登录

### v 2.4.2
- 修复bug,优化体验

### v 2.4.1
- 修复了安卓设置隐私文字大小无效

### v 2.4.0
- 更新了原生sdk版本
- 增加获取验证码，设置前后两次获取验证码时间间隔的功能

### v 2.3.0
1.由于RN-JCore1.6.0存在编译问题，从RN-JCore1.7.0开始，还是需要在AndroidManifest.xml中添加配置代码，具体参考 配置-2.1 Android

2.修复添加自定义布局问题

## 1. 安装

```
npm install jverification-react-native --save
```

* 注意：如果项目里没有jcore-react-native，需要安装

  ```
  npm install jcore-react-native --save
  ```

## 2. 配置

### 2.1 Android

* build.gradle

  ```
  android {
        defaultConfig {
            applicationId "yourApplicationId"           //在此替换你的应用包名
            ...
            manifestPlaceholders = [
                    JPUSH_APPKEY: "yourAppKey",         //在此替换你的APPKey
                    JPUSH_CHANNEL: "yourChannel"        //在此替换你的channel
            ]
        }
    }
  ```

  ```
  dependencies {
        ...
        implementation project(':jverification-react-native') // 添加 jverification 依赖
        implementation project(':jcore-react-native')         // 添加 jcore 依赖
    }
  ```

* setting.gradle

  ```
  include ':jverification-react-native'
  project(':jverification-react-native').projectDir = new File(rootProject.projectDir, '../node_modules/jverification-react-native/android')
  include ':jcore-react-native'
  project(':jcore-react-native').projectDir = new File(rootProject.projectDir, '../node_modules/jcore-react-native/android')
  ```

### 2.2 iOS

### 2.2.1 pod

```
pod install
```

* 注意：如果项目里使用pod安装过，请先执行命令

  ```
  pod deintegrate
  ```

### 2.2.2 手动方式

* Libraries

  ```
  Add Files to "your project name"
  node_modules/jcore-react-native/ios/RCTJCoreModule.xcodeproj
  node_modules/jverification-react-native/ios/RCTJVerificationModule.xcodeproj
  ```

* Build Settings

  ```
  All --- Search Paths --- Header Search Paths --- +
  $(SRCROOT)/../node_modules/jcore-react-native/ios/RCTJCoreModule/
  $(SRCROOT)/../node_modules/jverification-react-native/ios/RCTJVerificationModule/
  ```

* Build Phases

  ```
  libz.tbd
  libc++.1.tbd
  libresolv.tbd
  libsqlite3.tbd
  libRCTJCoreModule.a
  libRCTJVerificationModule.a
  ```

* info.plist

  ```
  View controller-based status bar appearance : YES
  ```


## 3. 引用

参考：[App.js](https://github.com/jpush/jverification-react-native/tree/master/example/App.js)

## 4. API

详见：[index.js](https://github.com/jpush/jverification-react-native/tree/master/index.js)

## 5.  其他

* 集成前务必将example工程跑通
* JVerification2.2.0属于重构版本，如有紧急需求请前往[极光社区](https://community.jiguang.cn/c/question)
* 上报问题还麻烦先调用JVerification.setLoggerEnable( true)，拿到debug日志

 