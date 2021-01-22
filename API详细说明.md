
# JVerification React Native API

## 引用方式
```javascript
import React from 'react';
import JVerification from 'jverification-react-native';
```

## 设置 debug 模式

### API -setLoggerEnable(enable)
开启 debug 模式，请在初始化前调用
#### 接口定义
```javascript
static setLoggerEnable(enable) {
    if (Platform.OS == 'android') {
        JVerificationModule.setDebugMode(enable);
    } else {
        JVerificationModule.setDebug(enable);
    }
}
```

#### 参数说明
- true - 开启，false - 关闭

#### 示例
```javascript
JVerification.setLoggerEnable(true);
```

## 初始化

### API - init(params, callback)
初始化接口
#### 接口定义
```javascript
static init(params, callback) {
    if (Platform.OS == 'android') {
        JVerificationModule.init(params, callback);
    } else {
        JVerificationModule.setupWithConfig(params, callback);
    }
}
```

#### 参数说明
- params 字典
{'time':int,'appkey':String,'channel':String,'advertisingId':String,'isProduction':boolean}

|参数名称|参数类型|参数说明|
|:-----:|:----:|:-----:|
|time|int|设置初始化超时时间，单位毫秒，合法范围是(0,30000]，推荐设置为 5000-10000,默认值为 10000。|
|isProduction|boolean|是否生产环境。如果为开发状态，设置为 false；如果为生产状态，应改为 true。可选，默认为 false。（仅作用与 iOS）|
|channel |string|应用发布渠道,可选 （仅作用与 iOS）|
|advertisingId|string|广告标识符，可选。（仅作用与 iOS）|

- callback 回调 类型字典 {"code":int,'content':String}
|参数名称|参数类型|参数说明|
|:-----:|:----:|:-----:|
|code|int| 错误码|
|content|string| 详细信息说明|

#### 示例
```javascript
const initParams = {
    'time': 5000,
    'appKey': 'a0e6ace8d5b3e0247e3f58db', //仅iOS
    'channel': 'channel',                 //仅iOS
    'advertisingId': 'advertisingId',     //仅iOS
    'isProduction': false,                //仅iOS
};

JVerification.init(initParams, result => {
    console.log('init:' + JSON.stringify(result));
})

```

## 获取初始化状态

### API - isInitSuccess(callback)
初始化是否成功
#### 接口定义
```javascript
static isInitSuccess(callback) {
    if (Platform.OS == 'android') {
        JVerificationModule.isInitSuccess(callback);
    } else {
        JVerificationModule.isSetupClient(callback);
    }
}
```
#### 参数说明
callback = (result) => {"enable":boolean}

#### 示例
```javascript
JVerification.isInitSuccess(result =>
    console.log('isInitSuccess:' + JSON.stringify(result))
)
```

## 判断网络环境是否支持

### API - checkLoginEnable(callback)
判断当前网络环境是否可以发起认证
#### 接口定义
```javascript
static checkLoginEnable(callback) {
    if (Platform.OS == 'android') {
        JVerificationModule.checkVerifyEnable(callback);
    } else {
        JVerificationModule.checkVerifyEnable(callback);
    }
}
```
#### 参数说明
callback = (result) => {"enable":boolean}

#### 示例
```javascript
JVerification.checkLoginEnable(result =>
    console.log('checkLoginEnable:' + JSON.stringify(result))
)
```

## SDK获取号码认证token

### API - getToken(time, callback)
 获取手机号校验token
#### 接口定义
```javascript
static getToken(time, callback) {
    JVerificationModule.getToken(time, callback);
}
```

#### 参数说明
- time:设置初始化超时时间，单位毫秒，合法范围是(0,10000]，推荐设置为 5000-10000,默认值为 5000。

#### 示例
```javascript
JVerification.getToken(5000, result => {
    console.log('getToken:' + JSON.stringify(result));
})
```

## 登录预取号

### API - preLogin(time, callback)
验证当前运营商网络是否可以进行一键登录操作，该方法会缓存取号信息，提高一键登录效率。建议发起一键登录前先调用此方法。
#### 接口定义
```javascript
static preLogin(time, callback) {
    JVerificationModule.preLogin(time, callback);
}
```

#### 参数说明
- time:设置初始化超时时间，单位毫秒，合法范围是(0,30000]，推荐设置为 5000-10000,默认值为 10000。
- callback = (result) => {"code":int,'content':String}  code:返回码，7000代表获取成功，其他为失败，详见错误码描述； content:调用结果信息描述

