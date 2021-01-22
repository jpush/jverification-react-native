### 认证SDK授权页面元素配置API说明

***x 轴未设置偏移则所有组件默认横向居中，所有图片资源android平台在android drowable目录下; iOS在JVerificationResource.bundle文件中,参数为图片的值都为 iOS 图片资源名字***

+ Android设置授权页背景
+ 图片会默认拉伸铺满整个屏幕，适配不同尺寸手机，建议使用 .9.png 图片来解决适配问题。

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|backgroundImage|String|设置背景图片|

+ iOS设置授权页背景
|参数名称|参数类型|参数说明|
|:-----:|:----:|:-----:|
|backgroundImage|String|授权界面背景图片|

+ Android授权页状态栏

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|statusBarHidden|boolean|设置状态栏是否隐藏。|
|statusBarMode|string|设置状态栏暗色模式。仅在 android 6.0 以上设备生效。值 "light"（正常模式），"dark"（暗色模式）|

+ iOS 授权页状态栏

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|statusBarHidden|boolean|设置状态栏是否隐藏。|
|statusBarMode|string|设置状态栏暗色模式。值 "light"（正常模式），"dark"（暗色模式）|


+ Android授权页导航栏

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|navHidden|boolean|设置导航栏是否隐藏|
|navColor|int|设置导航栏颜色|
|navTitle|String|设置导航栏标题文字|
|navTitleColor|int|设置导航栏标题文字颜色|
|navTitleSize|int|设置导航栏标题文字字体大小（单位：sp）|
|navReturnHidden|boolean|设置导航栏返回按钮是否隐藏。默认不隐藏|
|navReturnImage|String|设置导航栏返回按钮图标|
|navReturnW|int|设置导航栏返回按钮宽度。|
|navReturnH|int|设置导航栏返回按钮高度。|
|navReturnX|int|设置导航栏返回按钮距屏幕左侧偏移。|
|navReturnY|int|设置导航栏返回按钮距上端偏移。|

+ iOS 授权页导航栏

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|navHidden|boolean|设置导航栏是否隐藏|
|navColor|int|设置导航栏颜色|
|navTitle|String|设置导航栏标题文字|
|navTitleColor|int|设置导航栏标题文字颜色|
|navTitleSize|int|设置导航栏标题文字字体大小（单位：sp）|
|navReturnHidden|boolean|设置导航栏返回按钮是否隐藏。默认不隐藏。|
|navReturnImage|String|设置导航栏返回按钮图标|


+ Android授权页logo

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|logoHidden|boolean|隐藏logo|
|logoImage|String|设置logo图片|
|logoW|int|设置logo宽度（单位：dp）|
|logoH|int|设置logo高度（单位：dp）|
|logoX|int|设置logo相对于屏幕左边x轴偏移。|
|logoY|int|设置logo相对于标题栏下边缘y偏移|

+ iOS 授权页logo

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|logoHidden|boolean|隐藏logo|
|logoImage|String|设置logo图片|
|logoW|int|设置logo宽度|
|logoH|int|设置logo高度|
|logoX|int|设置logo相对于屏幕左边x轴偏移。since 2.3.8|
|logoY|int|设置logo相对于标题栏下边缘y偏移|
|logoConstraints|(centerX,centerY,width,height) |LOGO图片布局对象，统一设置约束条件，约束条件都是相对于整个屏幕布局|

+ Android授权页号码栏

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|numberColor|int|设置手机号码字体颜色|
|numberSize|Number|设置手机号码字体大小（单位：sp）。|
|numberY|int|设置号码栏相对于标题栏下边缘y偏移|
|numberX|int|设置号码栏相对于屏幕左边x轴偏移。|
|numberW|int|设置号码栏宽度。|
|numberH|int|设置号码栏高度。|

+ iOS授权页号码栏

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|numberColor|int|设置手机号码字体颜色|
|numberSize|Number|设置手机号码字体大小|
|numberY|int|设置号码栏相对于标题栏下边缘y偏移|
|numberX|int|设置号码栏相对于屏幕左边x轴偏移|
|numberW|int|设置号码栏宽度|
|numberH|int|设置号码栏高度|
|numberConstraints|(centerX,centerY,width,height) |号码栏布局对象，统一设置约束条件，约束条件都是相对于整个屏幕布局|


+ Android授权页slogan

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|sloganY|int|设置 slogan 相对于标题栏下边缘y偏移。|
|sloganX|int|设置 slogan 相对于屏幕左边x轴偏移。|
|sloganTextSize|int|设置 slogan 字体大小。|
|sloganHidden|boolean|设置 slogan 是否隐藏。|
|sloganTextColor|int|设置移动 slogan 文字颜色。|

