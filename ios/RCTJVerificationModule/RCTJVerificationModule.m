#import "RCTJVerificationModule.h"
//常量
#define ENABLE         @"enable"
#define TIME           @"time"

#define CODE           @"code"
#define CONTENT        @"content"
#define PHONE_NUMBER   @"phoneNumber"
#define OPERATOR       @"operator"
#define UUID           @"uuid"

//事件
#define LOGIN_EVENT    @"LoginEvent"
#define UNCHECK_BOX_EVENT  @"UncheckBoxCallBack"
#define SMS_LOGIN_EVENT    @"SMSLoginEvent"
#define CLICK_WIDGET_EVENT  @"ClickWidgetEvent"
//自定义布局路径
#define CUSTOM_VIEW_NAME      @"customViewName"
#define CUSTOM_VIEW_POINT     @"customViewPoint"
#define UNCHECK_BOX_CALLBACK     @"unAgreePrivacyCallBack"

//资源文件夹
#define JVERIFICATION_RESOURCE          @"JVerificationResource"
//授权页

///
#define APP_LANGUAGE_TYPE               @"appLanguageType" //语言 0.中文简体（默认） 1.中文繁体 2.英文

////
//背景图
#define BACK_GROUND_IMAGE               @"backgroundImage"
#define BACK_GROUND_GIF_IMAGE           @"backgroundGifImage"
#define BACK_GROUND_VIDEO               @"backgroundVideo"
#define BACK_GROUND_VIDEO_PLACEHOLDER_IMAGE   @"backgroundVideoPlaceHolderImage"
//状态栏
#define STATUS_BAR_HIDDEN               @"statusBarHidden"          //状态栏是否隐藏
#define STATUS_BAR_MODE                 @"statusBarMode"            //状态栏模式
#define STATUS_BAR_MODE_LIGHT           @"light"                    //状态栏亮色模式
#define STATUS_BAR_MODE_DARK            @"dark"                     //状态栏暗色模式
//导航栏
#define NAV_HIDDEN                      @"navHidden"                //导航栏是否隐藏
#define NAV_COLOR                       @"navColor"                 //导航栏颜色
#define NAV_TRANSPARENT                 @"navTransparent"               //导航栏透明
//导航栏标题
#define NAV_TITLE                       @"navTitle"                 //导航栏标题
#define NAV_TITLE_SIZE                  @"navTitleSize"             //导航栏标题文字字体大小
#define NAV_TITLE_COLOR                 @"navTitleColor"            //导航栏标题文字颜色
//导航栏返回按钮
#define NAV_RETURN_HIDDEN               @"navReturnHidden"          //导航栏返回按钮是否隐藏
#define NAV_RETURN_IMAGE                @"navReturnImage"           //导航栏左侧返回按钮图标
#define NAV_RETURN_X                    @"navReturnX"       //导航栏返回按钮相对于屏幕左边x轴偏移
#define NAV_RETURN_Y                    @"navReturnY"               //导航栏返回按钮相对于导航栏下边缘y偏移

//logo
#define LOGO_HIDDEN                     @"logoHidden"               //logo是否隐藏
#define LOGO_IMAGE                      @"logoImage"                //logo(android默认为应用图标;ios默认无)
#define LOGO_X                          @"logoX"                    //logo相对于屏幕左边x轴偏移
#define LOGO_Y                          @"logoY"                    //logo相对于导航栏下边缘y偏移
#define LOGO_W                          @"logoW"                    //logo宽
#define LOGO_H                          @"logoH"                    //logo高
#define LOGO_CONSTRAINTS                @"logoConstraints"          //LOGO图片布局对象
//号码
#define NUMBER_SIZE                     @"numberSize"               //手机号码字体大小
#define NUMBER_COLOR                    @"numberColor"              //手机号码字体颜色
#define NUMBER_X                        @"numberX"                  //号码栏相对于屏幕左边x轴偏移
#define NUMBER_Y                        @"numberY"                  //号码栏相对于导航栏下边缘y偏移
#define NUMBER_W                        @"numberW"                  //号码栏宽度
#define NUMBER_H                        @"numberH"                  //号码栏高度
#define NUMBER_CONSTRAINTS              @"numberConstraints"        //号码栏布局对象
//slogan
#define SLOGAN_HIDDEN                   @"sloganHidden"             //slogan是否隐藏
#define SLOGAN_TEXT_SIZE                @"sloganTextSize"           //slogan字体大小
#define SLOGAN_TEXT_COLOR               @"sloganTextColor"          //slogan文字颜色
#define SLOGAN_X                        @"sloganX"                  //slogan相对于屏幕左边x轴偏移
#define SLOGAN_Y                        @"sloganY"                  //slogan相对于导航栏下边缘y偏移
#define SLOGAN_W                        @"sloganW"                  //slogan宽度
#define SLOGAN_H                        @"sloganH"                  //slogan高度
#define SLOGAN_CONSTRAINTS              @"sloganConstraints"        //slogan布局对象
//登录按钮
#define LOGIN_BTN_TEXT                  @"loginBtnText"             //登录按钮文字
#define LOGIN_BTN_TEXT_SIZE             @"loginBtnTextSize"         //登录按钮字体大小
#define LOGIN_BTN_TEXT_COLOR            @"loginBtnTextColor"        //登录按钮文字颜色
#define LOGIN_BTN_IMAGE                 @"loginBtnImage"            //登录按钮selector选择样式 （仅android）
#define LOGIN_BTN_NORMAL_IMAGE          @"loginBtnNormalImage"      //登录按钮正常图片 （仅ios,三个同时设置生效）
#define LOGIN_BTN_DISABLED_IMAGE        @"loginBtnDisabledImage"    //登录按钮失效图片  (仅ios,三个同时设置生效)
#define LOGIN_BTN_SELECTED_IMAGE        @"loginBtnSelectedImage"    //登录按钮按下图片  (仅ios,三个同时设置生效）
#define LOGIN_BTN_X                     @"loginBtnX"                //登录按钮相对于屏幕左边x轴偏移
#define LOGIN_BTN_Y                     @"loginBtnY"                //登录按钮相对于d导航栏下边缘y偏移
#define LOGIN_BTN_W                     @"loginBtnW"                //登录按钮宽度
#define LOGIN_BTN_H                     @"loginBtnH"                //登录按钮高度
#define LOGIN_BTN_CONSTRAINTS           @"logBtnConstraints"        //登录按钮布局对象
//隐私条款
#define PRIVACY_ONE                     @"privacyOne"               //隐私条款一:数组（务必按顺序）@[条款名称,条款链接]
#define PRIVACY_TWO                     @"privacyTwo"               //隐私条款二:数组（务必按顺序）@[条款名称,条款链接]
#define PRIVACY_Arr                     @"privacyNameAndUrlBeanList"               //隐私条款组合:数组（务必按顺序）@[[条款名称,条款链接],[条款名称,条款链接]]
#define PRIVACY_COLOR                   @"privacyColor"             //隐私条款名称颜色 @[基础文字颜色,条款颜色]
#define PRIVACY_TEXT                    @"privacyText"              //隐私条款拼接文本数组
#define PRIVACY_TEXT_SIZE               @"privacyTextSize"          //隐私条款字体大小，默认12
#define PRIVACY_TEXT_GRAVITY_MODE       @"privacyTextGravityMode"   //隐私条款文本对齐方式，目前仅支持 left、center
#define PRIVACY_TEXT_GRAVITY_LEFT       @"left"                     //隐私条款文本对齐方式，目前仅支持 left、center
#define PRIVACY_TEXT_GRAVITY_CENTER     @"center"                   //隐私条款文本对齐方式，目前仅支持 left、center
#define PRIVACY_BOOK_SYMBOL_ENABLE      @"privacyBookSymbolEnable"  //隐私条款是否显示书名号，默认不显示
#define PRIVACY_X                       @"privacyX"                 //隐私条款相对于屏幕左边x轴偏移
#define PRIVACY_Y                       @"privacyY"                 //隐私条款相对于导航栏下边缘y偏移
#define PRIVACY_W                       @"privacyW"                 //隐私条款宽度
#define PRIVACY_H                       @"privacyH"                 //隐私条款高度
#define PRIVACY_CONSTRAINTS             @"privacyConstraints"       //隐私条款布局对象
#define TEXT_VER_ALIGNMENT              @"textVerAlignment" //设置条款文字是否垂直居中对齐(默认居中对齐) 0是top 1是m 2是b
#define OPEN_PRIVACY_IN_BROWSER         @"openPrivacyInBrowser"               //在浏览器打开

//隐私条款checkbox
#define PRIVACY_CHECKBOX_HIDDEN         @"privacyCheckboxHidden"    //checkBox是否隐藏，默认不隐藏
#define PRIVACY_CHECK_ENABLE            @"privacyCheckEnable"       //checkBox默认状态 默认:NO
#define PRIVACY_CHECKED_IMAGE           @"privacyCheckedImage"      //checkBox选中时图片
#define PRIVACY_UNCHECKED_IMAGE         @"privacyUncheckedImage"    //checkBox未选中时图片
#define CHECK_VIEW_CONSTRAINTS          @"checkViewConstraints"     //checkBox布局对象
#define IS_ALERT_PRIVACYVC              @"isAlertPrivacyVC"         //是否在未勾选隐私协议的情况下 弹窗提示窗口
//协议
#define PRIVACY_WEB_NAV_COLOR           @"privacyWebNavColor"       //协议页导航栏背景颜色
#define PRIVACY_WEB_NAV_TITLE           @"privacyWebNavTitle"       //协议页导航栏标题
#define PRIVACY_WEB_NAV_TITLE_SIZE      @"privacyWebNavTitleSize"   //协议页导航栏标题字体大小
#define PRIVACY_WEB_NAV_TITLE_COLOR     @"privacyWebNavTitleColor"  //协议页导航栏标题字体颜色
#define PRIVACY_WEB_NAV_RETURN_IMAGE    @"privacyWebNavReturnImage" //协议页导航栏返回按钮图片
#define PRIVACY_WEB_NAV_NAVCUSTOM       @"privacyWebNavNavCustom"   //协议页导航是否隐藏

//弹窗
#define SHOW_WINDOW                                 @"showWindow"                         // 是否弹窗，默认no
#define WINDOW_BACKGROUND_IMAGE                     @"windowBackgroundImage"              // 弹框内部背景图片
#define WINDOW_BACKGROUND_ALPHA                     @"windowBackgroundAlpha"              //弹窗外侧 透明度 0~1.0
#define WINDOW_CORNER_RADIUS                        @"windowCornerRadius"                 //弹窗圆角数值
#define WINDOW_CONSTRAINTS                          @"windowConstraints"                 //弹窗布局对象
#define WINDOW_HORIZONTAL_CONSTRAINTS               @"windowHorizontalConstraints"        //弹窗横屏布局，横屏下优先级高于windowConstraints
#define WINDOW_CLOSE_BTN_CONSTRAINTS                @"windowCloseBtnConstraints"          //弹窗close按钮布局
#define WINDOW_CLOSE_BTN_HORIZONTAL_CONSTRAINTS     @"windowCloseBtnHorizontalConstraints"//弹窗close按钮 横屏布局,横屏下优先级高于windowCloseBtnConstraints
#define WINDOW_CLOSE_BTN_IMGS                       @"windowCloseBtnImgs"                 //弹窗close按钮图片 @[普通状态图片，高亮状态图片]

#define LOADING_CONSTRAINTS                         @"loadingConstraints"

//二次弹窗
#define AGREEMENT_ALERT_VIEW_UI_FRAMES         @"agreementAlertViewUIFrames"               //在浏览器打开
#define AGREEMENT_ALERT_VIEW_CORNER_RADIUS     @"agreementAlertViewCornerRadius"            //协议二次弹窗的圆角
#define AGREEMENT_ALERT_VIEW_BACKGROUND_COLOR  @"agreementAlertViewBackgroundColor"         //协议二次弹窗背景颜色
#define AGREEMENT_ALERT_VIEW_BACKGROUND_IMG_PATH @"agreementAlertViewBackgroundImgPath"     //协议二次弹窗背景图片
#define AGREEMENT_ALERT_VIEW_TITLE_TEXT        @"agreementAlertViewTitleText"               //协议二次弹窗标题文本
#define AGREEMENT_ALERT_VIEW_TITLE_TEXT_SIZE     @"agreementAlertViewTitleTextSize"                                           //协议二次弹窗标题文本样式
#define AGREEMENT_ALERT_VIEW_TITLE_TEXT_COLOR  @"agreementAlertViewTitleTextColor"             //协议二次弹窗标题文本颜色
#define AGREEMENT_ALERT_VIEW_CONTENT_TEXT_ALIGNMENT @"agreementAlertViewContentTextAlignment"              //协议二次弹窗内容文本对齐方式
#define AGREEMENT_ALERT_VIEW_CONTENT_TEXT_FONT_SIZE @"agreementAlertViewContentTextFontSize"           //协议二次弹窗内容文本字体大小
#define AGREEMENT_ALERT_VIEW_LOG_BTN_TEXT      @"agreementAlertViewLogBtnText"                 //协议二次弹窗登录按钮文本
#define AGREEMENT_ALERT_VIEW_LOG_BTN_TEXT_FONT_SIZE @"agreementAlertViewLogBtnTextFontSize"    //协议二次弹窗登录按钮文本字体大小
#define AGREEMENT_ALERT_VIEW_LOGIN_BTN_NORMAL_IMAGE_PATH @"agreementAlertViewLoginBtnNormalImagePath"    //登录按钮激活状态背景图
#define AGREEMENT_ALERT_VIEW_LOGIN_BTN_PRESSED_IMAGE_PATH @"agreementAlertViewLoginBtnPressedImagePath"  //登录按钮高亮状态背景图
#define AGREEMENT_ALERT_VIEW_LOGIN_BTN_UNABLE_IMAGE_PATH @"agreementAlertViewLoginBtnUnableImagePath"    //登录按钮失效状态背景图
#define AGREEMENT_ALERT_VIEW_LOG_BTN_TEXT_COLOR @"agreementAlertViewLogBtnTextColor"            //协议二次弹窗登录按钮文本颜色



