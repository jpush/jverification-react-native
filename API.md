# JVerification React Native SDK

极光认证 React Native SDK，提供一键登录和短信验证码登录功能。

## 常量

- `LoginEvent`: 登录事件
- `SmsLoginEvent`: 短信登录事件
- `UnCheckBox`: iOS 未选中隐私协议 CheckBox 点击登录按钮的回调事件
- `ClickWidgetEvent`: 自定义控件点击事件

## 方法

### setLoggerEnable

设置调试模式，默认关闭状态。该接口需在 init 接口之前调用，避免出现部分日志没打印的情况。

```typescript
static setLoggerEnable(enable: boolean): void
```

### init

SDK 初始化。

```typescript
static init(params: {
    time: number,           // 初始化超时时间,单位毫秒，合法范围是(0,30000]，推荐设置为5000-10000,默认值为10000
    appkey: string,         // 极光系统应用唯一标识，必填 (仅ios)
    channel?: string,       // 应用发布渠道，可选 (仅ios)
    advertisingId?: string, // 广告标识符，可选 (仅ios)
    isProduction?: boolean  // 是否生产环境。如果为开发状态，设置为false；如果为生产状态，应改为true。默认为false,可选 (仅ios)
}, callback: (result: {code: number, content: string}) => void): void
```

### isInitSuccess

获取 SDK 初始化是否成功标识。

```typescript
static isInitSuccess(callback: (result: {enable: boolean}) => void): void
```

### checkLoginEnable

SDK 判断网络环境是否支持-是否开启严格模式。

```typescript
static checkLoginEnable(strictMode: boolean, callback: (result: {enable: boolean}) => void): void
```

### getToken

SDK 获取号码认证 token。

```typescript
static getToken(time: number, callback: (result: {
    code: number,      // 返回码，2000代表获取成功，其他为失败，详见错误码描述
    content: string,   // 成功时为token，可用于调用验证手机号接口。token有效期为1分钟，超过时效需要重新获取才能使用。失败时为失败信息
    operator: string   // 成功时为对应运营商，CM代表中国移动，CU代表中国联通，CT代表中国电信。失败时可能为null
}) => void): void
```

参数说明：
- `time`: 超时时间（毫秒）,有效取值范围(0,10000],若小于等于0则取默认值5000.大于10000则取10000.为保证获取token的成功率，建议设置为3000-5000ms.

### preLogin

SDK 获取预取号 token。

```typescript
static preLogin(time: number, callback: (result: {
    code: number,      // 返回码，7000代表获取成功，其他为失败，详见错误码描述
    content: string    // 调用结果信息描述
}) => void): void
```

参数说明：
- `time`: 超时时间（毫秒）,有效取值范围(0,10000],若小于等于0则取默认值5000.大于10000则取10000, 为保证预取号的成功率，建议设置为3000-5000ms

### clearPreLoginCache

SDK 清除预取号缓存。

```typescript
static clearPreLoginCache(): void
```

### login

SDK 请求授权一键登录。

```typescript
static login(enable: boolean, time: number, callback: (result: {
    code: number,      // 返回码，6000代表获取成功，其他为失败，详见错误码描述
    content: string    // 成功时为logintoken,用于置换手机号
}) => void): void
```

参数说明：
- `enable`: 是否自动关闭授权页，true - 是，false - 否；若此字段设置为false，请在收到一键登录回调后调用SDK提供的关闭授权页面方法
- `time`: 超时时间（毫秒）,有效取值范围(0,10000],若小于等于0则取默认值5000.大于10000则取10000.为保证获取token的成功率，建议设置为3000-5000ms.

### dismissLoginPage

SDK 关闭授权页面。

```typescript
static dismissLoginPage(): void
```

### smsLogin

拉起短信登录页。

```typescript
static smsLogin(enable: boolean, time: number, callback: (result: {
    code: number,          // 返回码，4000代表获取成功，其他为失败，详见错误码描述
    content: string,       // 说明信息
    phoneNumber: string    // 成功时为手机号
}) => void): void
```