#### 示例
```javascript
JVerification.preLogin(5000, result => {
    console.log('preLogin:' + JSON.stringify(result));
})
                        
```


## 清除预取号缓存

### API - clearPreLoginCache( )
清除预取号缓存。

#### 接口定义
```javascript
static clearPreLoginCache() {
    JVerificationModule.clearPreLoginCache();
}
```

#### 示例
```javascript
  JVerification.clearPreLoginCache()
```

## 请求授权一键登录
注意项说明
- 一键登录需要依赖预取号结果，如果没有预取号，一键登录时会自动预取号。
- 建议拉起授权页前，比如在开屏页或者业务入口页预先调用此接口进行预取号，可以提升授权页拉起速度，优化体验。
- 一键登录请求成功后，不要频繁重复调用。运营商会限制单位时间内请求次数。
- 不要在一键登录回调中重复调用预取号或者拉起授权页接口。

### API - login(enable)
调起一键登录授权页面，在用户授权后获取 loginToken，同时支持授权页事件监听。
#### 接口定义
```javascript
static login(enable) {
    if (Platform.OS == 'android') {
        JVerificationModule.loginAuth(enable);
    } else {
        JVerificationModule.getAuthorizationWithController(enable);
    }
}
```
#### 参数说明
- enable： boolean， 是否自动关闭授权页，true - 是，false - 否；若此字段设置为false，请在收到一键登录回调后调用SDK提供的关闭授权页面方法

#### 示例
```javascript
 JVerification.login(true);
```
##  一键登录事件监听
### API -  addLoginEventListener(callback)
#### 接口定义
 ```javascript
 //添加一键登录事件监听
 static addLoginEventListener(callback) {
     listeners[callback] = DeviceEventEmitter.addListener(
         LoginEvent, result => {
             callback(result);
         });
 }

 //移除事件
 static removeListener(callback) {
     if (!listeners[callback]) {
         return;
     }
     listeners[callback].remove();
     listeners[callback] = null;
 }
 ```
 #### 参数说明
  - 参数 callback = result => {'code':int,'content':String,'operator':String}

 #### 示例
 ```
 this.LoginListener = result => {
     console.log('LoginListener:' + JSON.stringify(result));
 };
 JVerification.addLoginEventListener(this.LoginListener);
 ```


## API - dismissLoginPage( )
隐藏登录页.当授权页被拉起以后，可调用此接口隐藏授权页。当一键登录自动隐藏授权页时，不建议调用此接口。
#### 接口定义
```javascript
static dismissLoginPage() {
    if (Platform.OS == 'android') {
        JVerificationModule.dismissLoginAuthActivity();
    }
    else {
        JVerificationModule.dismissLoginController();
    }
}
```
#### 示例
```javascript
  JVerification.dismissLoginPage()
```

## 获取短信验证码