//SMS
#define SMS_UI_CONFIG @"smsUIConfig"            //短信页面配置
#define SMS_AUTH_PAGE_BACKGROUND_IMAGE_PATH       @"smsAuthPageBackgroundImagePath"           // 登录界面背景图片
#define SMS_NAV_TEXT                              @"smsNavText"                               // 导航栏标题文字
#define SMS_NAV_TEXT_COLOR                        @"smsNavTextColor"                          // 导航栏标题颜色 only iOS
#define SMS_NAV_TEXT_BOLD                         @"smsNavTextBold"                           // 导航栏标题 是否加粗 only iOS
#define SMS_NAV_TEXT_SIZE                         @"smsNavTextSize"                           // 导航栏标题大小 only iOS
#define SMS_SLOGAN_TEXT_SIZE                      @"smsSloganTextSize"                        // 设置 slogan 字体大小
#define SMS_SLOGAN_OFFSET_X                       @"smsSloganOffsetX"                         // 设置 slogan 相对于屏幕左边 x 轴偏移
#define SMS_SLOGAN_OFFSET_Y                       @"smsSloganOffsetY"                         // 设置 slogan 相对于标题栏下边缘 y 偏移
#define SMS_SLOGAN_OFFSET_BOTTOM_Y                @"smsSloganOffsetBottomY"                   // 设置 slogan 相对于屏幕底部下边缘 y 轴偏移
#define SMS_SLOGAN_WIDTH                          @"smsSloganWidth"                           // 设置 slogan 宽度  only iOS
#define SMS_SLOGAN_HEIGHT                         @"smsSloganHeight"                          // 设置 slogan 高度 only iOS
#define SMS_SLOGAN_TEXT_COLOR                     @"smsSloganTextColor"                       // 设置移动 slogan 文字颜色
#define SMS_LOGO_WIDTH                            @"smsLogoWidth"                             // 设置 logo 宽度（单位：dp）
#define SMS_LOGO_HEIGHT                           @"smsLogoHeight"                            // 设置 logo 高度（单位：dp）
#define SMS_LOGO_OFFSET_X                         @"smsLogoOffsetX"                           // 设置 logo 相对于屏幕左边 x 轴偏移
#define SMS_LOGO_OFFSET_Y                         @"smsLogoOffsetY"                           // 设置 logo 相对于标题栏下边缘 y 偏移
#define SMS_LOGO_OFFSET_BOTTOM_Y                  @"smsLogoOffsetBottomY"                     // 设置 logo 相对于屏幕底部 y 轴偏移
#define IS_SMS_LOGO_HIDDEN                        @"isSmsLogoHidden"                          // 隐藏 logo
#define SMS_LOGO_RES_NAME                         @"smsLogoResName"                           // 设置 logo 图片
#define SMS_PHONE_INPUT_VIEW_OFFSET_X             @"smsPhoneInputViewOffsetX"                 // 设置号码输入框相对于屏幕左边 x 轴偏移
#define SMS_PHONE_INPUT_VIEW_OFFSET_Y             @"smsPhoneInputViewOffsetY"                 // 设置号码输入框相对于屏幕底部 y 轴偏移
#define SMS_PHONE_INPUT_VIEW_WIDTH                @"smsPhoneInputViewWidth"                   // 设置号码输入框宽度
#define SMS_PHONE_INPUT_VIEW_HEIGHT               @"smsPhoneInputViewHeight"                  // 设置号码输入框高度
#define SMS_PHONE_INPUT_VIEW_TEXT_COLOR           @"smsPhoneInputViewTextColor"               // 设置手机号码输入框字体颜色
#define SMS_PHONE_INPUT_VIEW_TEXT_SIZE            @"smsPhoneInputViewTextSize"                // 设置手机号码输入框字体大小
#define SMS_PHONE_INPUT_VIEW_PLACEHOLDER_TEXT     @"smsPhoneInputViewPlaceholderText"         // 设置手机号码输入框提示词 only iOS
//#define SMS_PHONE_INPUT_VIEW_BORDER_STYLE         @"smsPhoneInputViewBorderStyle"             // 设置手机号码输入框样式 only iOS
#define SMS_VERIFY_CODE_EDIT_TEXT_VIEW_TEXT_SIZE  @"smsVerifyCodeEditTextViewTextSize"        // 设置验证码输入框字体大小
#define SMS_VERIFY_CODE_EDIT_TEXT_VIEW_TEXT_COLOR @"smsVerifyCodeEditTextViewTextColor"       // 设置验证码输入框字体颜色
#define SMS_VERIFY_CODE_EDIT_TEXT_VIEW_PLACEHOLDER_TEXT @"smsVerifyCodeEditTextViewPlaceholderText" // 设置验证码输入框提示词 only iOS
#define SMS_VERIFY_CODE_EDIT_TEXT_VIEW_OFFSET_X   @"smsVerifyCodeEditTextViewOffsetX"         // 设置验证码输入框相对于屏幕左边 x 轴偏移
#define SMS_VERIFY_CODE_EDIT_TEXT_VIEW_OFFSET_Y   @"smsVerifyCodeEditTextViewOffsetY"         // 设置验证码输入框相对于标题栏下边缘 y 偏移
#define SMS_VERIFY_CODE_EDIT_TEXT_VIEW_OFFSET_R   @"smsVerifyCodeEditTextViewOffsetR"         // 设置验证码输入框相对于屏幕右边偏移
#define SMS_VERIFY_CODE_EDIT_TEXT_VIEW_WIDTH      @"smsVerifyCodeEditTextViewWidth"           // 设置验证码输入框宽度
#define SMS_VERIFY_CODE_EDIT_TEXT_VIEW_HEIGHT     @"smsVerifyCodeEditTextViewHeight"          // 设置验证码输入框高度
#define SMS_GET_VERIFY_CODE_TEXT_VIEW_OFFSET_X    @"smsGetVerifyCodeTextViewOffsetX"          // 设置获取验证码按钮相对于屏幕左边 x 轴偏移
#define SMS_GET_VERIFY_CODE_TEXT_VIEW_OFFSET_Y    @"smsGetVerifyCodeTextViewOffsetY"          // 设置获取验证码按钮相对于标题栏下边缘 y 偏移
#define SMS_GET_VERIFY_CODE_TEXT_VIEW_TEXT_SIZE   @"smsGetVerifyCodeTextViewTextSize"         // 设置获取验证码按钮字体大小
#define SMS_GET_VERIFY_CODE_TEXT_VIEW_TEXT_COLOR  @"smsGetVerifyCodeTextViewTextColor"        // 设置获取验证码按钮文字颜色
#define SMS_GET_VERIFY_CODE_TEXT_VIEW_OFFSET_R    @"smsGetVerifyCodeTextViewOffsetR"          // 设置获取验证码按钮相对于屏幕右边偏移
#define SMS_GET_VERIFY_CODE_BTN_WIDTH             @"smsGetVerifyCodeBtnWidth"                 // 设置获取验证码按钮宽度 only iOS
#define SMS_GET_VERIFY_CODE_BTN_HEIGHT            @"smsGetVerifyCodeBtnHeight"                // 设置获取验证码按钮高度 only iOS
#define SMS_GET_VERIFY_CODE_BTN_CORNER_RADIUS     @"smsGetVerifyCodeBtnCornerRadius"          // 设置获取验证码按钮圆角度数 only iOS
#define SMS_GET_VERIFY_CODE_BTN_BACKGROUND_PATH   @"smsGetVerifyCodeBtnBackgroundPath"        // 设置获取验证码按钮图片
#define SMS_GET_VERIFY_CODE_BTN_BACKGROUND_PATHS  @"smsGetVerifyCodeBtnBackgroundPaths"       // 设置获取验证码按钮图片 [激活状态的图片,失效状态的图片,高亮状态的图片] only iOS
#define SMS_GET_VERIFY_CODE_BTN_TEXT              @"smsGetVerifyCodeBtnText"                  // 设置获取验证码按钮文字  only iOS
#define SMS_LOG_BTN_OFFSET_X                      @"smsLogBtnOffsetX"                         // 设置登录按钮相对于屏幕左边 x 轴偏移
#define SMS_LOG_BTN_OFFSET_Y                      @"smsLogBtnOffsetY"                         // 设置登录按钮相对于标题栏下边缘 y 偏移
#define SMS_LOG_BTN_WIDTH                         @"smsLogBtnWidth"                           // 设置登录按钮宽度
#define SMS_LOG_BTN_HEIGHT                        @"smsLogBtnHeight"                          // 设置登录按钮高度
#define SMS_LOG_BTN_TEXT_SIZE                     @"smsLogBtnTextSize"                        // 设置登录按钮字体大小
#define SMS_LOG_BTN_BOTTOM_OFFSET_Y               @"smsLogBtnBottomOffsetY"                   // 设置登录按钮相对屏幕底部 y 轴偏移
#define SMS_LOG_BTN_TEXT                          @"smsLogBtnText"                            // 设置登录按钮文字
#define SMS_LOG_BTN_TEXT_COLOR                    @"smsLogBtnTextColor"                       // 设置登录按钮文字颜色
#define IS_SMS_LOG_BTN_TEXT_BOLD                  @"isSmsLogBtnTextBold"                      // 设置登录按钮字体是否加粗
#define SMS_LOG_BTN_BACKGROUND_PATH               @"smsLogBtnBackgroundPath"                  // 设置授权登录按钮图片
#define SMS_LOG_BTN_BACKGROUND_PATHS              @"smsLogBtnBackgroundPaths"                 // 设置授权登录按钮图片 @[激活状态的图片,失效状态的图片,高亮状态的图片] only iOS
#define IS_SMS_PRIVACY_TEXT_GRAVITY_CENTER        @"isSmsPrivacyTextGravityCenter"            // 设置隐私条款文字是否居中对齐（默认左对齐）
#define SMS_PRIVACY_COLOR                         @"smsPrivacyColor"                          // 设置隐私条款名称颜色 [基础文字颜色，协议文字颜色] only iOS
#define SMS_PRIVACY_TEXT_VER_ALIGNMENT            @"smsPrivacyTextVerAlignment"               // 设置隐私条款垂直对齐方式 0:top 1:middle 2:bottom only iOS
#define SMS_PRIVACY_OFFSET_X                      @"smsPrivacyOffsetX"                        // 协议相对于屏幕左边 x 轴偏移
#define SMS_PRIVACY_OFFSET_Y                      @"smsPrivacyOffsetY"                        // 协议相对于底部 y 偏移
#define SMS_PRIVACY_TOP_OFFSET_Y                  @"smsPrivacyTopOffsetY"                     // 协议相对于标题栏下边缘 y 偏移
#define SMS_PRIVACY_WIDTH                         @"smsPrivacyWidth"                          // 协议宽度 only iOS
#define SMS_PRIVACY_HEIGHT                        @"smsPrivacyHeight"                         // 协议高度 only iOS
#define SMS_PRIVACY_CHECKBOX_SIZE                 @"smsPrivacyCheckboxSize"                   // 设置隐私条款 checkbox 尺寸
#define SMS_PRIVACY_CHECKBOX_OFFSET_X             @"smsPrivacyCheckboxOffsetX"                // 设置隐私条款 checkbox 相对于屏幕左边 x 轴偏移
#define SMS_PRIVACY_CHECKBOX_OFFSET_Y             @"smsPrivacyCheckboxOffsetY"                // 设置隐私条款 checkbox 相对于屏幕 y 轴偏移
#define IS_SMS_PRIVACY_CHECKBOX_IN_CENTER         @"isSmsPrivacyCheckboxInCenter"             // 设置隐私条款 checkbox 是否相对协议文字纵向居中
#define SMS_PRIVACY_CHECKBOX_STATE                @"smsPrivacyCheckboxState"                  // 设置隐私条款 checkbox 默认状态 : 是否选择 默认:NO
#define SMS_PRIVACY_CHECKBOX_MARGIN               @"smsPrivacyCheckboxMargin"                 // 设置协议相对于登录页的间距 only android
#define SMS_PRIVACY_CHECKBOX_UNCHECKED_IMG_PATH   @"smsPrivacyCheckboxUncheckedImgPath"       // 设置隐私条款 checkbox 未选中时图片 only iOS
#define SMS_PRIVACY_CHECKBOX_CHECKED_IMG_PATH     @"smsPrivacyCheckboxCheckedImgPath"         // 设置隐私条款 checkbox 选中时图片 only iOS
#define SMS_PRIVACY_BEAN_LIST                     @"smsPrivacyBeanList"                       // 设置协议内容
#define SMS_PRIVACY_CLAUSE_START                  @"smsPrivacyClauseStart"                    // 设置协议条款开头文本
#define SMS_PRIVACY_CLAUSE_END                    @"smsPrivacyClauseEnd"                      // 设置协议条款结尾文本
#define ENABLE_SMS_SERVICE                        @"enableSMSService"                         // 如果开启了短信服务，在认证服务失败时，短信服务又可用的情况下拉起短信服务

//自定义控件
#define CUSTOM_WIDGET_LIST                        @"customWidgetList"                         // 自定义控件数组

#define UIColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

static double defaultTime  = 5000;
bool debug  = false;
@implementation RCTJVerificationModule {
    NSMutableDictionary *_customWidgetIdDic;  // 存储 widgetId 和 tag 的映射关系
}

RCT_EXPORT_MODULE(JVerificationModule);

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _customWidgetIdDic = [NSMutableDictionary dictionary];
    }
    return self;
}

RCT_EXPORT_METHOD(setDebug: (BOOL )enable)
{
    [JVERIFICATIONService setDebug: enable];
    debug = enable;
}

RCT_EXPORT_METHOD(setupWithConfig: (NSDictionary *)params
                  callback: (RCTResponseSenderBlock)callback)
{
    JVAuthConfig *config = [[JVAuthConfig alloc] init];
    if (params[@"appKey"]) {
        config.appKey = params[@"appKey"];
    }
    if (params[@"channel"]) {
        config.channel = params[@"channel"];
    }
    if (params[@"advertisingId"]) {
        config.advertisingId = params[@"advertisingId"];
    }
    if (params[@"isProduction"]) {
        config.isProduction = [params[@"isProduction"] boolValue];
    }
    if(params[@"time"]){
        config.timeout = [params[@"time"] doubleValue];
    }else{
        config.timeout = defaultTime;
    }
    if(callback != nil){
        config.authBlock = ^(NSDictionary *result) {
            NSNumber *code = result[@"code"];
            NSString *content = result[@"content"];
            NSDictionary *response = [self convertToResult:code content:content];
            callback(@[response]);
        };
    }
    [JVERIFICATIONService setupWithConfig:config];
}

RCT_EXPORT_METHOD(isSetupClient: (RCTResponseSenderBlock)callback)
{
    BOOL enable = [JVERIFICATIONService isSetupClient];
    NSDictionary *data = [self convertToResult:enable];
    callback(@[data]);
}

RCT_EXPORT_METHOD(checkVerifyEnable: (RCTResponseSenderBlock)callback)
{
    [JVERIFICATIONService checkVerifyEnable:^(BOOL isSupport, NSString * _Nonnull operatorType) {
        NSMutableDictionary *data = [self convertToResult:isSupport];
        [data setObject:operatorType forKey:@"operatorType"];
        callback(@[data]);
    }];
    
}

RCT_EXPORT_METHOD(getToken: (double)params
                  callback: (RCTResponseSenderBlock)callback)
{
    NSTimeInterval time  = params;
    [JVERIFICATIONService getToken:(time) completion:^(NSDictionary *result) {
        NSNumber *code =  result[@"code"]?result[@"code"]:@(-1);
        NSString *content = result[@"token"]?result[@"token"]:@"";
        NSString *operator = result[@"operator"]?result[@"operator"]:@"";
        NSDictionary *data = [self convertToResult:code content:content operator:operator];
        callback(@[data]);
    }];
}

RCT_EXPORT_METHOD(preLogin: (double)params
                  callback: (RCTResponseSenderBlock)callback)
{
    NSTimeInterval time  = params;
    [JVERIFICATIONService preLogin:time completion:^(NSDictionary *result) {
        NSNumber *code =  result[@"code"]?result[@"code"]:@(-1);
        NSString *message = result[@"message"]?result[@"message"]:@"";
        NSDictionary *data = [self convertToResult:code content:message];
        callback(@[data]);
    }];
}

RCT_EXPORT_METHOD(clearPreLoginCache)
{
    [JVERIFICATIONService clearPreLoginCache];
}

- (UIView *)getRootViewUseRootViewFactory:(NSString *)moduleName {
    UIView *rctView;
    id delegate = [UIApplication sharedApplication].delegate;
    if (delegate && [delegate respondsToSelector:@selector(rootViewFactory)]) {
        id factory = [delegate performSelector:@selector(rootViewFactory)];
        SEL selector = @selector(viewWithModuleName:);
        if (factory && [factory isKindOfClass:NSClassFromString(@"RCTRootViewFactory")] && [factory respondsToSelector:selector]) {
            rctView = [factory performSelector:selector withObject:moduleName];
            return rctView;
        }
    }
    //swift的deleagte需要在reactNativeFactory写@objc
    if (delegate && [delegate respondsToSelector:@selector(reactNativeFactory)]) {
        id reactNativeFactory = [delegate performSelector:@selector(reactNativeFactory)];

        if (reactNativeFactory && [reactNativeFactory respondsToSelector:@selector(rootViewFactory)]) {
            id factory = [reactNativeFactory performSelector:@selector(rootViewFactory)];
            SEL selector = @selector(viewWithModuleName:);
            if (factory && [factory isKindOfClass:NSClassFromString(@"RCTRootViewFactory")] && [factory respondsToSelector:selector]) {
                rctView = [factory performSelector:selector withObject:moduleName];
                return rctView;
            }
        }
    }
    return nil;
}