+ iOS授权页slogan

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|sloganY|int|设置 slogan 相对于标题栏下边缘y偏移。|
|sloganX|int|设置 slogan 相对于屏幕左边x轴偏移。|
|sloganTextSize|int|设置 slogan 字体大小。|
|sloganHidden|boolean|设置 slogan 是否隐藏。|
|sloganTextColor|int|设置移动 slogan 文字颜色。|
|sloganConstraints|(centerX,centerY,width,height) |slogan布局对象，统一设置约束条件，约束条件都是相对于整个屏幕布局。|


+ Android授权页登录按钮

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|loginBtnText|String|设置登录按钮文字。|
|loginBtnTextSize|int|设置登录按钮字体大小。|
|loginBtnTextColor|int|设置登录按钮文字颜色。|
|loginBtnImageSelector|String|设置授权登录按钮selector选择样式。|
|loginBtnOffsetY|int|设置登录按钮相对于标题栏下边缘y偏移。|
|loginBtnOffsetX|int|设置登录按钮相对于屏幕左边x轴偏移。|
|loginBtnWidth|int|设置登录按钮宽度。|
|loginBtnHeight|int|设置登录按钮高度。|

+ iOS授权页登录按钮

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|loginBtnText|String|设置登录按钮文字。|
|loginBtnTextSize|int|设置登录按钮字体大小。|
|loginBtnTextColor|int|设置登录按钮文字颜色|
|loginBtnNormalImage|String|登录按钮正常图片|
|loginBtnDisabledImage|String|设登录按钮不可点击图片|
|loginBtnSelectedImage|String|设登录按钮选中图片|
|loginBtnOffsetY|int|设置登录按钮相对于标题栏下边缘y偏移|
|loginBtnOffsetX|int|设置登录按钮相对于屏幕左边x轴偏移。|
|loginBtnW|int|设置登录按钮宽度。|
|loginBtnH|int|设置登录按钮高度。|
|logBtnConstraints|(centerX,centerY,width,height) |登录布局对象，统一设置约束条件，约束条件都是相对于整个屏幕布局。|


+ Android授权页隐私栏

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|privacyOne|String,String|设置开发者隐私条款1名称和URL(名称，url)|
|privacyTwo|String,String|设置开发者隐私条款2名称和URL(名称，url)|
|privacyColor|int,int|设置隐私条款名称颜色(基础文字颜色，协议文字颜色)|
|privacyText|String,String,String,String|设置隐私条款名称外的文字。<br>如：登录即同意...和...、...并使用本机号码登录<br>参数1为："登录即同意"。<br>参数2为："和"。<br>参数3为："、"。<br>参数4为："并使用本机号码登录"。<br>|
|privacyTextSize|int|设置隐私条款文字字体大小（单位：sp）。|
|privacyTextGravityMode|string|隐私条款文本对齐方式，目前仅支持 left、center（默认左对齐）。|
|privacyOffsetX|int|设置隐私条款相对于屏幕左边x轴偏移。|
|privacyOffsetY|int|设置隐私条款相对于授权页面底部下边缘y偏移|
|privacyW|int|设置隐私条款文字栏宽度。|
|privacyH|int|隐私条款名称外的文字栏高度度(单位:dp)|
|privacyBookSymbolEnable|boolean|设置隐私条款运营商协议名是否加书名号。|
|privacyCheckboxHidden|boolean|设置隐私条款checkbox是否隐藏。|
|privacyCheckboxSize|int|设置隐私条款checkbox尺寸。|
|privacyCheckedImage|String|设置复选框选中时图片。|
|privacyUncheckedImage|String|设置复选框未选中时图片。|
|privacyCheckEnable|boolean|设置隐私条款默认选中状态，默认不选中。|

+ iOS授权页隐私栏

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|privacyOne|String,String|设置开发者隐私条款1名称和URL(名称，url)|
|privacyTwo|String,String|设置开发者隐私条款2名称和URL(名称，url)|
|privacyColor|int,int|设置隐私条款名称颜色(基础文字颜色，协议文字颜色)|
|privacyText|String,String,String,String|设置隐私条款名称外的文字。<br>如：登录即同意...和...、...并使用本机号码登录<br>参数1为："登录即同意"。<br>参数2为："和"。<br>参数3为："、"。<br>参数4为："并使用本机号码登录"。<br>|
|privacyTextSize|int|设置隐私条款文字字体大小（单位：sp）。|
|privacyTextGravityMode|string|隐私条款文本对齐方式，目前仅支持 left、center（默认左对齐）。|
|privacyX|int|设置隐私条款相对于屏幕左边x轴偏移。|
|privacyY|int|设置隐私条款相对于授权页面底部下边缘y偏移|
|privacyW|int|设置隐私条款文字栏宽度。|
|privacyH|int|隐私条款名称外的文字栏高度度|
|privacyConstraints|(centerX,centerY,width,height)|隐私条款label布局对象，统一设置约束条件，约束条件都是相对于整个屏幕布局,不可与privacyX,privacyY,,privacyW,privacyH同时使用|
|checkViewConstraints| (centerX,centerY,width,height)|隐私条款checkBox布局对象,相对于整个屏幕布 | 
|privacyBookSymbolEnable|boolean|设置隐私条款运营商协议名是否加书名号。|
|privacyCheckboxHidden|boolean|设置隐私条款checkbox是否隐藏。|
|privacyCheckedImage|String|设置复选框选中时图片|
|privacyUncheckedImage|String|设置复选框未选中时图片|
|privacyCheckEnable|boolean|设置隐私条款默认选中状态，默认不选中。|
|unAgreePrivacyCallBack| boolean| 值为true时， 当隐私条款checkBox未选中时,点击登录按钮时回调
当此参数存在时,未选中隐私条款的情况下，登录按钮可以被点击|