参数说明：
- `enable`: 是否自动关闭授权页，true - 是，false - 否；若此字段设置为false，请在收到一键登录回调后调用SDK提供的关闭授权页面方法
- `time`: 超时时间（毫秒）, 有效取值范围(5000,30000], 若小于等于 5000 或大于 30000 则取默认值 10000. 推荐设置为 5001-10000.

### addLoginCustomConfig

设置一键登录页面样式。所有配置项均为可选，需要在 login 前调用生效。

> ⚠️ **注意**：`customViewParams` 参数已废弃，由于 React Native 版本兼容性问题，不再支持通过该参数添加自定义 React Native 组件。如需添加自定义控件，请使用 `customWidgetList` 参数。

```typescript
static addLoginCustomConfig(customConfigParams: {
    // 基础配置
    backgroundImage?: string,                   // 背景图
    backgroundGifImage?: string,                // 背景gif
    backgroundVideo?: string,                   // 背景视频
    backgroundVideoPlaceHolderImage?: string,   // 背景视频默认图
    appLanguageType?: string,                   // 语言 0.中文简体（默认） 1.中文繁体 2.英文    

    // 状态栏配置
    statusBarTransparent?: boolean,             // 状态栏是否透明
    statusBarHidden?: boolean,                  // 状态栏是否隐藏
    statusBarMode?: string,                     // 状态栏模式 light,dark

    // 导航栏配置
    navHidden?: boolean,                        // 导航栏是否隐藏
    navColor?: number,                          // 导航栏颜色
    navTitle?: string,                          // 导航栏标题
    navTitleSize?: number,                      // 导航栏标题文字字体大小(单位:sp）
    navTitleColor?: number,                     // 导航栏标题文字颜色
    navReturnHidden?: boolean,                  // 导航栏返回按钮是否隐藏
    navTransparent?: boolean,                   // 导航栏是否透明
    navReturnImage?: string,                    // 导航栏左侧返回按钮图标
    navReturnX?: number,                        // 导航栏返回按钮距屏幕左侧偏移 
    navReturnY?: number,                        // 导航栏返回按钮距屏幕右侧偏移 
    navReturnW?: number,                        // 导航栏返回按钮宽度 （仅Android)
    navReturnH?: number,                        // 导航栏返回按钮高度 （仅Android)

    // Logo配置
    logoHidden?: boolean,                       // logo是否隐藏
    logoImage?: string,                         // logo(android默认为应用图标;ios默认无)
    logoX?: number,                             // logo相对于屏幕左边x轴偏移
    logoY?: number,                             // logo相对于标题栏下边缘y偏移
    logoW?: number,                             // logo宽
    logoH?: number,                             // logo高

    // 号码栏配置
    numberSize?: number,                        // 手机号码字体大小（单位:sp）
    numberColor?: number,                       // 手机号码字体颜色
    numberX?: number,                           // 号码栏相对于屏幕左边x轴偏移
    numberY?: number,                           // 号码栏相对于标题栏下边缘y偏移
    numberW?: number,                           // 号码栏宽度
    numberH?: number,                           // 号码栏高度

    // Slogan配置
    sloganHidden?: boolean,                     // slogan是否隐藏
    sloganTextSize?: number,                    // slogan字体大小
    sloganTextColor?: number,                   // slogan文字颜色
    sloganX?: number,                           // slogan相对于屏幕左边x轴偏移
    sloganY?: number,                           // slogan相对于标题栏下边缘y偏移
    sloganW?: number,                           // slogan宽度 (仅iOS)
    sloganH?: number,                           // slogan高度 (仅iOS)

    // 登录按钮配置
    loginBtnText?: string,                      // 登录按钮文字
    loginBtnTextSize?: number,                  // 登录按钮字体大小
    loginBtnTextColor?: number,                 // 登录按钮文字颜色
    loginBtnImage?: string,                     // 登录按钮selector选择样式 （仅android）
    loginBtnNormalImage?: string,               // 登录按钮正常图片 （仅ios,三个同时设置生效）
    loginBtnDisabledImage?: string,             // 登录按钮失效图片 (仅ios,三个同时设置生效）
    loginBtnSelectedImage?: string,             // 登录按钮按下图片 (仅ios,三个同时设置生效）
    loginBtnX?: number,                         // 登录按钮相对于屏幕左边x轴偏移
    loginBtnY?: number,                         // 登录按钮相对于标题栏下边缘y偏移
    loginBtnW?: number,                         // 登录按钮宽度
    loginBtnH?: number,                         // 登录按钮高度

    // 隐私条款配置
    privacyOne?: string[],                      // [隐私条款一名称,隐私条款一链接]
    privacyTwo?: string[],                      // [隐私条款二名称,隐私条款二链接]
    privacyNameAndUrlBeanList?: Array<{         // 隐私条款配置数组
        name: string,                           // 条款名称
        url: string,                            // 条款链接
        separator: string                       // 分隔符
    }>,
    privacyColor?: number[],                    // [隐私条款名称颜色,隐私条款链接颜色]
    privacyText?: string[],                     // [隐私条款名称外的文字,隐私条款名称外的文字,隐私条款名称外的文字,隐私条款名称外的文字]
    privacyTextSize?: number,                   // 隐私条款文字字体大小
    privacyTextGravityMode?: string,            // 隐私条款文本对齐方式，目前仅支持 left、center
    privacyBookSymbolEnable?: boolean,          // 隐私条款运营商协议名是否加书名号
    privacyX?: number,                          // 隐私条款相对于屏幕左边x轴偏移
    privacyY?: number,                          // 隐私条款相对于页面下边缘y偏移
    privacyW?: number,                          // 隐私条款宽度
    privacyH?: number,                          // 隐私条款高度
    textVerAlignment?: string,                  // 设置条款文字是否垂直居中对齐(默认居中对齐) 0是top 1是m 2是b only iOS
    openPrivacyInBrowser?: boolean,             // 是否在浏览器中打开隐私条款 默认是false  

    // 隐私条款复选框配置
    privacyCheckboxHidden?: boolean,            // 隐私条款checkbox是否隐藏
    privacyCheckEnable?: boolean,               // 隐私条款默认选中状态。默认不选中
    privacyCheckedImage?: string,               // 隐私条款复选框选中图片
    privacyUncheckedImage?: string,             // 隐私条款复选框未选中图片
    privacyCheckboxSize?: number,               // 设置隐私条款checkbox尺寸 默认是10
    isAlertPrivacyVC?: boolean,                 // 是否在未勾选隐私协议的情况下 弹窗提示窗口 iOS
    enablePrivacyCheckDialog?: boolean,         // 是否在未勾选隐私协议的情况下 弹窗提示窗口 Android

    // 隐私条款Web页面配置
    privacyWebNavColor?: number,                // 协议展示web页面导航栏背景颜色
    privacyWebNavTitle?: string,                // 协议页导航栏标题（仅iOS）
    privacyWebNavTitleSize?: number,            // 协议展示web页面导航栏标题文字大小
    privacyWebNavTitleColor?: number,           // 协议展示web页面导航栏标题文字颜色
    privacyWebNavReturnImage?: string,          // 协议展示web页面导航栏返回按钮图标

    // iOS 二次弹窗配置
    agreementAlertViewCornerRadius?: number,    // 协议二次弹窗的圆角
    agreementAlertViewBackgroundColor?: number, // 协议二次弹窗背景颜色
    agreementAlertViewBackgroundImgPath?: string, // 协议二次弹窗背景图片
    agreementAlertViewTitleText?: string,       // 协议二次弹窗标题文本
    agreementAlertViewTitleTexSize?: number,    // 协议二次弹窗标题文本样式
    agreementAlertViewTitleTextColor?: number,  // 协议二次弹窗标题文本颜色
    agreementAlertViewContentTextAlignment?: string, // 协议二次弹窗内容文本对齐方式
    agreementAlertViewContentTextFontSize?: number, // 协议二次弹窗内容文本字体大小
    agreementAlertViewLogBtnText?: string,      // 协议二次弹窗登录按钮文本
    agreementAlertViewLogBtnTextFontSize?: number, // 协议二次弹窗登录按钮文本字体大小
    agreementAlertViewLoginBtnNormalImagePath?: string, // 协议二次弹窗登录按钮背景图片 - 激活状态的图片
    agreementAlertViewLoginBtnPressedImagePath?: string, // 协议二次弹窗登录按钮背景图片 - 高亮状态的图片
    agreementAlertViewLoginBtnUnableImagePath?: string, // 协议二次弹窗登录按钮背景图片 - 失效状态的图片
    agreementAlertViewLogBtnTextColor?: number, // 协议二次弹窗登录按钮文本颜色
    agreementAlertViewUIFrames?: {              // 协议二次弹窗各控件的frame设置
        superViewFrame: [number, number, number, number],
        alertViewFrame: [number, number, number, number],
        titleFrame: [number, number, number, number],
        contentFrame: [number, number, number, number],
        buttonFrame: [number, number, number, number]
    },

    // Android 二次弹窗配置
    privacyCheckDialogGravityModeCenter?: boolean, // 协议的二次弹窗对齐方式 目前仅支持 bottom、center  
    setPrivacyCheckDialogOffsetX?: number,      // 隐私二次弹窗相对于屏幕左边x轴偏移 
    setPrivacyCheckDialogOffsetY?: number,      // 隐私二次弹窗相对于屏幕左边x轴偏移 
    setPrivacyCheckDialogWidth?: number,        // 隐私二次弹窗 宽
    setPrivacyCheckDialogHeight?: number,       // 隐私二次弹窗 高
    setPrivacyCheckDialogTitleText?: string,    // 协议二次弹窗标题
    setPrivacyCheckDialogTitleTextSize?: number, // 协议二次弹窗标题字号
    setPrivacyCheckDialogTitleTextColor?: number, // 协议二次弹窗标题文字颜色
    setPrivacyCheckDialogContentTextGravity?: string, // 协议的二次弹窗对齐方式 目前仅支持 left、center
    setPrivacyCheckDialogContentTextSize?: number, // 协议的二次弹窗文字大小
    setPrivacyCheckDialogLogBtnMarginL?: number, // 隐私二次弹窗相对于屏幕左边x轴偏移       
    setPrivacyCheckDialogLogBtnMarginT?: number, // 协议二次弹窗相对于屏幕左边y轴偏移
    setPrivacyCheckDialogLogBtnMarginB?: number, // 协议二次弹窗相对于屏幕左边b轴偏移
    setPrivacyCheckDialogLogBtnMarginR?: number, // 协议二次弹窗相对于屏幕右边x轴偏移
    setPrivacyCheckDialogLogBtnImgPath?: string, // 协议的二次弹窗按钮背景图片
    setPrivacyCheckDialoglogBtnTextColor?: number, // 协议二次弹窗按钮字体颜色
    setPrivacyCheckDialogLogBtnWidth?: number,  // 隐私二次弹窗 登录按钮宽
    setPrivacyCheckDialogLogBtnHeight?: number, // 隐私二次弹窗 登录按钮高
    setPrivacyCheckDialogLogBtnText?: string,   // 协议的二次弹窗按钮标题字体
    setPrivacyCheckDialogContentTextPaddingL?: number, // 隐私协议弹窗内容文字左边距
    setPrivacyCheckDialogContentTextPaddingT?: number, // 隐私协议弹窗内容文字上边距
    setPrivacyCheckDialogContentTextPaddingR?: number, // 隐私协议弹窗内容文字右边距
    setPrivacyCheckDialogContentTextPaddingB?: number, // 隐私协议弹窗内容文字下边距

    // 短信登录UI配置
    smsUIConfig?: {
        smsAuthPageBackgroundImagePath?: string,    // 登录界面背景图片
        smsNavText?: string,                        // 导航栏标题文字
        smsNavTextColor?: number,                   // 导航栏标题颜色 only iOS
        smsNavTextBold?: boolean,                   // 导航栏标题是否加粗 only iOS
        smsNavTextSize?: number,                    // 导航栏标题大小 only iOS
        smsSloganTextSize?: number,                 // 设置slogan字体大小
        isSmsSloganHidden?: boolean,                // 设置slogan字体是否隐藏 only android
        isSmsSloganTextBold?: boolean,              // 设置slogan字体是否加粗 only android
        smsSloganOffsetX?: number,                  // 设置slogan相对于屏幕左边x轴偏移
        smsSloganOffsetY?: number,                  // 设置slogan相对于标题栏下边缘y偏移
        smsSloganOffsetBottomY?: number,            // 设置slogan相对于屏幕底部下边缘y轴偏移
        smsSloganWidth?: number,                    // 设置slogan宽度 only iOS
        smsSloganHeight?: number,                   // 设置slogan高度 only iOS
        smsSloganTextColor?: number,                // 设置移动slogan文字颜色
        smsLogoWidth?: number,                      // 设置logo宽度（单位：dp）
        smsLogoHeight?: number,                     // 设置logo高度（单位：dp）
        smsLogoOffsetX?: number,                    // 设置logo相对于屏幕左边x轴偏移
        smsLogoOffsetY?: number,                    // 设置logo相对于标题栏下边缘y偏移
        smsLogoOffsetBottomY?: number,              // 设置logo相对于屏幕底部y轴偏移
        isSmsLogoHidden?: boolean,                  // 隐藏logo
        smsLogoResName?: string,                    // 设置logo图片
        smsPhoneTextViewOffsetX?: number,           // 设置号码标题相对于屏幕左边x轴偏移 only android
        smsPhoneTextViewOffsetY?: number,           // 设置号码标题相对于标题栏下边缘y偏移 only android
        smsPhoneTextViewTextSize?: number,          // 设置号码标题字体大小 only android
        smsPhoneTextViewTextColor?: number,         // 设置号码标题文字颜色 only android
        smsPhoneInputViewOffsetX?: number,          // 设置号码输入框相对于屏幕左边x轴偏移
        smsPhoneInputViewOffsetY?: number,          // 设置号码输入框相对于屏幕底部y轴偏移
        smsPhoneInputViewWidth?: number,            // 设置号码输入框宽度
        smsPhoneInputViewHeight?: number,           // 设置号码输入框高度
        smsPhoneInputViewTextColor?: number,        // 设置手机号码输入框字体颜色
        smsPhoneInputViewTextSize?: number,         // 设置手机号码输入框字体大小
        smsPhoneInputViewPlaceholderText?: string,  // 设置手机号码输入框提示词 only iOS
        smsVerifyCodeTextViewOffsetX?: number,      // 设置验证码标题相对于屏幕左边x轴偏移 only android
        smsVerifyCodeTextViewOffsetY?: number,      // 设置验证码标题相对于标题栏下边缘y偏移 only android
        smsVerifyCodeTextViewTextSize?: number,     // 设置验证码标题字体大小 only android
        smsVerifyCodeTextViewTextColor?: number,    // 设置验证码标题文字颜色 only android
        smsVerifyCodeEditTextViewTextSize?: number, // 设置验证码输入框字体大小
        smsVerifyCodeEditTextViewTextColor?: number, // 设置验证码输入框字体颜色
        smsVerifyCodeEditTextViewPlaceholderText?: string, // 设置验证码输入框提示词 only iOS
        smsVerifyCodeEditTextViewOffsetX?: number,  // 设置验证码输入框相对于屏幕左边x轴偏移
        smsVerifyCodeEditTextViewOffsetY?: number,  // 设置验证码输入框相对于标题栏下边缘y偏移
        smsVerifyCodeEditTextViewOffsetR?: number,  // 设置验证码输入框相对于屏幕右边偏移
        smsVerifyCodeEditTextViewWidth?: number,    // 设置验证码输入框宽度
        smsVerifyCodeEditTextViewHeight?: number,   // 设置验证码输入框高度
        smsGetVerifyCodeTextViewOffsetX?: number,   // 设置获取验证码按钮相对于屏幕左边x轴偏移
        smsGetVerifyCodeTextViewOffsetY?: number,   // 设置获取验证码按钮相对于标题栏下边缘y偏移
        smsGetVerifyCodeTextViewTextSize?: number,  // 设置获取验证码按钮字体大小
        smsGetVerifyCodeTextViewTextColor?: number, // 设置获取验证码按钮文字颜色
        smsGetVerifyCodeTextViewOffsetR?: number,   // 设置获取验证码按钮相对于屏幕右边偏移
        smsGetVerifyCodeBtnWidth?: number,          // 设置获取验证码按钮宽度 only iOS
        smsGetVerifyCodeBtnHeight?: number,         // 设置获取验证码按钮高度 only iOS
        smsGetVerifyCodeBtnCornerRadius?: number,   // 设置获取验证码按钮圆角度数 only iOS
        smsGetVerifyCodeBtnBackgroundPath?: string, // 设置获取验证码按钮图片
        smsGetVerifyCodeBtnBackgroundPaths?: string[], // 设置获取验证码按钮图片[激活状态,失效状态,高亮状态] only iOS
        smsGetVerifyCodeBtnText?: string,           // 设置获取验证码按钮文字 only iOS
        smsLogBtnOffsetX?: number,                  // 设置登录按钮相对于屏幕左边x轴偏移
        smsLogBtnOffsetY?: number,                  // 设置登录按钮相对于标题栏下边缘y偏移
        smsLogBtnWidth?: number,                    // 设置登录按钮宽度
        smsLogBtnHeight?: number,                   // 设置登录按钮高度
        smsLogBtnTextSize?: number,                 // 设置登录按钮字体大小
        smsLogBtnBottomOffsetY?: number,            // 设置登录按钮相对屏幕底部y轴偏移
        smsLogBtnText?: string,                     // 设置登录按钮文字
        smsLogBtnTextColor?: number,                // 设置登录按钮文字颜色
        isSmsLogBtnTextBold?: boolean,              // 设置登录按钮字体是否加粗
        smsLogBtnBackgroundPath?: string,           // 设置授权登录按钮图片
        smsLogBtnBackgroundPaths?: string,          // 设置授权登录按钮图片[激活状态,失效状态,高亮状态] only iOS
        smsFirstSeperLineOffsetX?: number,          // 第一分割线相对于屏幕左边x轴偏移 only android
        smsFirstSeperLineOffsetY?: number,          // 第一分割线相对于标题栏下边缘y偏移 only android
        smsFirstSeperLineOffsetR?: number,          // 第一分割线相对于屏幕右边偏移 only android
        smsFirstSeperLineColor?: number,            // 第一分割线颜色 only android
        smsSecondSeperLineOffsetX?: number,         // 第二分割线相对于屏幕左边x轴偏移 only android
        smsSecondSeperLineOffsetY?: number,         // 第二分割线相对于标题栏下边缘y偏移 only android
        smsSecondSeperLineOffsetR?: number,         // 第二分割线相对于屏幕右边偏移 only android
        smsSecondSeperLineColor?: number,           // 第二分割线颜色 only android
        isSmsPrivacyTextGravityCenter?: boolean,    // 设置隐私条款文字是否居中对齐（默认左对齐）
        smsPrivacyColor?: number[],                 // 设置隐私条款名称颜色[基础文字颜色,协议文字颜色] only iOS
        smsPrivacyTextVerAlignment?: number,        // 设置隐私条款垂直对齐方式 0:top 1:middle 2:bottom only iOS
        smsPrivacyOffsetX?: number,                 // 协议相对于屏幕左边x轴偏移
        smsPrivacyOffsetY?: number,                 // 协议相对于底部y偏移
        smsPrivacyTopOffsetY?: number,              // 协议相对于标题栏下边缘y偏移
        smsPrivacyWidth?: number,                   // 协议宽度 only iOS
        smsPrivacyHeight?: number,                  // 协议高度 only iOS
        smsPrivacyMarginL?: number,                 // 设置协议相对于登录页左边的间距 only android
        smsPrivacyMarginR?: number,                 // 设置协议相对于登录页右边的间距 only android
        smsPrivacyMarginT?: number,                 // 设置协议相对于登录页顶部的间距 only android
        smsPrivacyMarginB?: number,                 // 设置协议相对于登录页底部的间距 only android
        smsPrivacyCheckboxSize?: number,            // 设置隐私条款checkbox尺寸
        smsPrivacyCheckboxOffsetX?: number,         // 设置隐私条款checkbox相对于屏幕左边x轴偏移
        smsPrivacyCheckboxOffsetY?: number,         // 设置隐私条款checkbox相对于屏幕y轴偏移
        isSmsPrivacyCheckboxInCenter?: boolean,     // 设置隐私条款checkbox是否相对协议文字纵向居中
        smsPrivacyCheckboxState?: boolean,          // 设置隐私条款checkbox默认状态:是否选择 默认:NO
        smsPrivacyCheckboxMargin?: number[],        // 设置协议相对于登录页的间距 only android
        smsPrivacyCheckboxUncheckedImgPath?: string, // 设置隐私条款checkbox未选中时图片 only iOS
        smsPrivacyCheckboxCheckedImgPath?: string,  // 设置隐私条款checkbox选中时图片 only iOS
        smsPrivacyBeanList?: Array<{                // 隐私条款配置数组
            name: string,                           // 条款名称
            url: string,                            // 条款链接
            separator: string                       // 分隔符
        }>,
        smsPrivacyClauseStart?: string,             // 设置协议条款开头文本
        smsPrivacyClauseEnd?: string,               // 设置协议条款结尾文本
        enableSMSService?: boolean,                 // 如果开启了短信服务,在认证服务失败时,短信服务又可用的情况下拉起短信服务
        smsPrivacyUncheckedMsg?: string,            // 短信协议没有被勾选的提示 (仅Android)
        smsGetCodeFailMsg?: string,                 // 短信获取失败提示 (仅Android)
        smsPhoneInvalidMsg?: string                 // 手机号无效提示 (仅Android)
    },

    // 自定义控件配置
    customWidgetList?: Array<JVCustomWidget>        // 自定义控件数组，数组元素为JVCustomWidget对象
}, customViewParams?: {
    /** @deprecated 已废弃 - 由于 React Native 版本兼容性问题，此参数已不再支持，请使用 customWidgetList 替代 */
    customViewName: string,                         // 在index.js中注册的component
    customViewPoint: number[]                       // [int,int,int,int] 基于屏幕左上角的x,y,w,h
}): void
```