RCT_EXPORT_METHOD(customUIWithConfig: (NSDictionary *)configParams viewParams: (NSArray *)viewParams)
{
    
    JVUIConfig *config = [self convertToCinfig:configParams];
    dispatch_async(dispatch_get_main_queue(), ^{
        [JVERIFICATIONService customUIWithConfig:config customViews:^(UIView *customAreaView) {
            // 添加自定义控件
            NSArray *customWidgetList = configParams[CUSTOM_WIDGET_LIST];
            if (customWidgetList && [customWidgetList isKindOfClass:[NSArray class]]) {
                for (NSDictionary *widgetDic in customWidgetList) {
                    if (![widgetDic isKindOfClass:[NSDictionary class]]) {
                        continue;
                    }
                    NSString *type = [self getValue:widgetDic key:@"type"];
                    if ([type isEqualToString:@"button"]) {
                        UIButton *button = [self addCustomButtonWidget:widgetDic];
                        if (button) {
                            [customAreaView addSubview:button];
                        }
                    } else if ([type isEqualToString:@"textView"]) {
                        UILabel *label = [self addCustomTextWidget:widgetDic];
                        if (label) {
                            [customAreaView addSubview:label];
                        }
                    }
                }
            }
            
            // 添加 React Native 自定义视图
            for (int i = 0; i < viewParams.count; i++) {
                UIView *rctView;
                
                rctView = [self getRootViewUseRootViewFactory:viewParams[i][CUSTOM_VIEW_NAME]];
                
                if (rctView) {
                    if (debug) {
                        NSLog(@"use RootViewFactory");
                    }
                }
                else if (self.bridge) {
                    rctView = [[RCTRootView alloc] initWithBridge:self.bridge moduleName:viewParams[i][CUSTOM_VIEW_NAME] initialProperties:nil];
                    if (debug) {
                        NSLog(@"use bridge");
                    }
                }
                else {
//                    NSURL *jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
//                    NSURL *jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
                    if (debug) {
                        NSLog(@"use rctrootview");
                    }
                    NSURL *jsCodeLocation;
                    RCTBundleURLProvider *provider = [RCTBundleURLProvider sharedSettings];
                    if([provider respondsToSelector:@selector(jsBundleURLForBundleRoot:fallbackResource:)]){
                        SEL methodSelector = NSSelectorFromString(@"jsBundleURLForBundleRoot:fallbackResource:");
                        jsCodeLocation = [provider performSelector:methodSelector withObject:@"index" withObject:nil];
                    }
                    if([provider respondsToSelector:@selector(jsBundleURLForBundleRoot:)]){
                        SEL methodSelector = NSSelectorFromString(@"jsBundleURLForBundleRoot:");
                        jsCodeLocation = [provider performSelector:methodSelector withObject:@"index" withObject:nil];
                    }
                    rctView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:viewParams[i][CUSTOM_VIEW_NAME] initialProperties:nil launchOptions:nil];
                }
                NSArray *point = viewParams[i][CUSTOM_VIEW_POINT];
                NSNumber *pointX = point[0];
                NSNumber *pointY = point[1];
                NSNumber *pointW = point[2];
                NSNumber *pointH = point[3];
                CGFloat x = [pointX doubleValue];
                CGFloat y = [pointY doubleValue];
                CGFloat w = [pointW doubleValue];
                CGFloat h = [pointH doubleValue];
                CGRect customFrame = rctView.frame;
                customFrame.origin = CGPointMake(x, y);
                customFrame.size = CGSizeMake(w, h);
                rctView.frame = customFrame;
                rctView.backgroundColor = [UIColor clearColor];
                [customAreaView addSubview:rctView];
            }
        }];
    });
}

RCT_EXPORT_METHOD(getAuthorizationWithController: (BOOL )enable
                  timeout: (NSInteger)timeout
                  callback: (RCTResponseSenderBlock)callback)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
        UIViewController *topVC = vc;
        if (topVC.presentedViewController) {
            topVC = topVC.presentedViewController;
        }
        
        [JVERIFICATIONService getAuthorizationWithController:topVC hide:enable animated: YES timeout:timeout completion:^(NSDictionary *result) {
            NSNumber *code = result[@"code"];
            NSString *content = @"";
            if(result[@"content"]){
                content = result[@"content"];
            }
            if(result[@"loginToken"]){
                content = result[@"loginToken"];
            }
            NSString *operator = result[@"operator"]?result[@"operator"]:@"";
            NSDictionary *responseData = [self convertToResult:code content:content operator:operator];
            [self sendLoginEvent:responseData];
            
            if (callback) {
                callback(@[responseData]);
            }
            
        } actionBlock:^(NSInteger type, NSString *content) {
            NSNumber *code = [NSNumber numberWithLong: type];
            NSDictionary *responseData = [self convertToResult:code content:content];
            [self sendLoginEvent:responseData];
        }];
    });
}


RCT_EXPORT_METHOD(smsLogin: (BOOL )enable
                  timeout: (NSInteger)timeout
                  callback: (RCTResponseSenderBlock)callback)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
        UIViewController *topVC = vc;
        if (topVC.presentedViewController) {
            topVC = topVC.presentedViewController;
        }
        
        [JVERIFICATIONService getSMSAuthorizationWithController:topVC hide:enable animated:YES timeout:timeout completion:^(NSDictionary * _Nonnull result) {
            NSNumber *code = result[@"code"];
            NSString *msg = @"";
            NSString *phoneNumber = @"";
            if([result[@"content"] isKindOfClass:[NSString class]]){
                msg = result[@"content"];
            }else if ([result[@"content"] isKindOfClass:[NSDictionary class]]) {
                phoneNumber = [result[@"content"] objectForKey:@"number"];
                if ([[result[@"content"] objectForKey:@"tokenReponse"] isKindOfClass:[NSDictionary class]]) {
                    msg = [result[@"content"][@"tokenReponse"] objectForKey:@"resultMsg"];
                }
            }
            
            NSDictionary *responseData = [self convertToResult:code content:msg phoneNumber:phoneNumber];
            [self sendLoginEvent:responseData];
            
            if (callback) {
                callback(@[responseData]);
            }
        } actionBlock:^(NSInteger type, NSString *content) {
            NSNumber *code = [NSNumber numberWithLong: type];
            NSDictionary *responseData = [self convertToResult:code content:content];
            [self sendSMSLoginEvent:responseData];
        }];
      
    });
}

RCT_EXPORT_METHOD(dismissLoginController)
{
    [JVERIFICATIONService dismissLoginController];
}

// 获取验证码
RCT_EXPORT_METHOD(getSmsCode: (NSDictionary *)params callback: (RCTResponseSenderBlock)callback)
{
    NSString *phoneNumber = @"";
    NSString *signID = @"";
    NSString *templateID = @"";
    
    if(params[@"phoneNumber"]){
        phoneNumber = params[@"phoneNumber"];
    }
    if(params[@"signID"]){
        signID = params[@"signID"];
    }
    if(params[@"templateID"]){
        templateID = params[@"templateID"];
    }
    
    [JVERIFICATIONService getSMSCode:(phoneNumber) templateID:templateID signID:signID completionHandler:^(NSDictionary * _Nonnull result) {
        callback(@[result]);
    }];
}

// 设置前后两次获取验证码的时间间隔
RCT_EXPORT_METHOD(setTimeWithConfig: (double)timeInter )
{
    NSTimeInterval time  = timeInter;
    [JVERIFICATIONService setGetCodeInternal:time];
}

//事件处理
- (NSArray<NSString *> *)supportedEvents
{
    return @[LOGIN_EVENT,UNCHECK_BOX_EVENT, SMS_LOGIN_EVENT, CLICK_WIDGET_EVENT];
}

- (void)sendSMSLoginEvent:(NSDictionary *)responseData
{
    [self.bridge enqueueJSCall:@"RCTDeviceEventEmitter"
                        method:@"emit"
                          args:@[SMS_LOGIN_EVENT, responseData]
                    completion:NULL];
}

- (void)sendLoginEvent:(NSDictionary *)responseData
{
    [self.bridge enqueueJSCall:@"RCTDeviceEventEmitter"
                        method:@"emit"
                          args:@[LOGIN_EVENT, responseData]
                    completion:NULL];
}

- (void)sendUncheckBoxEvent{
    [self.bridge enqueueJSCall:@"RCTDeviceEventEmitter"
                        method:@"emit"
                          args:@[UNCHECK_BOX_EVENT]
                    completion:NULL];
}

- (void)sendClickWidgetEvent:(NSDictionary *)responseData
{
    [self.bridge enqueueJSCall:@"RCTDeviceEventEmitter"
                        method:@"emit"
                          args:@[CLICK_WIDGET_EVENT, responseData]
                    completion:NULL];
}
//结果返回
-(NSMutableDictionary *)convertToResult:(BOOL)enable
{
    NSMutableDictionary *responseData = [@{@"enable":@(enable)} mutableCopy];
    return responseData;
}

-(NSDictionary *)convertToResult:(NSNumber *)code
                         content:(NSString *)content
{
    NSDictionary *responseData = @{CODE:code,CONTENT:content};
    return responseData;
}

-(NSDictionary *)convertToResult:(NSNumber *)code
                         content: (NSString *)content
                        operator: (NSString *)operator
{
    NSDictionary *responseData = @{CODE:code,CONTENT:content,OPERATOR:operator};
    return responseData;
}

-(NSDictionary *)convertToResult:(NSNumber *)code
                         content: (NSString *)content
                     phoneNumber: (NSString *)phoneNumber
{
    NSDictionary *responseData = @{CODE:code,CONTENT:content, PHONE_NUMBER:phoneNumber};
    return responseData;
}