### API - getVerifyCode(params,callback)
- 获取短信验证码，使用此功能需要在Portal控制台中极光短信模块添加短信签名和验证码短信模版，或者使用默认的签名或模版。详见：[操作指南](https://docs.jiguang.cn//jsms/guideline/JSMS_consoleguide/#_3)
- 通过此接口获得到短信验证码后，需要调用极光验证码验证API来进行验证，详见：[验证码验证 API](https://docs.jiguang.cn//jsms/server/rest_api_jsms/#api_3)

#### 接口定义
```javascript
 static getVerifyCode(params,callback) {
    JVerificationModule.getSmsCode(params,callback);
 }
```
#### 参数说明
- params =  {'phoneNumber':String,'signID':String,'templateID':String}

|参数名称|参数类型|参数说明|
|:-----:|:----:|:-----:|
|phoneNumber|string|电话号码|
|signID|string|短信签名ID，如果为nil，则为默认短信签名ID|
|templateID|string|短信模板ID，如果为nil，则为默认短信模板ID|

#### 示例
```javascript
const codeConfig = {
    phoneNumber :  "18925241111", //在此替换你的phoneNumber
    signID : "1",             //在此替换你的signID
    templateID : "1"         //在此替换你的templateID
};

JVerification.getVerifyCode(codeConfig, result => {
    console.log('获取验证码:' + JSON.stringify(result));
})}
```

## 设置前后两次获取验证码的时间间隔

### API - setCodeTime(time)
设置前后两次获取验证码的时间间隔。
#### 接口定义
```javascript
static setCodeTime(time) {
    JVerificationModule.setTimeWithConfig(time);
}
```

#### 参数说明
- time:默认30000ms，有效范围(0,300000)。

#### 示例
```javascript
JVerification.setCodeTime(10000);
```

## 自定义认证SDK授权页面UI样式布局
iOS 页面和 Android页面可以分开设置，详细API文档 参考[授权页面元素配置说明](认证SDK授权页面元素配置API说明.md)

### API - addLoginCustomConfig  统一设置授权页面元素配置，需在 login 接口之前调用。

#### 接口定义

```javascript
static addLoginCustomConfig(customConfigParams, customViewParams) {
    if (Platform.OS == 'android') {
        JVerificationModule.setCustomUIWithConfig(customConfigParams, customViewParams);
    } else {
        JVerificationModule.customUIWithConfig(customConfigParams, customViewParams);
    }
}
```
#### 参数说明
+ customConfigParams 授权页元素设置，详细使用参考[授权页面元素配置说明](认证SDK授权页面元素配置API说明.md)
+ customViewParams 自定义RN 视图元素，时候参考demo

#### 示例
```
//一键登录页面自定义配置，需要在调用login之前设置，全屏模式
const customConfigParams = {
    backgroundImage: '',                      //背景图

    statusBarHidden: false,                   //状态栏是否隐藏
    statusBarMode: 'light',                   //状态栏模式 light,dark

    navHidden: false,                         //导航栏是否隐藏
    navColor: -16777216,                      //导航栏颜色

    navTitle: 'RN-JVerification',             //导航栏标题
    navTitleSize: 16,                         //导航栏标题文字字体大小(单位:sp）
    navTitleColor: -1,                        //导航栏标题文字颜色

    navReturnHidden: false,                   //导航栏返回按钮是否隐藏
    navReturnImage: 'close',                  //导航栏左侧返回按钮图标
    //为保障显示效果，请同时设置x,y,w,h
    // navReturnX: 10,                        //导航栏左侧返回按钮图标距屏幕上端偏移（仅Android)
    // navReturnY: 10,                        //导航栏左侧返回按钮图标距屏幕左侧偏移（仅Android)
    // navReturnW: 30,                        //导航栏左侧返回按钮图标宽度（仅Android)
    // navReturnH: 30,                        //导航栏左侧返回按钮图标高度（仅Android)

    logoHidden: false,                        //logo是否隐藏
    logoImage: 'umcsdk_mobile_logo',          //logo(android默认为应用图标;ios默认无)
    //为保障显示效果，请同时设置x,y,w,h
    //logoX: 50,                              //logo相对于屏幕左边x轴偏移
    //logoY: 50,                              //logo相对于标题栏下边缘y偏移
    //logoW: 250,                             //logo宽
    //logoH: 25,                              //logo高

    numberSize: 16,                           //手机号码字体大小（单位:sp）
    numberColor: -16777216,                   //手机号码字体颜色
    //为保障显示效果，请同时设置x,y,w,h
    //numberX: 50,                            //号码栏相对于屏幕左边x轴偏移
    //numberY: 100,                           //号码栏相对于标题栏下边缘y偏移
    //numberW: 250,                           //号码栏宽度
    //numberH: 25,                            //号码栏高度

    sloganHidden: false,                      //slogan是否隐藏
    sloganTextSize: 16,                       //slogan字体大小
    sloganTextColor: -16777216,               //slogan文字颜色
    //为保障显示效果，请同时设置x,y,w,h
    //sloganX: 50,                            //slogan相对于屏幕左边x轴偏移
    //sloganY: 150,                           //slogan相对于标题栏下边缘y偏移
    //sloganW: 250,                           //slogan宽度 (仅iOS)
    //sloganH: 25,                            //slogan高度 (仅iOS)

    loginBtnText: '登录按钮',                  //登录按钮文字
    loginBtnTextSize: 16,                     //登录按钮字体大小
    loginBtnTextColor: -16777216,             //登录按钮文字颜色

    loginBtnImage: 'login_btn_selector',      //登录按钮selector选择样式 （仅android）
    loginBtnNormalImage: 'loginBtn_Nor',      //登录按钮正常图片 （仅ios,三个同时设置生效）
    loginBtnDisabledImage: 'loginBtn_Dis',    //登录按钮失效图片  (仅ios,三个同时设置生效）
    loginBtnSelectedImage: 'loginBtn_Hig',    //登录按钮按下图片  (仅ios,三个同时设置生效）
    //为保障显示效果，请同时设置x,y,w,h
    //loginBtnX: 50,                          //登录按钮相对于屏幕左边x轴偏移
    //loginBtnY: 200,                         //登录按钮相对于标题栏下边缘y偏移
    //loginBtnW: 250,                         //登录按钮宽度
    //loginBtnH: 25,                          //登录按钮高度

    privacyOne: ['隐私条款一', 'https://www.jiguang.cn/about'],  //隐私条款一（显示名称和url，请严格按照格式）
    privacyTwo: ['隐私条款二', 'https://www.jiguang.cn/about'],  //隐私条款二（显示名称和url，请严格按照格式）
    privacyColor: [-16777216, -65536],                          //隐私条款颜色 （显示名称和url的颜色，请严格按照格式）
    privacyText: ['登录即同意', '和', '、', '并使用本机号码登录'],  //隐私条款名称外的文字
    privacyTextSize: 15,                                        //隐私条款文字字体大小
    privacyTextGravityMode: 'left',                             //隐私条款文本对齐方式，目前仅支持 left、center
    privacyBookSymbolEnable: false,                             //隐私条款是否显示书名号，默认不显示
    //为保障显示效果，请同时设置x,y,w,h
    // privacyX:50,                                             //隐私条款相对于屏幕左边x轴偏移
    // privacyY:20,                                             //隐私条款相对于授权页面底部下边缘y偏移
    // privacyW:200,                                            //隐私条款宽度
    // privacyH:100,                                            //隐私条款高度

    privacyCheckboxHidden: false,                               //checkBox是否隐藏，默认不隐藏
    privacyCheckEnable: false,                                  //checkBox默认状态 默认:NO
    privacyCheckedImage: 'checkbox_selected',                   //checkBox选中时图片
    privacyUncheckedImage: 'checkbox_unSelected',               //checkBox未选中时图片
    privacyCheckboxSize:10,                                     //设置隐私条款checkbox尺寸 默认是10, 仅android

    privacyWebNavColor: -16777216,                              //协议页导航栏背景颜色
    privacyWebNavTitle: '服务条款',                              //协议页导航栏标题（仅iOS）
    privacyWebNavTitleSize: 16,                                 //协议页导航栏标题字体大小
    privacyWebNavTitleColor: -1,                                //协议页导航栏标题字体颜色
    privacyWebNavReturnImage: 'close',                          //协议页导航栏返回按钮图片
};
const customViewParams = [
    {customViewName: 'customView1', customViewPoint: [20, 200, 150, 30]},
    {customViewName: 'customView2', customViewPoint: [20, 300, 150, 30]},
    {customViewName: 'customView3', customViewPoint: [20, 400, 150, 30]},
];

JVerification.addLoginCustomConfig(customConfigParams, customViewParams)


//弹窗模式：
const iosDialogConfig = {
    navHidden:true,    //导航栏是否隐藏
    logoImage: 'umcsdk_mobile_logo',          //logo(android默认为应用图标;ios默认无)
    logoConstraints:[0,-100,60,60],           //LOGO图片布局对象
    logoHidden: false,                        //logo是否隐藏
    numberConstraints:[0,-42,200,14],         //号码栏布局对象
    sloganConstraints:[0,-20,200,14],         //slogan布局对象
    logBtnConstraints:[0,20,220,40],
    loginBtnText: '登录按钮',                  //登录按钮文字
    loginBtnTextSize: 16,                     //登录按钮字体大小
    loginBtnTextColor: -16777216,             //登录按钮文字颜色
    privacyConstraints:[0,100,200,40],        //隐私条款布局对象
    checkViewConstraints:[-108,100,10,10],    //checkBox布局对象
    loadingConstraints:[0,0,20,20],
    showWindow:true,  // 是否弹窗，默认no
    windowBackgroundImage:"bg", // 弹框内部背景图片
    windowBackgroundAlpha: 0.3,  //弹窗外侧 透明度 0~1.0
    windowCornerRadius:10, //弹窗圆角数值
    windowConstraints:[0,0,500,500], //弹窗布局对象
    windowCloseBtnImgs:["windowClose","windowClose"],//弹窗close按钮图片 @[普通状态图片，高亮状态图片]
    windowCloseBtnConstraints:[0,-135,20,20],//弹窗close按钮布局,
}

//安卓授权页弹窗模式
const androidDialogConfig = {
    privacyNeedClose:true,                       //弹窗是否需要关闭按钮 
    privacyCloseTheme:[10, 60, 0, 0],            //弹窗关闭按钮偏移量 privacyNeedClose为true时，必须设置它的偏移量
    privacyDialogTheme: [300, 400, 0, 0, false], //授权页弹窗模式
    privacyNeedStartAnim: true,                  //设置拉起授权页时是否需要显示默认动画 默认展示
    privacyNeedCloseAnim: true,                  //设置关闭授权页时是否需要显示默认动画 默认展示
    navColor:0xff000000,
    loginBtnText:" 极光认证测试 ",
    privacyCheckEnable:false,
    privacyColor:[0xff00f000,0xff000000],
    loginBtnWidth:40,
    privacyOne: ['隐私条款一', 'https://www.jiguang.cn/about'],  //隐私条款一（显示名称和url，请严格按照格式）
    privacyColor: [-16777216, -65536],                          //隐私条款颜色 （显示名称和url的颜色，请严格按照格式）
    privacyText: ['登录即同意', '和', '、', '并使用本机号码登录'],  //隐私条款名称外的文字
    privacyTextSize: 12,   
}

if(Platform.OS == 'android'){
    JVerification.addLoginCustomConfig(androidDialogConfig, undefined);
    } else {
    JVerification.addLoginCustomConfig(iosDialogConfig, []);
}


```

#### API - addCustomViewsClickCallback
添加自定义 view 回调。配合 setCustomUIWithConfigAndroid 的  addCustomViews 属性一起使用

##### 示例
```javascript
jv.addCustomViewsClickCallback(id=>{

})
```


## 错误码

|code|message|备注|
|:-----:|:----:|:-----:|
|1000|verify consistent|手机号验证一致|
|1001|verify not consistent|手机号验证不一致|
|1002|unknown result|未知结果|
|1003|token expired|token失效|
|1004|sdk verify has been closed|SDK 发起认证未开启|
|1005|包名和 AppKey 不匹配|请检查客户端配置的包名与官网对应 Appkey 应用下配置的包名是否一致|
|1006|frequency of verifying single number is beyond the maximum limit|同一号码自然日内认证消耗超过限制|
|1007|beyond daily frequency limit|appKey 自然日认证消耗超过限制|
|1008|AppKey 非法|请到官网检查此应用信息中的 appkey，确认无误|
|1009||请到官网检查此应用的应用详情；更新应用中集成的极光 SDK 至最新|
|1010|verify interval is less than the minimum limit|同一号码连续两次提交认证间隔过短|
|1011|appSign invalid|应用签名错误，检查签名与 Portal 设置的是否一致|
|2000|内容为token|获取 token 成功|
|2001|fetch token failed|获取 token 失败|
|2002|init failed|SDK 初始化失败|
|2003|network not reachable|网络连接不通|
|2004|get uid failed|极光服务注册失败|
|2005|request timeout|请求超时|
|2006|fetch config failed|获取应用配置失败|
|2007|内容为异常信息|验证遇到代码异常|
|2008|Token requesting, please try again later|正在获取 token 中，稍后再试|
|2009|verifying, please try again later|正在认证中，稍后再试 |
|2010|don't have READ_PHONE_STATE permission|未开启读取手机状态权限|
|2011|内容为异常信息|获取配置时代码异常|
|2012|内容为异常信息|获取 token 时代码异常|
|2013|内容为具体错误原因|网络发生异常|
|2014|internal error while requesting token|请求 token 时发生内部错误|
|2016|network type not supported|当前网络环境不支持认证|
|4001|parameter invalid|参数错误。请检查参数，比如是否手机号格式不对|
|4018||没有足够的余额|
|4031||不是认证 SDK 用户|
|4032||获取不到用户配置|
|4033|appkey is not support login|不是一键登录用户|
|5000|bad server|服务器未知错误|
|6000|内容为token|获取 loginToken 成功|
|6001|fetch loginToken failed|获取 loginToken 失败|
|6002|fetch loginToken canceled|用户取消获取 loginToken|
|6003|UI 资源加载异常|未正常添加 sdk 所需的资源文件|
|6004|authorization requesting, please try again later|正在登录中，稍后再试|
|7000|preLogin success|sdk 预取号成功|
|7001|preLogin failed|sdk 预取号失败|
|7002|preLogin requesting, please try again later|正在预取号中，稍后再试|
|-994|网络连接超时|   |
|-996|网络连接断开|   |
|-997|注册失败/登录失败|（一般是由于没有网络造成的）如果确保设备网络正常，还是一直遇到此问题，则还有另外一个原因：JPush 服务器端拒绝注册。而这个的原因一般是：你当前 App 的 Android 包名以及 AppKey，与你在 Portal 上注册的应用的 Android 包名与 AppKey 不相同。|