注意事项：
1. 关于图片资源：
   - Android：请将图片放到 res/drawable 目录下
   - iOS：请将图片放到 JVerificationResour.bundle
2. 关于颜色：为 colorInt，可在 Android 代码中直观的看到数值，例如 Color.BLACK = -16777216, Color.WHITE = -1
3. 关于 x,y,w,h：为保障显示效果，请同时设置
4. **关于 customViewParams 参数**：
   - ⚠️ **已废弃**：由于 React Native 版本兼容性问题，`customViewParams` 参数已不再支持
   - 如需添加自定义控件，请使用 `customWidgetList` 参数，通过 `JVCustomWidget` 类创建 textView 或 button 控件
   - 详见 [JVCustomWidget](#jvcustomwidget) 使用说明

### addLoginEventListener

登录事件监听。

```typescript
static addLoginEventListener(callback: (result: {
    code: number,
    content: string,
    operator: string
}) => void): void
```

### addUncheckBoxEventListener

iOS 未选中隐私协议 CheckBox 点击登录按钮的回调事件监听。

```typescript
static addUncheckBoxEventListener(callback: (result: any) => void): void
```

### addClikWidgetEventListener

自定义控件的点击事件监听。

```typescript
static addClikWidgetEventListener(callback: (result: {
    eventId: string    // 事件ID，对应自定义控件的widgetId
}) => void): void
```

参数说明：
- `callback`: 点击事件回调函数，回调参数中的 `eventId` 对应自定义控件的 `widgetId`

### JVCustomWidget

自定义控件类，用于在授权页面添加自定义的 TextView 或 Button 控件。

```typescript
class JVCustomWidget {
    widgetId: string;                    // 控件ID，用于标识控件，必须唯一
    type: 'textView' | 'button';         // 控件类型，目前支持 textView 和 button
    
    // 位置和尺寸属性
    left: number;                         // 屏幕左边缘开始计算的x轴偏移（单位：dp/px）
    top: number;                          // 导航栏底部开始计算的y轴偏移（单位：dp/px）
    width: number;                        // 控件宽度（单位：dp/px）
    height: number;                       // 控件高度（单位：dp/px）
    
    // 文本属性
    title: string;                        // 控件显示的文本内容
    titleFont: number;                    // 文本字体大小（单位：sp）
    titleColor: number;                   // 文本颜色（colorInt格式，如 -16777216 表示黑色）
    backgroundColor?: number;             // 背景颜色（colorInt格式）
    textAlignment?: 'left' | 'right' | 'center';  // 文本对齐方式
    
    // TextView 专用属性
    lines?: number;                       // textView 行数，默认：1
    isSingleLine?: boolean;               // textView 是否单行显示，默认：true（iOS 端无效）
    /* 若 isSingleLine = false 时，iOS 端 lines 设置失效，会自适应内容高度，最大高度为设置的 height */
    
    // Button 专用属性
    btnNormalImageName?: string;          // 按钮正常状态图片名称
    btnPressedImageName?: string;         // 按钮按下状态图片名称
    
    // 通用属性
    isShowUnderline?: boolean;            // 是否显示下划线，默认：false
    isClickEnable: boolean;               // 是否可点击，默认：button 为 true，textView 为 false
    
    // Android 专用属性
    belowTheDialogContent?: boolean;     // 是否在对话框内容下方（隐私协议二次弹窗专用）
    
    // 方法
    toJsonMap(): object;                  // 转换为JSON对象，自动过滤null值
}
```

使用示例：

```typescript
import JVerification from 'jverification-react-native';

// 创建 textView 控件
const textWidget = new JVerification.JVCustomWidget('text_widget_id', 'textView');
textWidget.title = "自定义文本";
textWidget.left = 20;
textWidget.top = 360;
textWidget.width = 200;
textWidget.height = 40;
textWidget.backgroundColor = 0xFFFF00;  // 黄色背景
textWidget.isShowUnderline = true;
textWidget.textAlignment = 'center';
textWidget.isClickEnable = true;

// 创建 button 控件
const buttonWidget = new JVerification.JVCustomWidget('button_widget_id', 'button');
buttonWidget.title = "自定义按钮";
buttonWidget.left = 100;
buttonWidget.top = 400;
buttonWidget.width = 150;
buttonWidget.height = 40;
buttonWidget.backgroundColor = 0xA52A2A;  // 棕色背景

// 添加点击事件监听
JVerification.addClikWidgetEventListener((result) => {
    if (result.eventId === 'text_widget_id') {
        console.log('点击了文本控件:', result.eventId);
    } else if (result.eventId === 'button_widget_id') {
        console.log('点击了按钮控件:', result.eventId);
    }
});

// 将控件添加到配置中
const customConfig = {
    // ... 其他配置
    customWidgetList: [
        textWidget.toJsonMap(),
        buttonWidget.toJsonMap()
    ]
};

JVerification.addLoginCustomConfig(customConfig);
```

### removeListener

移除事件监听。

```typescript
static removeListener(callback: Function): void
```

### getVerifyCode

SDK 获取验证码。

```typescript
static getVerifyCode(params: {
    phonenum: string,  // 手机号
    signid: string,    // 签名ID
    tempid: string     // 模板ID
}, callback: (result: {
    code: number,      // 返回码
    msg: string        // 返回信息
}) => void): void
```

### setCodeTime

设置前后两次获取验证码的时间间隔。

```typescript
static setCodeTime(time: number): void
```

参数说明：
- `time`: 时间间隔（毫秒）




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