-(JVUIConfig *)convertToCinfig: (NSDictionary *)configParams
{
    JVUIConfig *config = [[JVUIConfig alloc] init];
    config.autoLayout = true;
    if (debug) {
        NSLog(@"configParams:%@",configParams);
    }
    //语言
    if(configParams[APP_LANGUAGE_TYPE]){
        NSString *appLanguageType = configParams[APP_LANGUAGE_TYPE];
        JVLanguageType lt = JVLanguageSimplifiedChinese;
        if ([appLanguageType isEqualToString:@"1"]) {
            lt = JVLanguageTraditionalChinese;
        } else if ([appLanguageType isEqualToString:@"2"]) {
            lt = JVLanguageEnglish;
        }
        config.appLanguageType = lt;
    }
    
    //背景图
    if(configParams[BACK_GROUND_IMAGE]){
        config.authPageBackgroundImage = [self imageNamed:configParams[BACK_GROUND_IMAGE]];
    }
    //背景Gif图
    if(configParams[BACK_GROUND_GIF_IMAGE]){
        config.authPageGifImagePath = [[self jvbundlePath] stringByAppendingPathComponent:configParams[BACK_GROUND_GIF_IMAGE]];
    }
    //背景视频图
    if(configParams[BACK_GROUND_VIDEO]){
        if ([configParams[BACK_GROUND_VIDEO] hasPrefix:@"http"] || [configParams[BACK_GROUND_VIDEO] hasPrefix:@"https"]) {
            config.authPageVideoPath = configParams[BACK_GROUND_VIDEO];
            config.smsAuthPageVideoPath = configParams[BACK_GROUND_VIDEO];
        }else {
            config.authPageVideoPath = [[self jvbundlePath] stringByAppendingPathComponent:configParams[BACK_GROUND_VIDEO]];
            config.smsAuthPageVideoPath = [[self jvbundlePath] stringByAppendingPathComponent:configParams[BACK_GROUND_VIDEO]];
        }
    }
    //背景视频占位图
    if(configParams[BACK_GROUND_VIDEO_PLACEHOLDER_IMAGE]){
        config.authPageVideoPlaceHolderImageName = [[self jvbundlePath] stringByAppendingPathComponent:configParams[BACK_GROUND_VIDEO_PLACEHOLDER_IMAGE]];
        config.smsAuthPageVideoPlaceHolderImageName = [[self jvbundlePath] stringByAppendingPathComponent:configParams[BACK_GROUND_VIDEO_PLACEHOLDER_IMAGE]];
    }
    
    //状态栏
    if([configParams[STATUS_BAR_HIDDEN] isKindOfClass:[NSNumber class]]){
        config.prefersStatusBarHidden = [configParams[STATUS_BAR_HIDDEN] boolValue];
    }
    if(configParams[STATUS_BAR_MODE]){
        NSString *statusBarMode = configParams[STATUS_BAR_MODE];
        if([statusBarMode isEqualToString:STATUS_BAR_MODE_LIGHT]){
            config.preferredStatusBarStyle = UIStatusBarStyleLightContent;
        }else if([statusBarMode isEqualToString:STATUS_BAR_MODE_DARK]){
            if (@available(iOS 13.0, *)) {
                config.preferredStatusBarStyle = UIStatusBarStyleDarkContent;
            }
        }else{
            config.preferredStatusBarStyle = UIStatusBarStyleDefault;
        }
    }
    //导航栏
    if([configParams[NAV_HIDDEN] isKindOfClass:[NSNumber class]]){
        config.navCustom = [configParams[NAV_HIDDEN] boolValue];
    }
    if(configParams[NAV_COLOR]){
        NSNumber *color = configParams[NAV_COLOR];
        UIColor *navColor =  UIColorFromRGBValue(color.integerValue);
        config.navColor = navColor;
    }
    //导航栏标题
    NSString *navTitle = @"登录统一认证";
    if(configParams[NAV_TITLE]){
        navTitle = configParams[NAV_TITLE];
    }
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:navTitle];
    if(configParams[NAV_TITLE_SIZE]){
        CGFloat navTitleSize = [configParams[NAV_TITLE_SIZE] floatValue];
        [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:navTitleSize] range:NSMakeRange(0, navTitle.length)];
    }
    if(configParams[NAV_TITLE_COLOR]){
        NSNumber *color = configParams[NAV_TITLE_COLOR];
        UIColor *navTitleColor =  UIColorFromRGBValue(color.integerValue);
        [attrStr addAttribute:NSForegroundColorAttributeName value:navTitleColor range:NSMakeRange(0, navTitle.length)];
    }
    config.navText = attrStr;
    //导航栏返回按钮
    if([configParams[NAV_RETURN_HIDDEN] isKindOfClass:[NSNumber class]]){
        config.navReturnHidden = [configParams[NAV_RETURN_HIDDEN] boolValue];
    }
    if(configParams[NAV_RETURN_IMAGE]){
        config.navReturnImg = [self imageNamed:configParams[NAV_RETURN_IMAGE]];
    }
    
    NSNumber *navReturnBtnOffsetX = @0;
    NSNumber *navReturnBtnOffsetY = @0;
    if (configParams[NAV_RETURN_X]) {
        navReturnBtnOffsetX = configParams[NAV_RETURN_X];
    }
    if (configParams[NAV_RETURN_Y]) {
        navReturnBtnOffsetY = configParams[NAV_RETURN_Y];
    }
    config.navReturnImageEdgeInsets = UIEdgeInsetsMake([navReturnBtnOffsetY floatValue], [navReturnBtnOffsetX floatValue], 0, 0);
    
    if([configParams[NAV_TRANSPARENT] isKindOfClass:[NSNumber class]]){
        config.navTransparent = [configParams[NAV_TRANSPARENT] boolValue];
    }
    
    //logo
    if([configParams[LOGO_HIDDEN] isKindOfClass:[NSNumber class]]){
        config.logoHidden = [configParams[LOGO_HIDDEN] boolValue];
    }
    if(configParams[LOGO_IMAGE]){
        config.logoImg = [self imageNamed:configParams[LOGO_IMAGE]];
    }
    if(configParams[LOGO_X]&&configParams[LOGO_Y]&&configParams[LOGO_W]&&configParams[LOGO_H]){
        CGFloat logoX = [configParams[LOGO_X] floatValue];
        CGFloat logoY = [configParams[LOGO_Y] floatValue];
        CGFloat logoW = [configParams[LOGO_W] floatValue];
        CGFloat logoH = [configParams[LOGO_H] floatValue];
        config.logoConstraints = [self layoutConstraint:(logoX) y:logoY w:logoW h:logoH];
        config.logoHorizontalConstraints = [self layoutConstraint:(logoX) y:logoY w:logoW h:logoH];
    }
    if(configParams[LOGO_CONSTRAINTS]){
        NSArray *logoConstraints= [RCTJVerificationModule configConstraintWithAttributes:configParams[LOGO_CONSTRAINTS]];
        config.logoConstraints = logoConstraints;
    }
    //number
    if(configParams[NUMBER_SIZE]){
        CGFloat numberSize = [configParams[NUMBER_SIZE] floatValue];
        config.numberFont = [UIFont systemFontOfSize:numberSize];
    }
    if(configParams[NUMBER_COLOR]){
        NSNumber *color = configParams[NUMBER_COLOR];
        UIColor *navTitleColor =  UIColorFromRGBValue(color.integerValue);
        config.numberColor = navTitleColor;
    }
    if(configParams[NUMBER_X]&&configParams[NUMBER_Y]&&configParams[NUMBER_W]&&configParams[NUMBER_H]){
        CGFloat numberX = [configParams[NUMBER_X] floatValue];
        CGFloat numberY = [configParams[NUMBER_Y] floatValue];
        CGFloat numberW = [configParams[NUMBER_W] floatValue];
        CGFloat numberH = [configParams[NUMBER_H] floatValue];
        config.numberConstraints = [self layoutConstraint:(numberX) y:numberY w:numberW h:numberH];
        config.numberHorizontalConstraints = [self layoutConstraint:(numberX) y:numberY w:numberW h:numberH];
    }
    if(configParams[NUMBER_CONSTRAINTS]){
        NSArray *numberConstraints= [RCTJVerificationModule configConstraintWithAttributes:configParams[NUMBER_CONSTRAINTS]];
        config.numberConstraints = numberConstraints;
        config.numberHorizontalConstraints = numberConstraints;
    }
    
    //slogan
    if([configParams[SLOGAN_HIDDEN] isKindOfClass:[NSNumber class]]){
        //todo
    }
    if(configParams[SLOGAN_TEXT_SIZE]){
        CGFloat sloganTextSize = [configParams[SLOGAN_TEXT_SIZE] floatValue];
        config.sloganFont = [UIFont systemFontOfSize:sloganTextSize];
    }
    if(configParams[SLOGAN_TEXT_COLOR]){
        NSNumber *color = configParams[SLOGAN_TEXT_COLOR];
        UIColor *sloganTextColor =  UIColorFromRGBValue(color.integerValue);
        config.sloganTextColor = sloganTextColor;
    }
    if(configParams[SLOGAN_X]&&configParams[SLOGAN_Y]&&configParams[SLOGAN_W]&&configParams[SLOGAN_H]){
        CGFloat sloganX = [configParams[SLOGAN_X] floatValue];
        CGFloat sloganY = [configParams[SLOGAN_Y] floatValue];
        CGFloat sloganW = [configParams[SLOGAN_W] floatValue];
        CGFloat sloganH = [configParams[SLOGAN_H] floatValue];
        config.sloganConstraints = [self layoutConstraint:(sloganX) y:sloganY w:sloganW h:sloganH];
        config.sloganHorizontalConstraints = [self layoutConstraint:(sloganX) y:sloganY w:sloganW h:sloganH];

    }
    if(configParams[SLOGAN_CONSTRAINTS]){
        NSArray *sloganConstraints= [RCTJVerificationModule configConstraintWithAttributes:configParams[SLOGAN_CONSTRAINTS]];
        config.sloganConstraints = sloganConstraints;
        config.sloganHorizontalConstraints = sloganConstraints;

    }
    //登录按钮
    if(configParams[LOGIN_BTN_TEXT]){
        config.logBtnText= configParams[LOGIN_BTN_TEXT];
    }
    if(configParams[LOGIN_BTN_TEXT_SIZE]){
        CGFloat loginBtnTextSize = [configParams[LOGIN_BTN_TEXT_SIZE] floatValue];
        config.logBtnFont = [UIFont systemFontOfSize:loginBtnTextSize];
    }
    if(configParams[LOGIN_BTN_TEXT_COLOR]){
        NSNumber *color = configParams[LOGIN_BTN_TEXT_COLOR];
        UIColor *loginBtnTextColor =  UIColorFromRGBValue(color.integerValue);
        config.logBtnTextColor = loginBtnTextColor;
    }
    if(configParams[LOGIN_BTN_NORMAL_IMAGE] && configParams[LOGIN_BTN_DISABLED_IMAGE] && configParams[LOGIN_BTN_SELECTED_IMAGE]){
        UIImage *loginBtnNormalImage = [self imageNamed:configParams[LOGIN_BTN_NORMAL_IMAGE]];
        UIImage *loginBtnDisabledImage = [self imageNamed:configParams[LOGIN_BTN_DISABLED_IMAGE]];
        UIImage *loginBtnSelectedImage = [self imageNamed:configParams[LOGIN_BTN_SELECTED_IMAGE]];
        config.logBtnImgs = @[loginBtnNormalImage,loginBtnDisabledImage,loginBtnSelectedImage];
    }
    if(configParams[LOGIN_BTN_X]&&configParams[LOGIN_BTN_Y]&&configParams[LOGIN_BTN_W]&&configParams[LOGIN_BTN_H]){
        CGFloat loginBtnX = [configParams[LOGIN_BTN_X] floatValue];
        CGFloat loginBtnY = [configParams[LOGIN_BTN_Y] floatValue];
        CGFloat loginBtnW = [configParams[LOGIN_BTN_W] floatValue];
        CGFloat loginBtnH = [configParams[LOGIN_BTN_H] floatValue];
        config.logBtnConstraints = [self layoutConstraint:(loginBtnX) y:loginBtnY w:loginBtnW h:loginBtnH];
        config.logBtnHorizontalConstraints = [self layoutConstraint:(loginBtnX) y:loginBtnY w:loginBtnW h:loginBtnH];
    }
    if(configParams[LOGIN_BTN_CONSTRAINTS]){
        NSArray *logBtnConstraints= [RCTJVerificationModule configConstraintWithAttributes:configParams[LOGIN_BTN_CONSTRAINTS]];
        config.logBtnConstraints = logBtnConstraints;
        config.logBtnHorizontalConstraints = logBtnConstraints;
    }
    
    //隐私
    if(configParams[PRIVACY_ONE]){
        NSArray *parivacyOne = configParams[PRIVACY_ONE];
        config.appPrivacyOne = parivacyOne;
    }
    if(configParams[PRIVACY_TWO]){
        NSArray *parivacyTwo = configParams[PRIVACY_TWO];
        config.appPrivacyTwo = parivacyTwo;
    }
    
    if([configParams[OPEN_PRIVACY_IN_BROWSER] isKindOfClass:[NSNumber class]]){
        BOOL openPrivacyInBrowser = [configParams[OPEN_PRIVACY_IN_BROWSER] boolValue];
        config.openPrivacyInBrowser = openPrivacyInBrowser;
        config.smsOpenPrivacyInBrowser = openPrivacyInBrowser;
    }
    
    
    //2.7.3新增 自定义协议组合
    if([[configParams allKeys] containsObject:PRIVACY_Arr] && configParams[PRIVACY_Arr]){
        NSArray *parivacyArr = configParams[PRIVACY_Arr];
        NSMutableArray *appPrivacyss = [NSMutableArray array];
        //设置头 如勾选即同意
        if([[configParams allKeys] containsObject:PRIVACY_TEXT] && configParams[PRIVACY_TEXT]){
            NSArray *privacyTexts = configParams[PRIVACY_TEXT];
            if ([privacyTexts count]>0)
                [appPrivacyss addObject:privacyTexts[0]];
        }
        //自定义协议部分
        for (NSInteger i = 0; i<parivacyArr.count; i++) {
            NSMutableArray *item = [NSMutableArray array];
            NSDictionary *obj = [parivacyArr objectAtIndex:i];
            //加入协议之间的分隔符
            if ([[obj allKeys] containsObject:@"separator"] ) {
                [item addObject:[obj objectForKey:@"separator"]];
            }
            //加入name
            if ([[obj allKeys] containsObject:@"name"] ) {
                [item addObject:[obj objectForKey:@"name"]];
            }
            //加入url
            if ([[obj allKeys] containsObject:@"url"] ) {
                [item addObject:[obj objectForKey:@"url"]];
            }
            //加入协议详细页面的导航栏文字 可以是NSAttributedString类型 自定义  这里是直接拿name进行展示
            if ([[obj allKeys] containsObject:@"name"] ) {
                [item addObject:[obj objectForKey:@"name"]];
            }
            //添加一条协议appPrivacyss中
            [appPrivacyss addObject:item];
        }
        //设置尾
        if([[configParams allKeys] containsObject:PRIVACY_TEXT] && configParams[PRIVACY_TEXT]){
            NSArray *privacyTexts = configParams[PRIVACY_TEXT];
            if ([privacyTexts count]>1)
                [appPrivacyss addObject:privacyTexts[1]];
        }
        //设置
        if (appPrivacyss.count>1) {
            config.appPrivacys = appPrivacyss;
        }
    }
    
    if(configParams[PRIVACY_COLOR]){
        NSNumber *privacyNameColorNum = configParams[PRIVACY_COLOR][0];
        NSNumber *privacyUrlColorNum = configParams[PRIVACY_COLOR][1];
        UIColor *parivacyNameColor =  UIColorFromRGBValue(privacyNameColorNum.integerValue);
        UIColor *parivacyUrlColor =  UIColorFromRGBValue(privacyUrlColorNum.integerValue);
        config.appPrivacyColor = @[parivacyNameColor,parivacyUrlColor];
    }
    if(configParams[PRIVACY_TEXT]){
        NSArray *privacyText = configParams[PRIVACY_TEXT];
        config.privacyComponents = privacyText;
    }
    if(configParams[PRIVACY_TEXT_SIZE]){
        config.privacyTextFontSize = [configParams[PRIVACY_TEXT_SIZE] floatValue];
        config.smsPrivacyTextFontSize = [configParams[PRIVACY_TEXT_SIZE] floatValue];
    }
    if(configParams[PRIVACY_TEXT_GRAVITY_MODE]){
        NSString *privacyTextGravityMode = configParams[PRIVACY_TEXT_GRAVITY_MODE];
        if([privacyTextGravityMode isEqualToString:PRIVACY_TEXT_GRAVITY_LEFT]){
            config.privacyTextAlignment = NSTextAlignmentLeft;
        }else if([privacyTextGravityMode isEqualToString:PRIVACY_TEXT_GRAVITY_CENTER]){
            config.privacyTextAlignment = NSTextAlignmentCenter;
        }else{
            config.privacyTextAlignment = NSTextAlignmentLeft;
        }
    }
    if([configParams[PRIVACY_BOOK_SYMBOL_ENABLE] isKindOfClass:[NSNumber class]]){
        config.privacyShowBookSymbol = [configParams[PRIVACY_BOOK_SYMBOL_ENABLE] boolValue];
    }
    if(configParams[PRIVACY_X]&&configParams[PRIVACY_Y]&&configParams[PRIVACY_W]&&configParams[PRIVACY_H]){
        CGFloat privacyX = [configParams[PRIVACY_X] floatValue];
        CGFloat privacyY = -[configParams[PRIVACY_Y] floatValue];
        CGFloat privacyW = [configParams[PRIVACY_W] floatValue];
        CGFloat privacyH = [configParams[PRIVACY_H] floatValue];
        JVLayoutConstraint *constraintX = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemSuper attribute:NSLayoutAttributeLeft multiplier:1 constant:privacyX];
        JVLayoutConstraint *constraintY = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemSuper attribute:NSLayoutAttributeBottom multiplier:1 constant:privacyY];
        JVLayoutConstraint *constraintW = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemNone attribute:NSLayoutAttributeWidth multiplier:1 constant:privacyW];
        JVLayoutConstraint *constraintH = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemNone attribute:NSLayoutAttributeHeight multiplier:1 constant:privacyH];
        config.privacyConstraints = @[constraintX,constraintY,constraintW,constraintH];
    }
    
    if(configParams[PRIVACY_CONSTRAINTS]){
        NSArray *privacyConstraints= [RCTJVerificationModule configConstraintWithAttributes:configParams[PRIVACY_CONSTRAINTS]];
        config.privacyConstraints = privacyConstraints;
        config.privacyHorizontalConstraints = privacyConstraints;
    }
    //隐私条款垂直对齐方式
    if (configParams[TEXT_VER_ALIGNMENT]) {
        config.textVerAlignment = [configParams[TEXT_VER_ALIGNMENT] intValue];
    }else{
        config.textVerAlignment = JVVerAlignmentMiddle;
    }
    
    //checkbox
    if([configParams[PRIVACY_CHECKBOX_HIDDEN] isKindOfClass:[NSNumber class]]){
        config.checkViewHidden = [configParams[PRIVACY_CHECKBOX_HIDDEN] boolValue];
        config.smsCheckViewHidden = [configParams[PRIVACY_CHECKBOX_HIDDEN] boolValue];
    }
    if([configParams[PRIVACY_CHECK_ENABLE] isKindOfClass:[NSNumber class]]){
        config.privacyState = [configParams[PRIVACY_CHECK_ENABLE] boolValue];
    }
    if(configParams[PRIVACY_CHECKED_IMAGE]){
        config.checkedImg = [self imageNamed:configParams[PRIVACY_CHECKED_IMAGE]];
    }
    if(configParams[PRIVACY_UNCHECKED_IMAGE]){
        config.uncheckedImg = [self imageNamed:configParams[PRIVACY_UNCHECKED_IMAGE]];
    }
    if ([configParams[UNCHECK_BOX_CALLBACK] isKindOfClass:[NSNumber class]]) {
        BOOL isNeedCallBack = [configParams[UNCHECK_BOX_CALLBACK] boolValue];
        if (isNeedCallBack) {
              __weak __typeof(self)weakSelf = self;
            config.customPrivacyAlertViewBlock = ^(UIViewController *vc , NSArray *appPrivacys,void(^loginAction)(void)){
                [weakSelf sendUncheckBoxEvent];
            };
        }
    }
    
    
    CGFloat privacyCheckboxW = config.uncheckedImg.size.width;
    CGFloat privacyCheckboxH = config.uncheckedImg.size.height;
    JVLayoutConstraint *constraintX = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemPrivacy attribute:NSLayoutAttributeLeft multiplier:1 constant:-15];
    JVLayoutConstraint *constraintY = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemPrivacy attribute:NSLayoutAttributeTop multiplier:1 constant:2];
    JVLayoutConstraint *constraintW = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemNone attribute:NSLayoutAttributeWidth multiplier:1 constant:privacyCheckboxW];
    JVLayoutConstraint *constraintH = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemNone attribute:NSLayoutAttributeHeight multiplier:1 constant:privacyCheckboxH];
    config.checkViewConstraints = @[constraintX,constraintY,constraintW,constraintH];
    config.checkViewHorizontalConstraints = @[constraintX,constraintY,constraintW,constraintH];

    if(configParams[CHECK_VIEW_CONSTRAINTS]){
        NSArray *checkViewConstraints= [RCTJVerificationModule configConstraintWithAttributes:configParams[CHECK_VIEW_CONSTRAINTS]];
        config.checkViewConstraints = checkViewConstraints;
    }
    
    //二次弹窗
    if(configParams[IS_ALERT_PRIVACYVC]){
        config.isAlertPrivacyVC = [configParams[IS_ALERT_PRIVACYVC] boolValue];
        config.isSmsAlertPrivacyVC = [configParams[IS_ALERT_PRIVACYVC] boolValue];
        config.agreementAlertViewShowWindow = YES;
        config.smsAgreementAlertViewShowWindow = YES;
    }
    
    NSDictionary *agreementAlertViewUIFrames = configParams[AGREEMENT_ALERT_VIEW_UI_FRAMES];
    config.resetAgreementAlertViewFrameBlock = ^(NSValue * _Nullable __autoreleasing * _Nullable superViewFrame, NSValue * _Nullable __autoreleasing * _Nullable alertViewFrame, NSValue * _Nullable __autoreleasing * _Nullable titleFrame, NSValue * _Nullable __autoreleasing * _Nullable contentFrame, NSValue * _Nullable __autoreleasing * _Nullable buttonFrame) {
        NSArray *superView = [agreementAlertViewUIFrames valueForKey:@"superViewFrame"];
        if (superView && superView.count >= 4) {
            *superViewFrame = [NSValue valueWithCGRect:CGRectMake([superView[0] intValue], [superView[1] intValue], [superView[2] intValue], [superView[3] intValue])];
        }
        NSArray *alertView = [agreementAlertViewUIFrames valueForKey:@"alertViewFrame"];
        if (alertView && alertView.count >= 4) {
            *alertViewFrame = [NSValue valueWithCGRect:CGRectMake([alertView[0] intValue], [alertView[1] intValue], [alertView[2] intValue], [alertView[3] intValue])];
        }
        NSArray *title = [agreementAlertViewUIFrames valueForKey:@"titleFrame"];
        if (title && title.count >= 4) {
            *titleFrame = [NSValue valueWithCGRect:CGRectMake([title[0] intValue], [title[1] intValue], [title[2] intValue], [title[3] intValue])];
        }
        NSArray *content = [agreementAlertViewUIFrames valueForKey:@"contentFrame"];
        if (content && content.count >= 4) {
            *contentFrame = [NSValue valueWithCGRect:CGRectMake([content[0] intValue], [content[1] intValue], [content[2] intValue], [content[3] intValue])];
        }
        NSArray *button = [agreementAlertViewUIFrames valueForKey:@"buttonFrame"];
        if (button && button.count >= 4) {
            *buttonFrame = [NSValue valueWithCGRect:CGRectMake([button[0] intValue], [button[1] intValue], [button[2] intValue], [button[3] intValue])];
        }
    };
    config.smsResetAgreementAlertViewFrameBlock = ^(NSValue * _Nullable __autoreleasing * _Nullable superViewFrame, NSValue * _Nullable __autoreleasing * _Nullable alertViewFrame, NSValue * _Nullable __autoreleasing * _Nullable titleFrame, NSValue * _Nullable __autoreleasing * _Nullable contentFrame, NSValue * _Nullable __autoreleasing * _Nullable buttonFrame) {
        NSArray *superView = [agreementAlertViewUIFrames valueForKey:@"superViewFrame"];
        if (superView && superView.count >= 4) {
            *superViewFrame = [NSValue valueWithCGRect:CGRectMake([superView[0] intValue], [superView[1] intValue], [superView[2] intValue], [superView[3] intValue])];
        }
        NSArray *alertView = [agreementAlertViewUIFrames valueForKey:@"alertViewFrame"];
        if (alertView && alertView.count >= 4) {
            *alertViewFrame = [NSValue valueWithCGRect:CGRectMake([alertView[0] intValue], [alertView[1] intValue], [alertView[2] intValue], [alertView[3] intValue])];
        }
        NSArray *title = [agreementAlertViewUIFrames valueForKey:@"titleFrame"];
        if (title && title.count >= 4) {
            *titleFrame = [NSValue valueWithCGRect:CGRectMake([title[0] intValue], [title[1] intValue], [title[2] intValue], [title[3] intValue])];
        }
        NSArray *content = [agreementAlertViewUIFrames valueForKey:@"contentFrame"];
        if (content && content.count >= 4) {
            *contentFrame = [NSValue valueWithCGRect:CGRectMake([content[0] intValue], [content[1] intValue], [content[2] intValue], [content[3] intValue])];
        }
        NSArray *button = [agreementAlertViewUIFrames valueForKey:@"buttonFrame"];
        if (button && button.count >= 4) {
            *buttonFrame = [NSValue valueWithCGRect:CGRectMake([button[0] intValue], [button[1] intValue], [button[2] intValue], [button[3] intValue])];
        }
    };
    
    //协议
    if(configParams[PRIVACY_WEB_NAV_COLOR]){
        NSNumber *color = configParams[PRIVACY_WEB_NAV_COLOR];
        UIColor *privacyWebNavColor =  UIColorFromRGBValue(color.integerValue);
        config.agreementNavBackgroundColor = privacyWebNavColor;
    }
    NSString *privacyWebNavTitle = @"登录";
    if(configParams[PRIVACY_WEB_NAV_TITLE]){
        privacyWebNavTitle = configParams[PRIVACY_WEB_NAV_TITLE];
    }
    UIFont *privacyWebNavTitleSize = [UIFont systemFontOfSize:12];
    if(configParams[PRIVACY_WEB_NAV_TITLE_SIZE]){
        CGFloat titleSize = [configParams[PRIVACY_WEB_NAV_TITLE_SIZE] floatValue];
        privacyWebNavTitleSize = [UIFont systemFontOfSize:titleSize];
    }
    UIColor *privacyWebNavTitleColor = [UIColor blackColor];
    if(configParams[PRIVACY_WEB_NAV_TITLE_COLOR]){
        NSNumber *color = configParams[PRIVACY_WEB_NAV_TITLE_COLOR];
        privacyWebNavTitleColor =  UIColorFromRGBValue(color.integerValue);
    }
    config.agreementNavText = [[NSAttributedString alloc]initWithString:privacyWebNavTitle attributes:@{NSForegroundColorAttributeName:privacyWebNavTitleColor, NSFontAttributeName:privacyWebNavTitleSize}];
    if(configParams[PRIVACY_WEB_NAV_RETURN_IMAGE]){
        config.agreementNavReturnImage = [self imageNamed:configParams[PRIVACY_WEB_NAV_RETURN_IMAGE]];
    }
    //2.7.5新增隐私协议导航栏是否隐藏
    if([[configParams allKeys] containsObject:PRIVACY_WEB_NAV_NAVCUSTOM] && configParams[PRIVACY_WEB_NAV_NAVCUSTOM]){
        config.privacysNavCustom = [self imageNamed:configParams[PRIVACY_WEB_NAV_NAVCUSTOM]];
    }
    // 弹窗
    if([configParams[SHOW_WINDOW] isKindOfClass:[NSNumber class]]){
        config.showWindow = [configParams[SHOW_WINDOW] boolValue];
        config.smsShowWindow = [configParams[SHOW_WINDOW] boolValue];
    }
    if(configParams[WINDOW_BACKGROUND_IMAGE]){
        config.windowBackgroundImage = [self imageNamed:configParams[WINDOW_BACKGROUND_IMAGE]];
        config.smsWindowBackgroundImage = [self imageNamed:configParams[WINDOW_BACKGROUND_IMAGE]];
    }
    if(configParams[WINDOW_BACKGROUND_ALPHA]){
        CGFloat backgroundAlpha = [configParams[WINDOW_BACKGROUND_ALPHA] floatValue];
        config.windowBackgroundAlpha = backgroundAlpha;
        config.smsWindowBackgroundAlpha = backgroundAlpha;
    }
    
    if(configParams[WINDOW_CORNER_RADIUS]){
        CGFloat cornerRadius = [configParams[WINDOW_CORNER_RADIUS] floatValue];
        config.windowCornerRadius = cornerRadius;
        config.smsWindowCornerRadius = cornerRadius;
    }
    if(configParams[WINDOW_CONSTRAINTS]){
        NSArray *windowConstraints= [RCTJVerificationModule configConstraintWithAttributes:configParams[WINDOW_CONSTRAINTS]];
        config.windowConstraints = windowConstraints;
        config.windowHorizontalConstraints = windowConstraints;
        config.smsWindowConstraints = windowConstraints;
        config.smsWindowHorizontalConstraints = windowConstraints;
    }
    if(configParams[WINDOW_HORIZONTAL_CONSTRAINTS]){
        NSArray *windowHorizontalConstraints= [RCTJVerificationModule configConstraintWithAttributes:configParams[WINDOW_HORIZONTAL_CONSTRAINTS]];
        config.windowHorizontalConstraints = windowHorizontalConstraints;
    }
    if (configParams[WINDOW_CLOSE_BTN_IMGS]){
        NSArray *imageNames = configParams[WINDOW_CLOSE_BTN_IMGS];
        if ([imageNames isKindOfClass:[NSArray class]]) {
            NSMutableArray *images = [NSMutableArray arrayWithCapacity:3];
            for (int i = 0; i< imageNames.count; i++) {
                NSString *bundlePath = [[NSBundle mainBundle] pathForResource:JVERIFICATION_RESOURCE ofType:@"bundle"];
                UIImage *closeImage = [UIImage imageWithContentsOfFile:[bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",imageNames[i]]]];
                if (closeImage) {
                    [images addObject:closeImage];
                }
                config.windowCloseBtnImgs = images;
            }
        }
    }
    if(configParams[WINDOW_CLOSE_BTN_CONSTRAINTS]){
        NSArray *windowCloseBtnConstraints= [RCTJVerificationModule configConstraintWithAttributes:configParams[WINDOW_CLOSE_BTN_CONSTRAINTS]];
        config.windowCloseBtnConstraints = windowCloseBtnConstraints;
    }
    if(configParams[WINDOW_CLOSE_BTN_HORIZONTAL_CONSTRAINTS]){
        NSArray *windowCloseBtnHorizontalConstraints= [RCTJVerificationModule configConstraintWithAttributes:configParams[WINDOW_CLOSE_BTN_HORIZONTAL_CONSTRAINTS]];
        config.windowCloseBtnHorizontalConstraints = windowCloseBtnHorizontalConstraints;
    }
    
    if(configParams[LOADING_CONSTRAINTS]){
        NSArray *loadingConstraints= [RCTJVerificationModule configConstraintWithAttributes:configParams[LOADING_CONSTRAINTS]];
        config.loadingConstraints = loadingConstraints;
        config.loadingHorizontalConstraints = loadingConstraints;
    }
    
    /************** 协议二次弹窗样式***************/
    if (configParams[AGREEMENT_ALERT_VIEW_CORNER_RADIUS]) {
        config.windowCornerRadius = [configParams[AGREEMENT_ALERT_VIEW_CORNER_RADIUS] floatValue];
    }
    
    if (configParams[AGREEMENT_ALERT_VIEW_TITLE_TEXT]) {
        config.agreementAlertViewTitleText = configParams[AGREEMENT_ALERT_VIEW_TITLE_TEXT];
        config.smsAgreementAlertViewTitleText = configParams[AGREEMENT_ALERT_VIEW_TITLE_TEXT];
    }
    
    if (configParams[AGREEMENT_ALERT_VIEW_BACKGROUND_COLOR]) {
        config.agreementAlertViewBackgroundColor = UIColorFromRGBValue([configParams[AGREEMENT_ALERT_VIEW_BACKGROUND_COLOR] integerValue]);
        config.smsAgreementAlertViewBackgroundColor = UIColorFromRGBValue([configParams[AGREEMENT_ALERT_VIEW_BACKGROUND_COLOR] integerValue]);
    }

    if (configParams[AGREEMENT_ALERT_VIEW_BACKGROUND_IMG_PATH]) {
        config.agreementAlertViewBackgroundImage = [self imageNamed:configParams[AGREEMENT_ALERT_VIEW_BACKGROUND_IMG_PATH]];
        config.smsAgreementAlertViewBackgroundImage = [self imageNamed:configParams[AGREEMENT_ALERT_VIEW_BACKGROUND_IMG_PATH]];
    }
    
    if (configParams[AGREEMENT_ALERT_VIEW_TITLE_TEXT_SIZE]) {
        config.agreementAlertViewTitleTexFont = [UIFont systemFontOfSize: [configParams[AGREEMENT_ALERT_VIEW_TITLE_TEXT_SIZE] integerValue]];
        config.smsAgreementAlertViewTitleTexFont = [UIFont systemFontOfSize: [configParams[AGREEMENT_ALERT_VIEW_TITLE_TEXT_SIZE] integerValue]];
    }
    
    if (configParams[AGREEMENT_ALERT_VIEW_TITLE_TEXT_COLOR]) {
        config.agreementAlertViewTitleTextColor = UIColorFromRGBValue([configParams[AGREEMENT_ALERT_VIEW_TITLE_TEXT_COLOR] integerValue]);
        config.smsAgreementAlertViewTitleTextColor = UIColorFromRGBValue([configParams[AGREEMENT_ALERT_VIEW_TITLE_TEXT_COLOR] integerValue]);
    }

    if(configParams[AGREEMENT_ALERT_VIEW_CONTENT_TEXT_ALIGNMENT]){
        NSString *contentAlignment = configParams[AGREEMENT_ALERT_VIEW_CONTENT_TEXT_ALIGNMENT];
        if([contentAlignment isEqualToString:PRIVACY_TEXT_GRAVITY_LEFT]){
            config.agreementAlertViewContentTextAlignment = NSTextAlignmentLeft;
            config.smsAgreementAlertViewContentTextAlignment = NSTextAlignmentLeft;
        }else if([contentAlignment isEqualToString:PRIVACY_TEXT_GRAVITY_CENTER]){
            config.agreementAlertViewContentTextAlignment = NSTextAlignmentCenter;
            config.smsAgreementAlertViewContentTextAlignment = NSTextAlignmentCenter;

        }else{
            config.agreementAlertViewContentTextAlignment = NSTextAlignmentLeft;
            config.smsAgreementAlertViewContentTextAlignment = NSTextAlignmentLeft;
        }
    }
    
    if (configParams[AGREEMENT_ALERT_VIEW_CONTENT_TEXT_FONT_SIZE]) {
        config.agreementAlertViewContentTextFontSize = [configParams[AGREEMENT_ALERT_VIEW_CONTENT_TEXT_FONT_SIZE] integerValue];
        config.smsAgreementAlertViewContentTextFontSize = [configParams[AGREEMENT_ALERT_VIEW_CONTENT_TEXT_FONT_SIZE] integerValue];
    }
 
    if (configParams[AGREEMENT_ALERT_VIEW_LOG_BTN_TEXT]) {
        config.agreementAlertViewLogBtnText = configParams[AGREEMENT_ALERT_VIEW_LOG_BTN_TEXT];
        config.smsAgreementAlertViewLogBtnText = configParams[AGREEMENT_ALERT_VIEW_LOG_BTN_TEXT];

    }
    
    if (configParams[AGREEMENT_ALERT_VIEW_LOG_BTN_TEXT_FONT_SIZE]) {
        config.agreementAlertViewLogBtnTextFontSize = [configParams[AGREEMENT_ALERT_VIEW_LOG_BTN_TEXT_FONT_SIZE] integerValue];
        config.smsAgreementAlertViewLogBtnTextFontSize = [configParams[AGREEMENT_ALERT_VIEW_LOG_BTN_TEXT_FONT_SIZE] integerValue];
    }
    
    if (configParams[AGREEMENT_ALERT_VIEW_LOGIN_BTN_NORMAL_IMAGE_PATH] && configParams[AGREEMENT_ALERT_VIEW_LOGIN_BTN_PRESSED_IMAGE_PATH] && configParams[AGREEMENT_ALERT_VIEW_LOGIN_BTN_UNABLE_IMAGE_PATH]) {

        UIImage *agreementAlertViewLoginBtnNormalImage = [self imageNamed:configParams[AGREEMENT_ALERT_VIEW_LOGIN_BTN_NORMAL_IMAGE_PATH]];
        UIImage *agreementAlertViewLoginBtnPressedImage = [self imageNamed:configParams[AGREEMENT_ALERT_VIEW_LOGIN_BTN_PRESSED_IMAGE_PATH]];
        UIImage *agreementAlertViewLoginBtnUnableImage = [self imageNamed:configParams[AGREEMENT_ALERT_VIEW_LOGIN_BTN_UNABLE_IMAGE_PATH]];
        if(agreementAlertViewLoginBtnNormalImage && agreementAlertViewLoginBtnPressedImage && agreementAlertViewLoginBtnUnableImage){
            NSArray * agreementAlertViewLogBtnImgs =[[NSArray alloc]initWithObjects:agreementAlertViewLoginBtnNormalImage,agreementAlertViewLoginBtnPressedImage,agreementAlertViewLoginBtnUnableImage,nil];
                config.agreementAlertViewLogBtnImgs = agreementAlertViewLogBtnImgs;
                config.smsAgreementAlertViewLogBtnImgs = agreementAlertViewLogBtnImgs;
        }
    }
    
    if (configParams[AGREEMENT_ALERT_VIEW_LOG_BTN_TEXT_COLOR]) {
        config.agreementAlertViewLogBtnTextColor = UIColorFromRGBValue([configParams[AGREEMENT_ALERT_VIEW_LOG_BTN_TEXT_COLOR] integerValue]);
        config.smsAgreementAlertViewLogBtnTextColor = UIColorFromRGBValue([configParams[AGREEMENT_ALERT_VIEW_LOG_BTN_TEXT_COLOR] integerValue]);
    }
    
    NSDictionary *smsUIConfig = configParams[SMS_UI_CONFIG];
    if (smsUIConfig && [smsUIConfig isKindOfClass:[NSDictionary class]]) {
        [self setCustomSmsUIConfig:config smsUIConfigArguments:smsUIConfig config:configParams];
    }

    return config;
}


- (void)setCustomSmsUIConfig:(JVUIConfig *)uiConfig smsUIConfigArguments:(NSDictionary *)smsUIConfig config:(NSDictionary *)config{
    
    NSString *smsAuthPageBackgroundImagePath = smsUIConfig[SMS_AUTH_PAGE_BACKGROUND_IMAGE_PATH];
    if (smsAuthPageBackgroundImagePath) {
        uiConfig.smsAuthPageBackgroundImage = [self imageNamed:smsAuthPageBackgroundImagePath];
    }
    
    NSString *smsNavText =  smsUIConfig[SMS_NAV_TEXT];
    NSNumber *smsNavTextSize = smsUIConfig[SMS_NAV_TEXT_SIZE];
    NSNumber *smsNavTextColor = smsUIConfig[SMS_NAV_TEXT_COLOR];
    NSNumber *smsNavTextBold = smsUIConfig[SMS_NAV_TEXT_BOLD];
    NSMutableDictionary *smsNavTextAttris = [NSMutableDictionary dictionary];
    if (smsNavTextColor) {
        [smsNavTextAttris setValue:UIColorFromRGBValue([smsNavTextColor integerValue]) forKey:NSForegroundColorAttributeName];
    }
    if (smsNavTextSize) {
        if (smsNavTextBold) {
            [smsNavTextAttris setValue:[UIFont boldSystemFontOfSize:[smsNavTextSize floatValue]] forKey:NSFontAttributeName];
        }else {
            [smsNavTextAttris setValue:[UIFont systemFontOfSize:[smsNavTextSize floatValue]] forKey:NSFontAttributeName];
        }
       
    }
    if (smsNavText) {
        uiConfig.smsNavText = [[NSAttributedString alloc]initWithString:smsNavText attributes:nil];;
    }
    
    // logo
    NSNumber *smsLogoWidth = smsUIConfig[SMS_LOGO_WIDTH];
    NSNumber *smsLogoHeight = smsUIConfig[SMS_LOGO_HEIGHT];
    NSNumber *smsLogoOffsetX = smsUIConfig[SMS_LOGO_OFFSET_X];
    NSNumber *smsLogoOffsetY = smsUIConfig[SMS_LOGO_OFFSET_Y];
    NSNumber *smsLogoOffsetBottomY = smsUIConfig[SMS_LOGO_OFFSET_BOTTOM_Y];
    NSNumber *isSmsLogoHidden = smsUIConfig[IS_SMS_LOGO_HIDDEN];
    NSString *smsLogoResName = smsUIConfig[SMS_LOGO_RES_NAME];
    if (isSmsLogoHidden) {
        uiConfig.smsLogoHidden = [isSmsLogoHidden boolValue];
    }
    if(smsLogoResName){
        uiConfig.smsLogoImg  = [self imageNamed:smsLogoResName];
    }
    
    NSMutableArray *smsLogoAttris = [NSMutableArray array];
    if (smsLogoWidth){
        JVLayoutConstraint *sms_logo_cons_w = JVLayoutWidth([smsLogoWidth floatValue]);
        [smsLogoAttris addObject:sms_logo_cons_w];
    }
    if (smsLogoHeight) {
        JVLayoutConstraint *sms_logo_cons_h = JVLayoutHeight([smsLogoHeight floatValue]);
        [smsLogoAttris addObject:sms_logo_cons_h];
    }
    if (smsLogoOffsetX) {
        JVLayoutConstraint *sms_logo_cons_x = JVLayoutLeft([smsLogoOffsetX floatValue], JVLayoutItemSuper, NSLayoutAttributeLeft);
        [smsLogoAttris addObject:sms_logo_cons_x];
    }
    if (smsLogoOffsetY) {
        JVLayoutConstraint *sms_logo_cons_y = JVLayoutTop([smsLogoOffsetY floatValue],JVLayoutItemSuper,NSLayoutAttributeTop);
        [smsLogoAttris addObject:sms_logo_cons_y];
    }
    if (smsLogoOffsetBottomY) {
        JVLayoutConstraint *sms_logo_cons_b = JVLayoutBottom([smsLogoOffsetBottomY floatValue], JVLayoutItemSuper, NSLayoutAttributeBottom);
        [smsLogoAttris addObject:sms_logo_cons_b];
    }
  
    uiConfig.smsLogoConstraints = smsLogoAttris;
    uiConfig.smsLogoHorizontalConstraints = uiConfig.smsLogoConstraints;
    
    // slogan
    NSNumber *smsSloganTextSize = smsUIConfig[SMS_SLOGAN_TEXT_SIZE];
    NSNumber *smsSloganTextColor = smsUIConfig[SMS_SLOGAN_TEXT_COLOR];
    NSNumber *smsSloganOffsetX = smsUIConfig[SMS_SLOGAN_OFFSET_X];
    NSNumber *smsSloganOffsetY = smsUIConfig[SMS_SLOGAN_OFFSET_Y];
    NSNumber *smsSloganOffsetBottomY = smsUIConfig[SMS_SLOGAN_OFFSET_BOTTOM_Y];
    NSNumber *smsSloganHeight = smsUIConfig[SMS_SLOGAN_HEIGHT];
    NSNumber *smsSloganWidth = smsUIConfig[SMS_SLOGAN_WIDTH];
    if (smsSloganTextSize) {
        uiConfig.smsSloganFont = [UIFont systemFontOfSize:[smsSloganTextSize floatValue]];
    }
    if (smsSloganTextColor) {
        uiConfig.smsSloganTextColor = UIColorFromRGBValue([smsSloganTextColor integerValue]);
    }
    NSMutableArray *smsSloganAttris = [NSMutableArray array];
    if (smsSloganOffsetX) {
        JVLayoutConstraint *sms_slogan_cons_x = JVLayoutLeft([smsSloganOffsetX floatValue], JVLayoutItemSuper, NSLayoutAttributeLeft);
        [smsSloganAttris addObject:sms_slogan_cons_x];
    }
    if (smsSloganOffsetY) {
        JVLayoutConstraint *sms_slogan_cons_y = JVLayoutTop([smsSloganOffsetY floatValue],JVLayoutItemSuper,NSLayoutAttributeTop);
        [smsSloganAttris addObject:sms_slogan_cons_y];
    }
    if (smsSloganOffsetBottomY) {
        JVLayoutConstraint *sms_slogan_cons_b = JVLayoutBottom([smsSloganOffsetBottomY floatValue], JVLayoutItemSuper, NSLayoutAttributeBottom);
        [smsSloganAttris addObject:sms_slogan_cons_b];
    }
    if (smsSloganWidth) {
        JVLayoutConstraint *sms_slogan_cons_w = JVLayoutWidth([smsSloganWidth floatValue]);
        [smsSloganAttris addObject:sms_slogan_cons_w];
    }
    if (smsSloganHeight) {
        JVLayoutConstraint *sms_slogan_cons_h = JVLayoutHeight([smsSloganHeight floatValue]);
        [smsSloganAttris addObject:sms_slogan_cons_h];
    }
    uiConfig.smsSloganConstraints = smsSloganAttris;
    uiConfig.smsSloganHorizontalConstraints = uiConfig.smsSloganConstraints;
  
    
    // SMS号码输入框设置
    NSNumber *smsPhoneInputViewOffsetX = smsUIConfig[SMS_PHONE_INPUT_VIEW_OFFSET_X];
    NSNumber *smsPhoneInputViewOffsetY = smsUIConfig[SMS_PHONE_INPUT_VIEW_OFFSET_Y];
    NSNumber *smsPhoneInputViewWidth = smsUIConfig[SMS_PHONE_INPUT_VIEW_WIDTH];
    NSNumber *smsPhoneInputViewHeight = smsUIConfig[SMS_PHONE_INPUT_VIEW_HEIGHT];
    NSNumber *smsPhoneInputViewTextColor = smsUIConfig[SMS_PHONE_INPUT_VIEW_TEXT_COLOR];
    NSNumber *smsPhoneInputViewTextSize = smsUIConfig[SMS_PHONE_INPUT_VIEW_TEXT_SIZE];
    NSString *smsPhoneInputViewPlaceholderText = smsUIConfig[SMS_PHONE_INPUT_VIEW_PLACEHOLDER_TEXT];
//    NSString *smsPhoneInputViewBorderStyle = smsUIConfig[SMS_PHONE_INPUT_VIEW_BORDER_STYLE];
    if (smsPhoneInputViewTextColor) {
        uiConfig.smsNumberTFColor = UIColorFromRGBValue([smsPhoneInputViewTextColor integerValue]);
    }
    if (smsPhoneInputViewTextSize) {
        uiConfig.smsNumberTFFont = [UIFont systemFontOfSize:[smsPhoneInputViewTextSize floatValue]];
    }
    if (smsPhoneInputViewPlaceholderText) {
        uiConfig.smsNumberTFPlaceholder = smsPhoneInputViewPlaceholderText;
    }
    ;
    //todo
//    if (smsPhoneInputViewBorderStyle) {
//        uiConfig.smsNumberTFBorderStyle = [self getTFBorderStyleStyle:smsPhoneInputViewBorderStyle];
//    }
    NSMutableArray *smsPhoneInputViewAttris = [NSMutableArray array];
    if (smsPhoneInputViewOffsetX) {
        JVLayoutConstraint *sms_phoneInputView_cons_x = JVLayoutLeft([smsPhoneInputViewOffsetX floatValue], JVLayoutItemSuper, NSLayoutAttributeLeft);
        [smsPhoneInputViewAttris addObject:sms_phoneInputView_cons_x];
    }
    if (smsPhoneInputViewOffsetY) {
        JVLayoutConstraint *sms_phoneInputView_cons_y = JVLayoutTop([smsPhoneInputViewOffsetY floatValue],JVLayoutItemSuper,NSLayoutAttributeTop);
        [smsPhoneInputViewAttris addObject:sms_phoneInputView_cons_y];
    }
    if (smsPhoneInputViewWidth) {
        JVLayoutConstraint *sms_phoneInputView_cons_w = JVLayoutWidth([smsPhoneInputViewWidth floatValue]);
        [smsPhoneInputViewAttris addObject:sms_phoneInputView_cons_w];
    }
    if (smsPhoneInputViewHeight) {
        JVLayoutConstraint *sms_phoneInputView_cons_h = JVLayoutHeight([smsPhoneInputViewHeight floatValue]);
        [smsPhoneInputViewAttris addObject:sms_phoneInputView_cons_h];
    }
    
    uiConfig.smsNumberTFConstraints = smsPhoneInputViewAttris;
    uiConfig.smsNumberTFHorizontalConstraints = uiConfig.smsNumberTFConstraints;
    
    
    // SMS验证码输入框设置
    NSNumber *smsVerifyCodeEditTextViewOffsetX = smsUIConfig[SMS_VERIFY_CODE_EDIT_TEXT_VIEW_OFFSET_X];
    NSNumber *smsVerifyCodeEditTextViewOffsetY = smsUIConfig[SMS_VERIFY_CODE_EDIT_TEXT_VIEW_OFFSET_Y];
    NSNumber *smsVerifyCodeEditTextViewOffsetR = smsUIConfig[SMS_VERIFY_CODE_EDIT_TEXT_VIEW_OFFSET_R];
    NSNumber *smsVerifyCodeEditTextViewWidth = smsUIConfig[SMS_VERIFY_CODE_EDIT_TEXT_VIEW_WIDTH];
    NSNumber *smsVerifyCodeEditTextViewHeight = smsUIConfig[SMS_VERIFY_CODE_EDIT_TEXT_VIEW_HEIGHT];
    NSNumber *smsVerifyCodeEditTextViewTextColor = smsUIConfig[SMS_VERIFY_CODE_EDIT_TEXT_VIEW_TEXT_COLOR];
    NSNumber *smsVerifyCodeEditTextViewTextSize = smsUIConfig[SMS_VERIFY_CODE_EDIT_TEXT_VIEW_TEXT_SIZE];
    NSString *smsVerifyCodeEditTextViewPlaceholderText = smsUIConfig[SMS_VERIFY_CODE_EDIT_TEXT_VIEW_PLACEHOLDER_TEXT];
    //todo
//    NSString *smsVerifyCodeEditTextViewBorderStyle = smsUIConfig[SMS_VERIFY_CODE_EDIT_TEXT_VIEW_BORDER_STYLE];
    if (smsVerifyCodeEditTextViewTextColor) {
        uiConfig.smsCodeTFColor = UIColorFromRGBValue([smsVerifyCodeEditTextViewTextColor integerValue]);
    }
    if (smsVerifyCodeEditTextViewTextSize) {
        uiConfig.smsCodeTFFont = [UIFont systemFontOfSize:[smsVerifyCodeEditTextViewTextSize floatValue]];
    }
    if (smsVerifyCodeEditTextViewPlaceholderText) {
        uiConfig.smsCodeTFPlaceholder = smsVerifyCodeEditTextViewPlaceholderText;
    }
//    if (smsVerifyCodeEditTextViewBorderStyle) {
//        uiConfig.smsCodeTFBorderStyle = [self getTFBorderStyleStyle:smsVerifyCodeEditTextViewBorderStyle];
//    }
    NSMutableArray *smsVerifyCodeEditTextViewAttris = [NSMutableArray array];
    if (smsVerifyCodeEditTextViewOffsetX) {
        JVLayoutConstraint *sms_verifyCodeEditTextView_cons_x = JVLayoutLeft([smsVerifyCodeEditTextViewOffsetX floatValue], JVLayoutItemSuper, NSLayoutAttributeLeft);
        [smsVerifyCodeEditTextViewAttris addObject:sms_verifyCodeEditTextView_cons_x];
    }
    if (smsVerifyCodeEditTextViewOffsetY) {
        JVLayoutConstraint *sms_verifyCodeEditTextView_cons_y = JVLayoutTop([smsVerifyCodeEditTextViewOffsetY floatValue],JVLayoutItemSuper,NSLayoutAttributeTop);
        [smsVerifyCodeEditTextViewAttris addObject:sms_verifyCodeEditTextView_cons_y];
    }
    if (smsVerifyCodeEditTextViewOffsetR) {
        JVLayoutConstraint *sms_verifyCodeEditTextView_cons_R = JVLayoutRight([smsVerifyCodeEditTextViewOffsetR floatValue],JVLayoutItemSuper,NSLayoutAttributeRight);
        [smsVerifyCodeEditTextViewAttris addObject:sms_verifyCodeEditTextView_cons_R];
    }
    if (smsVerifyCodeEditTextViewWidth) {
        JVLayoutConstraint *w = JVLayoutWidth([smsVerifyCodeEditTextViewWidth floatValue]);
        [smsVerifyCodeEditTextViewAttris addObject:w];
    }
    if (smsVerifyCodeEditTextViewHeight) {
        JVLayoutConstraint *h = JVLayoutHeight([smsVerifyCodeEditTextViewHeight floatValue]);
        [smsVerifyCodeEditTextViewAttris addObject:h];
    }
    uiConfig.smsCodeTFConstraints = smsVerifyCodeEditTextViewAttris;
    uiConfig.smsCodeTFHorizontalConstraints = uiConfig.smsCodeTFConstraints;
    
    //  SMS获取验证码按钮
    NSNumber *smsGetVerifyCodeTextViewOffsetX = smsUIConfig[SMS_GET_VERIFY_CODE_TEXT_VIEW_OFFSET_X];
    NSNumber *smsGetVerifyCodeTextViewOffsetY = smsUIConfig[SMS_GET_VERIFY_CODE_TEXT_VIEW_OFFSET_Y];
    NSNumber *smsGetVerifyCodeTextViewOffsetR = smsUIConfig[SMS_GET_VERIFY_CODE_TEXT_VIEW_OFFSET_R];
    NSNumber *smsGetVerifyCodeBtnWidth = smsUIConfig[SMS_GET_VERIFY_CODE_BTN_WIDTH];
    NSNumber *smsGetVerifyCodeBtnHeight = smsUIConfig[SMS_GET_VERIFY_CODE_BTN_HEIGHT];
    NSNumber *smsGetVerifyCodeTextViewTextColor = smsUIConfig[SMS_GET_VERIFY_CODE_TEXT_VIEW_TEXT_COLOR];
    NSNumber *smsGetVerifyCodeTextViewTextSize = smsUIConfig[SMS_GET_VERIFY_CODE_TEXT_VIEW_TEXT_SIZE];
    NSString *smsGetVerifyCodeBtnText = smsUIConfig[SMS_GET_VERIFY_CODE_BTN_TEXT];
    NSString *smsGetVerifyCodeBtnBackgroundPath = smsUIConfig[SMS_GET_VERIFY_CODE_BTN_BACKGROUND_PATH];
    NSArray *smsGetVerifyCodeBtnBackgroundPaths = smsUIConfig[SMS_GET_VERIFY_CODE_BTN_BACKGROUND_PATHS];
    NSNumber *smsGetVerifyCodeBtnCornerRadius = smsUIConfig[SMS_GET_VERIFY_CODE_BTN_CORNER_RADIUS];
    if (smsGetVerifyCodeBtnText) {
        NSMutableDictionary *smsGetVerifyCodeTextViewAttr = [NSMutableDictionary dictionary];
        if (smsGetVerifyCodeTextViewTextColor) {
            [smsGetVerifyCodeTextViewAttr setValue:UIColorFromRGBValue([smsGetVerifyCodeTextViewTextColor integerValue]) forKey:NSForegroundColorAttributeName];
        }
        if (smsGetVerifyCodeTextViewTextSize) {
            [smsGetVerifyCodeTextViewAttr setValue:[UIFont systemFontOfSize:[smsGetVerifyCodeTextViewTextSize floatValue]] forKey:NSFontAttributeName];
        }
        uiConfig.smsGetCodeBtnAttributedString = [[NSAttributedString alloc] initWithString:smsGetVerifyCodeBtnText attributes:smsGetVerifyCodeTextViewAttr];
    }
    if (smsGetVerifyCodeBtnBackgroundPaths) {
        UIImage *img = [self imageNamed:smsGetVerifyCodeBtnBackgroundPaths[0]];
        UIImage *img1 = [self imageNamed:smsGetVerifyCodeBtnBackgroundPaths[1]];
        UIImage *img2 = [self imageNamed:smsGetVerifyCodeBtnBackgroundPaths[2]];
        uiConfig.smsGetCodeBtnImgs = @[img, img1, img2];
    }else if (smsGetVerifyCodeBtnBackgroundPath) {
        UIImage *img = [self imageNamed:smsGetVerifyCodeBtnBackgroundPath];
        uiConfig.smsGetCodeBtnImgs = @[img,img,img];
    }
    if (smsGetVerifyCodeBtnCornerRadius) {
        uiConfig.smsGetCodeBtnCornerRadius = [smsGetVerifyCodeBtnCornerRadius floatValue];
    }
    NSMutableArray *smsGetVerifyCodeBtnAttris = [NSMutableArray array];
    if (smsGetVerifyCodeTextViewOffsetX) {
        JVLayoutConstraint *sms_getVerifyCodeBtn_cons_x = JVLayoutLeft([smsGetVerifyCodeTextViewOffsetX floatValue], JVLayoutItemSuper, NSLayoutAttributeLeft);
        [smsGetVerifyCodeBtnAttris addObject:sms_getVerifyCodeBtn_cons_x];
    }
    if (smsGetVerifyCodeTextViewOffsetY) {
        JVLayoutConstraint *sms_getVerifyCodeBtn_cons_y = JVLayoutTop([smsGetVerifyCodeTextViewOffsetY floatValue],JVLayoutItemSuper,NSLayoutAttributeTop);
        [smsGetVerifyCodeBtnAttris addObject:sms_getVerifyCodeBtn_cons_y];
    }
    if (smsGetVerifyCodeTextViewOffsetR) {
        JVLayoutConstraint *sms_getVerifyCodeBtn_cons_R = JVLayoutRight([smsGetVerifyCodeTextViewOffsetR floatValue],JVLayoutItemSuper,NSLayoutAttributeRight);
        [smsGetVerifyCodeBtnAttris addObject:sms_getVerifyCodeBtn_cons_R];
    }
    if (smsGetVerifyCodeBtnWidth) {
        JVLayoutConstraint *sms_getVerifyCodeBtn_cons_W = JVLayoutWidth([smsGetVerifyCodeBtnWidth floatValue]);
        [smsGetVerifyCodeBtnAttris addObject:sms_getVerifyCodeBtn_cons_W];
    }
    if (smsGetVerifyCodeBtnHeight) {
        JVLayoutConstraint *sms_getVerifyCodeBtn_cons_H = JVLayoutHeight([smsGetVerifyCodeBtnHeight floatValue]);
        [smsGetVerifyCodeBtnAttris addObject:sms_getVerifyCodeBtn_cons_H];
    }
    uiConfig.smsGetCodeBtnConstraints = smsGetVerifyCodeBtnAttris;
    uiConfig.smsGetCodeBtnHorizontalConstraints = uiConfig.smsCodeTFConstraints;
    
    
    //  SMS登录按钮
    NSNumber *smsLogBtnOffsetX = smsUIConfig[SMS_LOG_BTN_OFFSET_X];
    NSNumber *smsLogBtnOffsetY = smsUIConfig[SMS_LOG_BTN_OFFSET_Y];
    NSNumber *smsLogBtnBottomOffsetY = smsUIConfig[SMS_LOG_BTN_BOTTOM_OFFSET_Y];
    NSNumber *smsLogBtnWidth = smsUIConfig[SMS_LOG_BTN_WIDTH];
    NSNumber *smsLogBtnHeight = smsUIConfig[SMS_LOG_BTN_HEIGHT];
    NSNumber *smsLogBtnTextColor = smsUIConfig[SMS_LOG_BTN_TEXT_COLOR];
    NSNumber *smsLogBtnTextSize = smsUIConfig[SMS_LOG_BTN_TEXT_SIZE];
    NSString *smsLogBtnText = smsUIConfig[SMS_LOG_BTN_TEXT];
    NSNumber *isSmsLogBtnTextBold = smsUIConfig[IS_SMS_LOG_BTN_TEXT_BOLD];
    NSString *smsLogBtnBackgroundPath = smsUIConfig[SMS_LOG_BTN_BACKGROUND_PATH];
    NSArray *smsLogBtnBackgroundPaths = smsUIConfig[SMS_LOG_BTN_BACKGROUND_PATHS];
    if (smsLogBtnText) {
        NSMutableDictionary *smsLogBtnAttr = [NSMutableDictionary dictionary];
        if (smsLogBtnTextColor) {
            [smsLogBtnAttr setValue:UIColorFromRGBValue([smsLogBtnTextColor integerValue]) forKey:NSForegroundColorAttributeName];
        }
        if (smsLogBtnTextSize) {
            UIFont *font;
            if (!isSmsLogBtnTextBold || (isSmsLogBtnTextBold && [isSmsLogBtnTextBold boolValue] == NO)) {
                font = [UIFont systemFontOfSize:[smsLogBtnTextSize floatValue]];
            }else {
                font = [UIFont boldSystemFontOfSize:[smsLogBtnTextSize floatValue]];
            }
            [smsLogBtnAttr setValue:font forKey:NSFontAttributeName];
        }
        uiConfig.smsLogBtnAttributedString = [[NSAttributedString alloc] initWithString:smsLogBtnText attributes:smsLogBtnAttr];
    }
    if (smsLogBtnBackgroundPaths) {
        UIImage *img = [self imageNamed:smsLogBtnBackgroundPaths[0]];
        UIImage *img1 = [self imageNamed:smsLogBtnBackgroundPaths[1]];
        UIImage *img2 = [self imageNamed:smsLogBtnBackgroundPaths[2]];
        uiConfig.smsLogBtnImgs = @[img, img1, img2];
    }else if (smsLogBtnBackgroundPath) {
        UIImage *img = [self imageNamed:smsLogBtnBackgroundPath];
        uiConfig.smsLogBtnImgs = @[img,img,img];
    }

    NSMutableArray *smsLogBtnConstraints = [NSMutableArray array];
    if (smsLogBtnOffsetX) {
        JVLayoutConstraint *sms_logBtn_cons_x = JVLayoutLeft([smsLogBtnOffsetX floatValue], JVLayoutItemSuper, NSLayoutAttributeLeft);
        [smsLogBtnConstraints addObject:sms_logBtn_cons_x];
    }
    if (smsLogBtnOffsetY) {
        JVLayoutConstraint *sms_logBtn_cons_y = JVLayoutTop([smsLogBtnOffsetY floatValue],JVLayoutItemSuper,NSLayoutAttributeTop);
        [smsLogBtnConstraints addObject:sms_logBtn_cons_y];
    }
    if (smsLogBtnBottomOffsetY) {
        JVLayoutConstraint *sms_logBtn_cons_B = JVLayoutBottom([smsLogBtnBottomOffsetY floatValue],JVLayoutItemSuper,NSLayoutAttributeBottom);
        [smsLogBtnConstraints addObject:sms_logBtn_cons_B];
    }
    if (smsLogBtnWidth) {
        JVLayoutConstraint *sms_logBtn_cons_W = JVLayoutWidth([smsLogBtnWidth floatValue]);
        [smsLogBtnConstraints addObject:sms_logBtn_cons_W];
    }
    if (smsLogBtnWidth) {
        JVLayoutConstraint *sms_logBtn_cons_H = JVLayoutHeight([smsLogBtnHeight floatValue]);
        [smsLogBtnConstraints addObject:sms_logBtn_cons_H];
    }
    uiConfig.smsLogBtnConstraints = smsLogBtnConstraints;
    uiConfig.smsLogBtnHorizontalConstraints = uiConfig.smsCodeTFConstraints;
   
    
    // SMS隐私条款
    NSArray *smsPrivacyColor = smsUIConfig[SMS_PRIVACY_COLOR];
    NSNumber *smsPrivacyTextVerAlignment = smsUIConfig[SMS_PRIVACY_TEXT_VER_ALIGNMENT];
    NSNumber *isSmsPrivacyTextGravityCenter = smsUIConfig[IS_SMS_PRIVACY_TEXT_GRAVITY_CENTER];
    NSString *smsPrivacyCheckboxCheckedImgPath = smsUIConfig[SMS_PRIVACY_CHECKBOX_CHECKED_IMG_PATH];
    NSString *smsPrivacyCheckboxUncheckedImgPath = smsUIConfig[SMS_PRIVACY_CHECKBOX_UNCHECKED_IMG_PATH];
    NSNumber *smsPrivacyCheckboxState = smsUIConfig[SMS_PRIVACY_CHECKBOX_STATE];
    NSNumber *smsPrivacyCheckboxSize = smsUIConfig[SMS_PRIVACY_CHECKBOX_SIZE];
    NSNumber *isSmsPrivacyCheckboxInCenter = smsUIConfig[IS_SMS_PRIVACY_CHECKBOX_IN_CENTER];
    NSNumber *smsPrivacyCheckboxOffsetX = smsUIConfig[SMS_PRIVACY_CHECKBOX_OFFSET_X];
    NSNumber *smsPrivacyCheckboxOffsetY = smsUIConfig[SMS_PRIVACY_CHECKBOX_OFFSET_Y];
    NSNumber *smsPrivacyOffsetX = smsUIConfig[SMS_PRIVACY_OFFSET_X];
    NSNumber *smsPrivacyOffsetY = smsUIConfig[SMS_PRIVACY_OFFSET_Y];
    NSNumber *smsPrivacyTopOffsetY = smsUIConfig[SMS_PRIVACY_TOP_OFFSET_Y];
    NSNumber *smsPrivacyWidth = smsUIConfig[SMS_PRIVACY_WIDTH];
    NSNumber *smsPrivacyHeight = smsUIConfig[SMS_PRIVACY_HEIGHT];
    if (smsPrivacyColor) {
        uiConfig.smsAppPrivacyColor = @[UIColorFromRGBValue([smsPrivacyColor[0] integerValue]), UIColorFromRGBValue([smsPrivacyColor[1] integerValue])];
    }
    if (smsPrivacyTextVerAlignment) {
        uiConfig.smsTextVerAlignment = [smsPrivacyTextVerAlignment integerValue];
    }
    if (smsPrivacyCheckboxCheckedImgPath) {
        uiConfig.smsCheckedImg = [self imageNamed:smsPrivacyCheckboxCheckedImgPath];
    }
    if (smsPrivacyCheckboxUncheckedImgPath) {
        uiConfig.smsUncheckedImg = [self imageNamed:smsPrivacyCheckboxUncheckedImgPath];
    }
    if (smsPrivacyCheckboxState) {
        uiConfig.smsPrivacyState = [smsPrivacyCheckboxState boolValue];
    }
    if (isSmsPrivacyTextGravityCenter) {
        uiConfig.smsPrivacyTextAlignment = [isSmsPrivacyTextGravityCenter boolValue]? NSTextAlignmentCenter : NSTextAlignmentLeft;
    }
    NSMutableArray *smsPrivacyConstraints = [NSMutableArray array];
    if (smsPrivacyOffsetX) {
        JVLayoutConstraint *sms_privacy_cons_x = JVLayoutLeft([smsPrivacyOffsetX floatValue], JVLayoutItemSuper, NSLayoutAttributeLeft);
        [smsPrivacyConstraints addObject:sms_privacy_cons_x];
    }
    if (smsPrivacyOffsetY) {
        JVLayoutConstraint *sms_privacy_cons_b = JVLayoutBottom([smsPrivacyOffsetY floatValue], JVLayoutItemSuper, NSLayoutAttributeBottom);
        [smsPrivacyConstraints addObject:sms_privacy_cons_b];
    }
    if (smsPrivacyTopOffsetY) {
        JVLayoutConstraint *sms_privacy_cons_y = JVLayoutBottom([smsPrivacyTopOffsetY floatValue], JVLayoutItemSuper, NSLayoutAttributeBottom);
        [smsPrivacyConstraints addObject:sms_privacy_cons_y];
    }
    if (smsPrivacyWidth) {
        JVLayoutConstraint *sms_privacy_cons_w = JVLayoutWidth([smsPrivacyWidth floatValue]);
        [smsPrivacyConstraints addObject:sms_privacy_cons_w];
    }
    if (smsPrivacyHeight) {
        JVLayoutConstraint *sms_privacy_cons_h = JVLayoutHeight([smsPrivacyHeight floatValue]);
        [smsPrivacyConstraints addObject:sms_privacy_cons_h];
    }
    uiConfig.smsPrivacyConstraints = smsPrivacyConstraints;
    uiConfig.smsPrivacyHorizontalConstraints = uiConfig.smsPrivacyConstraints;
    

    NSMutableArray *smsPrivacyCheckboxSizeAttris = [NSMutableArray array];
    if (smsPrivacyCheckboxSize) {
        JVLayoutConstraint *w = JVLayoutWidth([smsPrivacyCheckboxSize floatValue]);
        JVLayoutConstraint *h = JVLayoutHeight([smsPrivacyCheckboxSize floatValue]);
        [smsPrivacyCheckboxSizeAttris addObject:w];
        [smsPrivacyCheckboxSizeAttris addObject:h];
    }
    if ([isSmsPrivacyCheckboxInCenter boolValue]) {
        JVLayoutConstraint *centerY = JVLayoutCenterY(0, JVLayoutItemPrivacy);
        [smsPrivacyCheckboxSizeAttris addObject:centerY];
    }else {
        JVLayoutConstraint *top = JVLayoutTop(0, JVLayoutItemPrivacy, NSLayoutAttributeTop);
        [smsPrivacyCheckboxSizeAttris addObject:top];
    }
    if (smsPrivacyCheckboxOffsetX) {
        JVLayoutConstraint *x = JVLayoutLeft([smsPrivacyCheckboxOffsetX floatValue], JVLayoutItemSuper, NSLayoutAttributeLeft);
        [smsPrivacyCheckboxSizeAttris addObject:x];
    }
    if (smsPrivacyCheckboxOffsetX) {
        JVLayoutConstraint *x = JVLayoutLeft([smsPrivacyCheckboxOffsetX floatValue], JVLayoutItemSuper, NSLayoutAttributeLeft);
        [smsPrivacyCheckboxSizeAttris addObject:x];
    }
    if (smsPrivacyCheckboxOffsetY) {
        JVLayoutConstraint *y = JVLayoutTop([smsPrivacyCheckboxOffsetY floatValue], JVLayoutItemSuper, NSLayoutAttributeTop);
        [smsPrivacyCheckboxSizeAttris addObject:y];
    }
    
    uiConfig.smsCheckViewConstraints = smsPrivacyCheckboxSizeAttris;
    

    if([[smsUIConfig allKeys] containsObject:SMS_PRIVACY_BEAN_LIST] && smsUIConfig[SMS_PRIVACY_BEAN_LIST]){
        NSArray *parivacyArr = smsUIConfig[SMS_PRIVACY_BEAN_LIST];
        NSMutableArray *appPrivacyss = [NSMutableArray array];
        //设置头 如勾选即同意
        if([[smsUIConfig allKeys] containsObject:PRIVACY_TEXT] && smsUIConfig[PRIVACY_TEXT]){
            NSArray *privacyTexts = smsUIConfig[PRIVACY_TEXT];
            if ([privacyTexts count]>0)
                [appPrivacyss addObject:privacyTexts[0]];
        }
        //自定义协议部分
        for (NSInteger i = 0; i<parivacyArr.count; i++) {
            NSMutableArray *item = [NSMutableArray array];
            NSDictionary *obj = [parivacyArr objectAtIndex:i];
            //加入协议之间的分隔符
            if ([[obj allKeys] containsObject:@"separator"] ) {
                [item addObject:[obj objectForKey:@"separator"]];
            }
            //加入name
            if ([[obj allKeys] containsObject:@"name"] ) {
                [item addObject:[obj objectForKey:@"name"]];
            }
            //加入url
            if ([[obj allKeys] containsObject:@"url"] ) {
                [item addObject:[obj objectForKey:@"url"]];
            }
            //加入协议详细页面的导航栏文字 可以是NSAttributedString类型 自定义  这里是直接拿name进行展示
            if ([[obj allKeys] containsObject:@"name"] ) {
                [item addObject:[obj objectForKey:@"name"]];
            }
            //添加一条协议appPrivacyss中
            [appPrivacyss addObject:item];
        }
        //设置尾
        if([[smsUIConfig allKeys] containsObject:PRIVACY_TEXT] && smsUIConfig[PRIVACY_TEXT]){
            NSArray *privacyTexts = smsUIConfig[PRIVACY_TEXT];
            if ([privacyTexts count]>1)
                [appPrivacyss addObject:privacyTexts[1]];
        }
        //设置
        if (appPrivacyss.count>1) {
            uiConfig.smsAppPrivacys = appPrivacyss;
        }
    }
    
    
    //todo
//    BOOL privacyHintToast = [[self getValue:config key:@"privacyHintToast"] boolValue];
//    if(privacyHintToast){
//        uiConfig.smsCustomPrivacyAlertViewBlock = ^(UIViewController *vc , NSArray *appPrivacys,void(^loginAction)(void)) {
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请点击同意协议" message:nil preferredStyle:UIAlertControllerStyleAlert];
//            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil] ];
//            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil] ];
//            [vc presentViewController:alert animated:true completion:nil];
//
//        };
//    }
    
    
    /************** 协议二次弹窗样式 先用一键登录页面的二次弹窗设置设置 ***************/
    
//    // 二次弹窗自定义视图
//    __weak __typeof(self)weakSelf = self;
//    NSArray *agreementAlertViewWidgets = [self getValue:config key:@"agreementAlertViewWidgets"];
//    uiConfig.smsCustomAgreementAlertView = ^(UIView * _Nonnull superView, void (^ _Nonnull hidAlertView)(void)) {
//        weakSelf.hidAgreementAlertView = hidAlertView;
//        for (NSDictionary *widgetDic in agreementAlertViewWidgets) {
//            NSString *type = [self getValue:widgetDic key:@"type"];
//            if ([type isEqualToString:@"textView"]) {
//                [superView addSubview:[self addCustomTextWidget:widgetDic]];
//            }else if ([type isEqualToString:@"button"]){
//                UIButton *cancle = [self addCustomButtonWidget:widgetDic];
//                [superView addSubview:cancle];
//                [cancle addTarget:weakSelf action:@selector(cancelAgreementAlertView) forControlEvents:UIControlEventTouchUpInside];
//            }else{
//
//            }
//        }
//    };
    
    
}

//获取UIImage
- (UIImage *)imageNamed:(NSString *)imageName
{
    if (![imageName isKindOfClass:[NSString class]]) {
        return nil;
    }
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:JVERIFICATION_RESOURCE ofType:@"bundle"];
    UIImage *image= [UIImage imageWithContentsOfFile:[bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",imageName]]];
    return image;
}

- (NSString *)jvbundlePath {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:JVERIFICATION_RESOURCE ofType:@"bundle"];
    return bundlePath;
}

//设置x,y,w,h
- (NSArray <JVLayoutConstraint*>*)layoutConstraint:(CGFloat )x y:(CGFloat )y w:(CGFloat )w h:(CGFloat)h
{
    JVLayoutConstraint *constraintX = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemSuper attribute:NSLayoutAttributeLeft multiplier:1 constant:x];
    JVLayoutConstraint *constraintY = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemSuper attribute:NSLayoutAttributeTop multiplier:1 constant:y];
    JVLayoutConstraint *constraintW = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemNone attribute:NSLayoutAttributeWidth multiplier:1 constant:w];
    JVLayoutConstraint *constraintH = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemNone attribute:NSLayoutAttributeHeight multiplier:1 constant:h];
    return @[constraintX,constraintY,constraintW,constraintH];
}
// 设置宽高
+ (NSArray*)configConstraintWithAttributes:(NSArray*)keys{
    NSAssert(keys.count == 4, @"你必须按照文档规则设置参数(centerX,centerY,width,height)");
    NSMutableArray *constraints = [NSMutableArray arrayWithCapacity:4];
    NSArray* cons = keys;
    CGFloat centerX = [cons[0] floatValue];
    CGFloat centerY = [cons[1] floatValue];
    CGFloat w = [cons[2] floatValue];
    CGFloat h = [cons[3] floatValue];
    JVLayoutConstraint *constraintX = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemSuper attribute:NSLayoutAttributeCenterX multiplier:1 constant:centerX];
    JVLayoutConstraint *constraintY = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemSuper attribute:NSLayoutAttributeCenterY multiplier:1 constant:centerY];
    JVLayoutConstraint *constraintW = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemNone attribute:NSLayoutAttributeWidth multiplier:1 constant:w];
    JVLayoutConstraint *constraintH = [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemNone attribute:NSLayoutAttributeHeight multiplier:1 constant:h];
    [constraints addObjectsFromArray:@[constraintX,constraintY,constraintW,constraintH]];
    return constraints;
}