+ Android授权页隐私协议web页面

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|privacyWebNavColor|int|设置协议展示web页面导航栏背景颜色。|
|privacyWebNavTitleSize|int|设置协议展示 web 页面导航栏标题文字大小（sp）|
|privacyWebNavTitleColor|int|设置协议展示 web 页面导航栏标题文字颜色|
|privacyWebNavReturnImage|String|协议展示web页面导航栏返回按钮图标|

+ iOS授权页隐私协议web页面

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|privacyWebNavColor|int|设置协议展示web页面导航栏背景颜色。|
|privacyWebNavTitleSize|int|设置协议展示 web 页面导航栏标题文字大小（sp）|
|privacyWebNavTitleColor|int|设置协议展示 web 页面导航栏标题文字颜色|
|privacyWebNavReturnImage|String|协议展示web页面导航栏返回按钮图标|

+ Android授权页动画

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|privacyNeedStartAnim|boolean|设置拉起授权页时是否需要显示默认动画。默认展示。|
|privacyNeedCloseAnim|boolean|设置关闭授权页时是否需要显示默认动画。默认展示。|


+ iOS授权页动画

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|privacyNeedStartAnim|boolean|设置拉起授权页时是否需要显示默认动画。默认展示。|
|privacyNeedCloseAnim|boolean|设置关闭授权页时是否需要显示默认动画。默认展示。|


+ Android弹窗模式

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|privacyDialogTheme|int,int,int,int,boolean|设置授权页为弹窗模式(窗口宽度，窗口高度，窗口相对屏幕中心的x轴偏移量，窗口相对屏幕中心的y轴偏移量)，单位dp。注：窗口不支持导航栏|
|privacyNeedClose|boolean |弹窗是否需要关闭按钮|
|privacyCloseTheme|int,int,int,int|弹窗关闭按钮偏移量，(按钮宽度，按钮高度，按钮相对屏幕中心的x轴偏移量，按钮相对屏幕中心的y轴偏移量) privacyNeedClose为true时，必须设置它的偏移量|


+ iOS弹窗模式

|参数名称|参数类型|参数说明|
|:-----:|:----:|:-----:|
|showWindow|BOOL|是否弹窗，默认 no|
|windowBackgroundImage|String|弹框内部背景图片|
|windowBackgroundAlpha|float|弹窗外侧 透明度  0~1.0|
|windowCornerRadius|float|弹窗圆角数值|
|windowConstraints| 数组[float,float,float,float] |竖屏方向，弹窗布局对象(窗口宽度，窗口高度，窗口相对屏幕中心的x轴偏移量，窗口相对屏幕中心的y轴偏移量)|
|windowHorizontalConstraints| 数组[float,float,float,float] |竖屏方向，弹窗布局对象(窗口宽度，窗口高度，窗口相对屏幕中心的x轴偏移量，窗口相对屏幕中心的y轴偏移量)|
|windowCloseBtnConstraints|数组[float,float,float,float]|水平方向，弹窗布局对象(窗口宽度，窗口高度，窗口相对屏幕中心的x轴偏移量，窗口相对屏幕中心的y轴偏移量)|
|windowCloseBtnHorizontalConstraints|数组[float,float,float,float]|水平方向，弹窗布局对象(窗口宽度，窗口高度，窗口相对屏幕中心的x轴偏移量，窗口相对屏幕中心的y轴偏移量)|
|windowCloseBtnImgs|@[普通状态图片，高亮状态图片]|弹窗close按钮图片|

+ Android SDK授权页面添加自定义控件

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|customViewName|自定义view |在授权页面添加自定义rn视图|

+ iOS SDK授权页面添加自定义控件

|方法|参数类型|说明|
|:-----:|:----:|:----:|
|customViewName|自定义view |在授权页面添加自定义rn视图|




