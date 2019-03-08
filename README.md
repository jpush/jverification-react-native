# jverification-react-native 

极光官方开发的[极光认证](https://docs.jiguang.cn/jverification/guideline/intro/) react-native 插件，为开发者提供了快速验证用户输入的手机号码和本机 SIM 卡号码一致性的功能，提高用户体验和安全性。

## 安装

```
npm install jverification-react-native --save
npm install jcore-react-native --save 
```
## 链接

##### 通过脚手架生成的项目（react-native init）：

如果工程不是通过 Cocoapods 来集成 ReactNative 的可以直接使用下面代码来 link 插件。

```
react-native link
```

##### 通过 Cocoapods 集成的 react-native 项目：

如果想使用 Cocoapods 来集成这个项目，可以在 Podfile 中加入如下配置（如果没听过 Cocoapods 下面配置不用管。）：**注意： (jverification-react-native@1.2.3+ 才支持该集成方式)**

```
pod 'JVerificationRN', :path => '../node_modules/jverification-react-native'
```



## 配置

#### iOS

#####  通过 Cocoapods 方式集成不需要下列配置。

- 打开工程，进入 Build Settings -> Framework search paths 添加 framework 搜索路径

  ```
  $(SRCROOT)/../node_modules/jverification-react-native/ios/RCTJVerificationModule
  ```

- 打开工程，进入 Build Settings -> Other Link Flag 添加一行编译选项

  ```
  -framework "TYRZNoUISDK"
  -framework "account_verify_sdk_core"
  ```

#### Android

- [Checkout settings.gradle and build.gradle](./docs/AndroidConfig.md) 

- [Add JVerificationPackage, don't forget parameters!](./docs/JVerificationPackage.md)

## API

#### Usage：

```javascript
import JVerification from 'jverification-react-native'

JVerification.init({
              appKey: '替换成极光官网注册的应用 appKey',
              channel: 'the optional channel'
            });
```


> 注意: 需要先调用 JVerification.init 方法其他功能才能正常使用。



接口说明参考： [index.js](./index.js) 

用法参考： [demo](./example/App.js)