#pragma mark - 自定义授权页面原有的 UI 控件

JVLayoutConstraint *JVLayoutTop(CGFloat top,JVLayoutItem toItem,NSLayoutAttribute attr2) {
    return [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toItem attribute:attr2 multiplier:1 constant:top];
}
JVLayoutConstraint *JVLayoutBottom(CGFloat bottom,JVLayoutItem toItem,NSLayoutAttribute attr2) {
    return [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:toItem attribute:attr2 multiplier:1 constant:bottom];
}
JVLayoutConstraint *JVLayoutLeft(CGFloat left,JVLayoutItem toItem,NSLayoutAttribute attr2) {
    return [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:toItem attribute:attr2 multiplier:1 constant:left];
}
JVLayoutConstraint *JVLayoutRight(CGFloat right,JVLayoutItem toItem,NSLayoutAttribute attr2) {
    return [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:toItem attribute:attr2 multiplier:1 constant:right];
}
JVLayoutConstraint *JVLayoutCenterX(CGFloat centerX) {
    return [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemSuper attribute:NSLayoutAttributeCenterX multiplier:1 constant:centerX];
}
JVLayoutConstraint *JVLayoutCenterY(CGFloat centerY,JVLayoutItem toItem) {
    return [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeCenterY multiplier:1 constant:centerY];
}
JVLayoutConstraint *JVLayoutWidth(CGFloat widht) {
    return [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemNone attribute:NSLayoutAttributeWidth multiplier:1 constant:widht];
}
JVLayoutConstraint *JVLayoutHeight(CGFloat height) {
    return [JVLayoutConstraint constraintWithAttribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:JVLayoutItemNone attribute:NSLayoutAttributeHeight multiplier:1 constant:height];
}

#pragma mark - 自定义控件辅助方法

// 获取字典值的辅助方法
- (id)getValue:(NSDictionary *)dict key:(NSString *)key {
    if (!dict || !key) {
        return nil;
    }
    return dict[key];
}

// 获取按钮标题对齐方式
- (UIControlContentHorizontalAlignment)getButtonTitleAlignment:(NSString *)textAlignment {
    if ([textAlignment isEqualToString:@"left"]) {
        return UIControlContentHorizontalAlignmentLeft;
    } else if ([textAlignment isEqualToString:@"right"]) {
        return UIControlContentHorizontalAlignmentRight;
    } else if ([textAlignment isEqualToString:@"center"]) {
        return UIControlContentHorizontalAlignmentCenter;
    }
    return UIControlContentHorizontalAlignmentCenter;
}

#pragma mark - 添加自定义控件
static int ctagId = 100000;
// 添加 button
- (UIButton *)addCustomButtonWidget:(NSDictionary *)widgetDic {
    if (debug) {
        NSLog(@"Action - addCustomButtonWidget:");
    }
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    NSInteger left = [[self getValue:widgetDic key:@"left"] integerValue];
    NSInteger top = [[self getValue:widgetDic key:@"top"] integerValue];
    NSInteger width = [[self getValue:widgetDic key:@"width"] integerValue];
    NSInteger height = [[self getValue:widgetDic key:@"height"] integerValue];
    
    NSString *title = [self getValue:widgetDic key:@"title"];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateHighlighted];
    }
    NSNumber *titleColor = [self getValue:widgetDic key:@"titleColor"];
    if (titleColor) {
        [button setTitleColor:UIColorFromRGBValue([titleColor integerValue]) forState:UIControlStateNormal];
    }
    NSNumber *backgroundColor = [self getValue:widgetDic key:@"backgroundColor"];
    if (backgroundColor) {
        [button setBackgroundColor:UIColorFromRGBValue([backgroundColor integerValue])];
    }
    NSString *textAlignment = [self getValue:widgetDic key:@"textAlignment"];
    if (textAlignment) {
        button.contentHorizontalAlignment = [self getButtonTitleAlignment:textAlignment];
    }
    
    NSNumber *font = [self getValue:widgetDic key:@"titleFont"];
    if (font) {
        button.titleLabel.font = [UIFont systemFontOfSize:[font floatValue]];
    }
    
    NSNumber *isShowUnderline = [self getValue:widgetDic key:@"isShowUnderline"];
    if ([isShowUnderline boolValue] && title) {
        NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:title attributes:attribtDic];
        [button setAttributedTitle:attribtStr forState:UIControlStateNormal];
        [button setAttributedTitle:attribtStr forState:UIControlStateHighlighted];
    }
    
    button.frame = CGRectMake(left, top, width, height);
    
    NSNumber *isClickEnable = [self getValue:widgetDic key:@"isClickEnable"];
    button.userInteractionEnabled = [isClickEnable boolValue];
    [button addTarget:self action:@selector(clickCustomWidgetAction:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *widgetId = [self getValue:widgetDic key:@"widgetId"];
    
    NSString *tag = @(ctagId++).stringValue;
    button.tag = [tag integerValue];
    
    [_customWidgetIdDic setObject:widgetId forKey:tag];
    
    NSString *btnNormalImageName = [self getValue:widgetDic key:@"btnNormalImageName"];
    NSString *btnPressedImageName = [self getValue:widgetDic key:@"btnPressedImageName"];
    if (!btnPressedImageName) {
        btnPressedImageName = btnNormalImageName;
    }
    if (btnNormalImageName) {
        UIImage *normalImage = [self imageNamed:btnNormalImageName];
        if (normalImage) {
            [button setBackgroundImage:normalImage forState:UIControlStateNormal];
        }
    }
    if (btnPressedImageName) {
        UIImage *pressedImage = [self imageNamed:btnPressedImageName];
        if (pressedImage) {
            [button setBackgroundImage:pressedImage forState:UIControlStateHighlighted];
            [button setBackgroundImage:pressedImage forState:UIControlStateSelected];
        }
    }
    
    return button;
}

// 添加 textView
- (UILabel *)addCustomTextWidget:(NSDictionary *)widgetDic {
    if (debug) {
        NSLog(@"Action - addCustomTextWidget:");
    }
    UILabel *label = [[UILabel alloc] init];
    
    NSInteger left = [[self getValue:widgetDic key:@"left"] integerValue];
    NSInteger top = [[self getValue:widgetDic key:@"top"] integerValue];
    NSInteger width = [[self getValue:widgetDic key:@"width"] integerValue];
    NSInteger height = [[self getValue:widgetDic key:@"height"] integerValue];
    
    NSString *title = [self getValue:widgetDic key:@"title"];
    if (title) {
        label.text = title;
    }
    
    NSNumber *titleColor = [self getValue:widgetDic key:@"titleColor"];
    if (titleColor) {
        label.textColor = UIColorFromRGBValue([titleColor integerValue]);
    }
    
    NSNumber *backgroundColor = [self getValue:widgetDic key:@"backgroundColor"];
    if (backgroundColor) {
        label.backgroundColor = UIColorFromRGBValue([backgroundColor integerValue]);
    }
    
    NSString *textAlignment = [self getValue:widgetDic key:@"textAlignment"];
    if ([textAlignment isEqualToString:@"left"]) {
        label.textAlignment = NSTextAlignmentLeft;
    } else if ([textAlignment isEqualToString:@"right"]) {
        label.textAlignment = NSTextAlignmentRight;
    } else if ([textAlignment isEqualToString:@"center"]) {
        label.textAlignment = NSTextAlignmentCenter;
    }
    
    NSNumber *font = [self getValue:widgetDic key:@"titleFont"];
    if (font) {
        label.font = [UIFont systemFontOfSize:[font floatValue]];
    }
    
    NSNumber *lines = [self getValue:widgetDic key:@"lines"];
    if (lines) {
        label.numberOfLines = [lines integerValue];
    }
    
    NSNumber *isSingleLine = [self getValue:widgetDic key:@"isSingleLine"];
    if (isSingleLine && ![isSingleLine boolValue]) {
        label.numberOfLines = 0;
    }
    
    NSNumber *isShowUnderline = [self getValue:widgetDic key:@"isShowUnderline"];
    if ([isShowUnderline boolValue] && title) {
        NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:title attributes:attribtDic];
        label.attributedText = attribtStr;
    }
    
    label.frame = CGRectMake(left, top, width, height);
    
    NSNumber *isClickEnable = [self getValue:widgetDic key:@"isClickEnable"];
    label.userInteractionEnabled = [isClickEnable boolValue];
    
    if ([isClickEnable boolValue]) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCustomTextWidgetAction:)];
        [label addGestureRecognizer:tapGesture];
        
        NSString *widgetId = [self getValue:widgetDic key:@"widgetId"];
        NSString *tag = @(ctagId++).stringValue;
        label.tag = [tag integerValue];
        [_customWidgetIdDic setObject:widgetId forKey:tag];
    }
    
    return label;
}

// 按钮点击事件
- (void)clickCustomWidgetAction:(UIButton *)button {
    if (debug) {
        NSLog(@"Action - clickCustomWidgetAction:");
    }
    
    NSString *tag = [NSString stringWithFormat:@"%@",@(button.tag)];
    if (tag) {
        NSString *widgetId = [_customWidgetIdDic objectForKey:tag];
        if (widgetId) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSDictionary *responseData = @{@"eventId": widgetId};
                [self sendClickWidgetEvent:responseData];
            });
        }
    }
}

// TextView 点击事件
- (void)clickCustomTextWidgetAction:(UITapGestureRecognizer *)gesture {
    if (debug) {
        NSLog(@"Action - clickCustomTextWidgetAction:");
    }
    
    UILabel *label = (UILabel *)gesture.view;
    NSString *tag = [NSString stringWithFormat:@"%@",@(label.tag)];
    if (tag) {
        NSString *widgetId = [_customWidgetIdDic objectForKey:tag];
        if (widgetId) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSDictionary *responseData = @{@"eventId": widgetId};
                [self sendClickWidgetEvent:responseData];
            });
        }
    }
}

@end

