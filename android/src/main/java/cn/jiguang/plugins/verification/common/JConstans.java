package cn.jiguang.plugins.verification.common;

public class JConstans {

    public static final String CODE = "code";
    public static final String TIME = "time";
    public static final String ENABLE = "enable";
    public static final String CONTENT = "content";
    public static final String OPERATOR = "operator";

    public static final String LOGIN_EVENT = "LoginEvent";
    public static final String SMS_LOGIN_EVENT = "SMSLoginEvent";
    public static final String CLICK_WIDGET_EVENT = "ClickWidgetEvent";  // 自定义控件点击事件
    public static final String PARAMS_NULL = "params cant be null";

    //*******************
    public static final String APP_LANGUAGE_TYPE = "appLanguageType";                       //背景图
    public static final String VIRTUAL_BUTTON_TRANSPARENT = "virtualButtonTransparent"; //授权页虚拟按键背景是否透明 only android
    public static final String VIRTUAL_BUTTON_HIDDEN = "virtualButtonHidden";  //设置授权页底部虚拟导航栏背景 only android
    public static final String VIRTUAL_BUTTON_COLOR = "virtualButtonColor"; //设置授权页底部虚拟导航栏是否隐藏 only android
    public static final String PRIVACY_VIRTUAL_BUTTON_TRANSPARENT = "privacyVirtualButtonTransparent"; //隐私页web页虚拟按键背景是否透明 only android
    public static final String PRIVACY_VIRTUAL_BUTTON_COLOR = "privacyVirtualButtonColor"; //设置隐私界面底部虚拟导航栏背景 only android

    //*******************


    //*******************************自定义登录页面*******************************

    public static final String BACK_GROUND_IMAGE = "backgroundImage";                       //背景图
    public static final String BACK_GROUND_GIF_IMAGE = "backgroundGifImage";                //背景gif
    public static final String BACK_GROUND_VIDEO = "backgroundVideo";                       //背景视频
    public static final String BACK_GROUND_VIDEO_PLACEHOLDER_IMAGE = "backgroundVideoPlaceHolderImage";  //背景视频默认图


    public static final String STATUS_BAR_HIDDEN = "statusBarHidden";                       //状态栏是否隐藏
    public static final String STATUS_BAR_TRANSPARNT = "statusBarTransparent";              //状态栏是否透明
    public static final String STATUS_BAR_MODE = "statusBarMode";                           //状态栏模式。light和dark
    public static final String STATUS_BAR_MODE_LIGHT = "light";                             //状态栏暗色模式。
    public static final String STATUS_BAR_MODE_DARK = "dark";                               //状态栏暗色模式。仅在android 6.0以上设备生效。

    public static final String NAV_HIDDEN = "navHidden";                                    //导航栏是否隐藏
    public static final String NAV_COLOR = "navColor";                                      //导航栏颜色
    public static final String NAV_TRANSPARENT = "navTransparent"; //导航栏是否透明
    public static final String NAV_TEXT_BOLD = "navTextBold"; //导航栏文字加粗
    public static final String NAV_BAR_DARK_MODE = "navBarDarkMode"; //导航栏支持暗黑模式 only Android
    public static final String NAV_TITLE = "navTitle";                                      //导航栏标题
    public static final String NAV_TITLE_SIZE = "navTitleSize";                             //导航栏标题文字字体大小(单位:sp)
    public static final String NAV_TITLE_COLOR = "navTitleColor";                           //导航栏标题文字颜色

    public static final String NAV_RETURN_BTN_HIDDEN = "navReturnHidden";                   //导航栏返回按钮是否隐藏
    public static final String NAV_RETURN_BTN_IMAGE = "navReturnImage";                     //导航栏左侧返回按钮图标
    public static final String NAV_RETURN_BTN_X = "navReturnX";                             //导航栏返回按钮距屏幕左侧偏移
    public static final String NAV_RETURN_BTN_Y = "navReturnY";                             //导航栏返回按钮距上端偏移
    public static final String NAV_RETURN_BTN_W = "navReturnW";                             //导航栏返回按钮宽度
    public static final String NAV_RETURN_BTN_H = "navReturnH";                             //导航栏返回按钮高度

    public static final String LOGO_HIDDEN = "logoHidden";                                  //logo是否隐藏
    public static final String LOGO_IMAGE = "logoImage";                                    //logo(android默认为应用图标;ios默认无)
    public static final String LOGO_X = "logoX";                                            //logo相对于屏幕左边x轴偏移
    public static final String LOGO_Y = "logoY";                                            //logo相对于标题栏下边缘y偏移
    public static final String LOGO_W = "logoW";                                            //logo宽
    public static final String LOGO_H = "logoH";                                            //logo高
    public static final String LOGO_OFFSET_BOTTOM_Y = "logoOffsetBottomY"; //logo 底部边距 only Android

    public static final String NUMBER_SIZE  = "numberSize";                                 //手机号码字体大小（单位:sp）
    public static final String NUMBER_COLOR  = "numberColor";                               //手机号码字体颜色
    public static final String NUMBER_X = "numberX";                                        //号码栏相对于屏幕左边x轴偏移
    public static final String NUMBER_Y = "numberY";                                        //号码栏相对于标题栏下边缘y偏移
    public static final String NUMBER_W = "numberW";                                        //号码栏宽度
    public static final String NUMBER_H = "numberH";                                        //号码栏高度
    public static final String NUMBER_FIELD_OFFSET_BOTTOM_Y = "numberFieldOffsetBottomY"; //号码栏底部边距 only Android
    public static final String NUMBER_TEXT_BOLD = "numberTextBold"; //号码栏文字加粗
    public static final String SLOGAN_HIDDEN  = "sloganHidden";                             //slogan是否隐藏
    public static final String SLOGAN_TEXT_SIZE  = "sloganTextSize";                        //slogan字体大小
    public static final String SLOGAN_TEXT_COLOR  = "sloganTextColor";                      //slogan文字颜色
    public static final String SLOGAN_X = "sloganX";                                        //slogan相对于屏幕左边x轴偏移
    public static final String SLOGAN_Y = "sloganY";                                        //slogan相对于标题栏下边缘y偏移
    public static final String SLOGAN_BOTTOM_OFFSET_Y = "sloganBottomOffsetY";             //slogan底部边距 only Android
    public static final String SLOGAN_TEXT_BOLD = "sloganTextBold";                        //slogan文字加粗

    public static final String LOGIN_BTN_TEXT  = "loginBtnText";                            //登录按钮文字
    public static final String LOGIN_BTN_TEXT_SIZE  = "loginBtnTextSize";                   //登录按钮字体大小
    public static final String LOGIN_BTN_TEXT_COLOR  = "loginBtnTextColor";                 //登录按钮文字颜色
    public static final String LOGIN_BTN_IMAGE_SELECTOR = "loginBtnImageSelector";          //登录按钮selector选择样式 （仅android）
    public static final String LOGIN_BTN_NORMAL_IMAGE  = "loginBtnNormalImage";             //登录按钮正常图片 （仅ios,三个同时设置生效）
    public static final String LOGIN_BTN_DISABLED_IMAGE  = "loginBtnDisabledImage";         //登录按钮失效图片  (仅ios,三个同时设置生效
    public static final String LOGIN_BTN_SELECTED_IMAGE  = "loginBtnSelectedImage";         //登录按钮按下图片  (仅ios,三个同时设置生效）
    public static final String LOGIN_BTN_X = "loginBtnOffsetX";                             //登录按钮相对于屏幕左边x轴偏移
    public static final String LOGIN_BTN_Y = "loginBtnOffsetY";                             //登录按钮相对于标题栏下边缘y偏移
    public static final String LOGIN_BTN_W = "loginBtnWidth";                               //登录按钮宽度
    public static final String LOGIN_BTN_H = "loginBtnHeight";                              //登录按钮高度

    public static final String LOG_BTN_BOTTOM_OFFSET_Y = "logBtnBottomOffsetY";            //登录按钮底部边距 only Android
    public static final String LOG_BTN_TEXT_BOLD = "logBtnTextBold";                       //登录按钮文字加粗
    public static final String LOG_BTN_BACKGROUND_PATH = "logBtnBackgroundPath";           //登录按钮背景图片路径

    public static final String PRIVACY_ONE  = "privacyOne";                                 //隐私条款一 过期 2.7.3+不生效
    public static final String PRIVACY_TWO  = "privacyTwo";                                 //隐私条款二  过期 2.7.3+不生效
    public static final String PRIVACY_NAME_AND_URL_BEANLIST  = "privacyNameAndUrlBeanList";                  //隐私条款组合
    public static final String PRIVACY_COLOR  = "privacyColor";                             //隐私条款颜色
    public static final String PRIVACY_TEXT  = "privacyText";                               //隐私条款名称外的文字
    public static final String PRIVACY_TEXT_SIZE  = "privacyTextSize";                      //隐私条款文字字体大小
    public static final String PRIVACY_TEXT_GRAVITY_MODE  = "privacyTextGravityMode";       //隐私条款文字是否居中对齐（默认左对齐）
    public static final String PRIVACY_TEXT_GRAVITY_LEFT  = "left";                         //隐私条款文字是否居中对齐（默认左对齐）
    public static final String PRIVACY_TEXT_GRAVITY_CENTER  = "center";                     //隐私条款文字是否居中对齐（默认左对齐）
    public static final String PRIVACY_X = "privacyX";                                //隐私条款相对于屏幕左边x轴偏移
    public static final String PRIVACY_Y = "privacyY";                                //隐私条款相对于授权页面底部下边缘y偏移
    public static final String PRIVACY_W = "privacyW";                                      //隐私条款名称外的文字栏宽度(单位:dp)
    public static final String PRIVACY_H = "privacyH";                                      //隐私条款名称外的文字栏高度度(单位:dp)
    public static final String PRIVACY_BOOK_SYMBOL_ENABLE = "privacyBookSymbolEnable";      //隐私条款运营商协议名是否加书名号
    public static final String EnableHintToast = "unAgreePrivacyHintToast";                                      //导航栏颜色

    public static final String PRIVACY_CHECKBOX_OFFSET_X = "privacyCheckboxOffsetX";        //隐私条款checkbox x轴偏移
    public static final String PRIVACY_CHECKBOX_OFFSET_Y = "privacyCheckboxOffsetY";        //隐私条款checkbox y轴偏移
    public static final String OPEN_PRIVACY_IN_BROWSER = "openPrivacyInBrowser";            //隐私条款是否在浏览器打开
    public static final String PRIVACY_TEXT_BOLD = "privacyTextBold";                       //隐私条款文字加粗
    public static final String PRIVACY_UNDERLINE_TEXT = "privacyUnderlineText";             //隐私条款文字下划线
    public static final String PRIVACY_CHECKBOX_IN_CENTER = "privacyCheckboxInCenter";       //隐私条款checkbox是否居中对齐


    public static final String PRIVACY_CHECKBOX_HIDDEN  = "privacyCheckboxHidden";          //隐私条款checkbox是否隐藏
    public static final String PRIVACY_CHECKBOX_SIZE  = "privacyCheckboxSize";              //设置隐私条款checkbox尺寸
    public static final String PRIVACY_CHECK_ENABLE = "privacyCheckEnable";                 //隐私条款默认选中状态。默认不选中
    public static final String PRIVACY_CHECKBOX_IMAGE  = "privacyCheckedImage";             //隐私条款复选框选中图片
    public static final String PRIVACY_UNCHECKED_IMAGE = "privacyUncheckedImage";           //隐私条款复选框未选中图片

    public static final String PRIVACY_WEB_NAV_COLOR  = "privacyWebNavColor";               //协议展示web页面导航栏背景颜色
    public static final String PRIVACY_WEB_NAV_TITLE  = "privacyWebNavTitle";               //协议展示web页面导航栏标题（仅iOS）
    public static final String PRIVACY_WEB_NAV_TITLE_SIZE  = "privacyWebNavTitleSize";      //协议展示web页面导航栏标题文字大小
    public static final String PRIVACY_WEB_NAV_TITLE_COLOR  = "privacyWebNavTitleColor";    //协议展示web页面导航栏标题文字颜色
    public static final String PRIVACY_WEB_NAV_RETURN_IMAGE = "privacyWebNavReturnImage";   //协议展示web页面导航栏返回按钮图标
    public static final String PRIVACY_STATUS_BAR_COLOR_WITH_NAV = "privacyStatusBarColorWithNav"; //隐私页web状态栏是否与导航栏同色 only android
    public static final String PRIVACY_STATUS_BAR_DARK_MODE = "privacyStatusBarDarkMode"; //隐私页web状态栏是否暗色 only android
    public static final String PRIVACY_STATUS_BAR_TRANSPARENT = "privacyStatusBarTransparent"; //隐私页web页状态栏是否透明 only android
    public static final String PRIVACY_STATUS_BAR_HIDDEN = "privacyStatusBarHidden"; //隐私页web页状态栏是否隐藏 only android
    public static final String PRIVACY_NAV_TITLE_TEXT_BOLD = "privacyNavTitleTextBold";     //隐私页导航栏标题文字加粗
    public static final String PRIVACY_NAV_RETURN_BTN_PATH = "privacyNavReturnBtnPath";     //隐私页导航栏返回按钮图片路径
    //*******************************协议二次弹窗*******************************

    public static final String PRIVACY_CHHECK_DIALOG_GRAVITY_MODE_CENTER  = "privacyCheckDialogGravityModeCenter";       //协议二次弹窗居中对齐（默认下对齐bottom）

    public static final String PRIVACY_ENABLE_PRIVACY_CHHECK_DIALOG = "enablePrivacyCheckDialog";   //协议的二次弹窗

    public static final String PRIVACY_CHHECK_DIALOG_OFFSET_X = "setPrivacyCheckDialogOffsetX";   //协议的二次弹窗偏移X
    public static final String PRIVACY_CHHECK_DIALOG_OFFSET_Y = "setPrivacyCheckDialogOffsetY";   //协议的二次弹窗偏移Y

    public static final String PRIVACY_CHHECK_DIALOG_WIDTH = "setPrivacyCheckDialogWidth";   //协议的二次弹窗宽
    public static final String PRIVACY_CHHECK_DIALOG_HEIGHT = "setPrivacyCheckDialogHeight";   //协议的二次弹窗高

    public static final String PRIVACY_CHHECK_DIALOG_TITLE_TEXT = "setPrivacyCheckDialogTitleText";   //协议的二次弹窗标题
    public static final String PRIVACY_CHHECK_DIALOG_TITLE_TEXT_SIZE = "setPrivacyCheckDialogTitleTextSize";   //协议的二次弹窗标题字体大小
    public static final String PRIVACY_CHHECK_DIALOG_TITLE_TEXT_COLOR = "setPrivacyCheckDialogTitleTextColor";   //协议的二次弹窗标题字体颜色

    public static final String PRIVACY_CHHECK_DIALOG_CONTENT_TEXT_GRAVITY_MODE  = "setPrivacyCheckDialogContentTextGravity";   //协议的二次弹窗文字是否居中对齐
    public static final String PRIVACY_CHHECK_DIALOG_CONTENT_TEXT_GRAVITY_LEFT  = "left";                         //协议的二次弹窗文字是否居中对齐
    public static final String PRIVACY_CHHECK_DIALOG_CONTENT_TEXT_GRAVITY_CENTER  = "center";                     //协议的二次弹窗文字是否居中对齐

    public static final String PRIVACY_CHHECK_DIALOG_CONTENT_TEXT_SIZE = "setPrivacyCheckDialogContentTextSize";   //协议的二次弹窗内容字体大小

    public static final String PRIVACY_CHHECK_DIALOG_LOG_BTN_MARGIN_TOP = "setPrivacyCheckDialogLogBtnMarginT";   //协议的二次弹窗按钮区域距上偏移
    public static final String PRIVACY_CHHECK_DIALOG_LOG_BTN_MARGIN_BOTTOM = "setPrivacyCheckDialogLogBtnMarginB";   //协议的二次弹窗按钮区域距下偏移
    public static final String PRIVACY_CHHECK_DIALOG_LOG_BTN_MARGIN_LEFT = "setPrivacyCheckDialogLogBtnMarginL";   //协议的二次弹窗按钮区域距左偏移
    public static final String PRIVACY_CHHECK_DIALOG_LOG_BTN_MARGIN_RIGHET = "setPrivacyCheckDialogLogBtnMarginR";   //协议的二次弹窗按钮区域距右偏移

    public static final String PRIVACY_CHHECK_DIALOG_LOG_BTN_IMG_PATH = "setPrivacyCheckDialogLogBtnImgPath";   //协议的二次弹窗按钮背景图片

    public static final String PRIVACY_CHHECK_DIALOG_LOG_BTN_TEXT_COLOR = "setPrivacyCheckDialoglogBtnTextColor";   //协议的二次弹窗按钮字体颜色

    public static final String PRIVACY_CHHECK_DIALOG_LOG_BTN_WIDTH = "setPrivacyCheckDialogLogBtnWidth";   //协议的二次弹窗按钮宽
    public static final String PRIVACY_CHHECK_DIALOG_LOG_BTN_HEIGHT = "setPrivacyCheckDialogLogBtnHeight";   //协议的二次弹窗按钮高


    public static final String PRIVACY_CHHECK_DIALOG_LOG_BTN_TEXT = "setPrivacyCheckDialogLogBtnText";   //协议的二次弹窗按钮字体

    public static final String SET_PRIVACY_CHECK_DIALOG_CONTENT_TEXT_PADDING_L = "setPrivacyCheckDialogContentTextPaddingL";  //隐私协议弹窗内容文字左边距
    public static final String SET_PRIVACY_CHECK_DIALOG_CONTENT_TEXT_PADDING_T = "setPrivacyCheckDialogContentTextPaddingT";  //隐私协议弹窗内容文字上边距
    public static final String SET_PRIVACY_CHECK_DIALOG_CONTENT_TEXT_PADDING_R = "setPrivacyCheckDialogContentTextPaddingR";  //隐私协议弹窗内容文字右边距
    public static final String SET_PRIVACY_CHECK_DIALOG_CONTENT_TEXT_PADDING_B = "setPrivacyCheckDialogContentTextPaddingB";  //隐私协议弹窗内容文字下边距

    public static final String SET_PRIVACY_CHECK_DIALOG_BACKGROUND_COLOR = "setPrivacyCheckDialogBackgroundColor";  //隐私协议弹窗背景颜色
    public static final String SET_PRIVACY_CHECK_DIALOG_BACKGROUND_IMG_PATH = "setPrivacyCheckDialogBackgroundImgPath";  //隐私协议弹窗背景图片路径
    public static final String PRIVACY_VIEW_DARK_MODE = "privacyViewDarkMode";  //隐私协议弹窗暗黑模式

    public static final String CUSTOM_VIEW_NAME = "customViewName";
    public static final String CUSTOM_VIEW_POINT = "customViewPoint";
    public static final String CUSTOM_WIDGET_LIST = "customWidgetList";  // 自定义控件数组

    //*******************************验证码*******************************
    public static final String PHONE_NUMBER = "phoneNumber";
    public static final String SING_ID = "signID";
    public static final String TEMPLATE_ID = "templateID";

    // 授权页动画
    public static final String PRIVACY_NEED_START_ANIM = "privacyNeedStartAnim";
    public static final String PRIVACY_NEED_CLOSE_ANIM = "privacyNeedCloseAnim";
    // 授权页弹窗模式
    public static final String PRIVACY_DIALOG_THEME = "privacyDialogTheme";
    // 弹窗是否需要配置关闭按钮
    public static final String PRIVACY_NEED_CLOSE = "privacyNeedClose";
    // 弹窗关闭按钮模式
    public static final String PRIVACY_CLOSE_THEME = "privacyCloseTheme";

    //*******************************SMS*******************************
    public static final String SMS_UI_CONFIG = "smsUIConfig";
    public static final String SMS_AUTH_PAGE_BACKGROUND_IMAGE_PATH = "smsAuthPageBackgroundImagePath"; //登录界面背景图片
    public static final String SMS_NAV_TEXT = "smsNavText"; //导航栏标题文字
    public static final String SMS_SLOGAN_TEXT_SIZE = "smsSloganTextSize"; //设置 slogan 字体大小
    public static final String SMS_SLOGAN_HIDDEN = "isSmsSloganHidden"; //设置 slogan 字体是否隐藏  only android
    public static final String SMS_SLOGAN_TEXT_BOLD = "isSmsSloganTextBold"; //设置 slogan 字体是否加粗 only android
    public static final String SMS_SLOGAN_OFFSET_X = "smsSloganOffsetX"; //设置 slogan 相对于屏幕左边 x 轴偏移
    public static final String SMS_SLOGAN_OFFSET_Y = "smsSloganOffsetY"; //设置 slogan 相对于标题栏下边缘 y 偏移
    public static final String SMS_SLOGAN_OFFSET_BOTTOM_Y = "smsSloganOffsetBottomY"; //设置 slogan 相对于屏幕底部下边缘 y 轴偏移
    public static final String SMS_SLOGAN_TEXT_COLOR = "smsSloganTextColor"; //设置移动 slogan 文字颜色
    public static final String SMS_LOGO_WIDTH = "smsLogoWidth"; //设置 logo 宽度（单位：dp）
    public static final String SMS_LOGO_HEIGHT = "smsLogoHeight"; //设置 logo 高度（单位：dp）
    public static final String SMS_LOGO_OFFSET_X = "smsLogoOffsetX"; //设置 logo 相对于屏幕左边 x 轴偏移
    public static final String SMS_LOGO_OFFSET_Y = "smsLogoOffsetY"; //设置 logo 相对于标题栏下边缘 y 偏移
    public static final String SMS_LOGO_OFFSET_BOTTOM_Y = "smsLogoOffsetBottomY"; //设置 logo 相对于屏幕底部 y 轴偏移
    public static final String SMS_LOGO_HIDDEN = "isSmsLogoHidden"; //隐藏 logo
    public static final String SMS_LOGO_RES_NAME = "smsLogoResName"; //设置 logo 图片
    public static final String SMS_PHONE_TEXT_VIEW_OFFSET_X = "smsPhoneTextViewOffsetX"; //设置号码标题相对于屏幕左边 x 轴偏移  only android
    public static final String SMS_PHONE_TEXT_VIEW_OFFSET_Y = "smsPhoneTextViewOffsetY"; //设置号码标题相对于相对于标题栏下边缘 y 偏移 only android
    public static final String SMS_PHONE_TEXT_VIEW_TEXT_SIZE = "smsPhoneTextViewTextSize"; //设置号码标题字体大小  only android
    public static final String SMS_PHONE_TEXT_VIEW_TEXT_COLOR = "smsPhoneTextViewTextColor"; //设置号码标题文字颜色  only android
    public static final String SMS_PHONE_INPUT_VIEW_OFFSET_X = "smsPhoneInputViewOffsetX"; //设置号码输入框相对于屏幕左边 x 轴偏移
    public static final String SMS_PHONE_INPUT_VIEW_OFFSET_Y = "smsPhoneInputViewOffsetY"; //设置号码输入框相对于屏幕底部 y 轴偏移
    public static final String SMS_PHONE_INPUT_VIEW_WIDTH = "smsPhoneInputViewWidth"; //设置号码输入框宽度
    public static final String SMS_PHONE_INPUT_VIEW_HEIGHT = "smsPhoneInputViewHeight"; //设置号码输入框高度
    public static final String SMS_PHONE_INPUT_VIEW_TEXT_COLOR = "smsPhoneInputViewTextColor"; //设置手机号码输入框字体颜色
    public static final String SMS_PHONE_INPUT_VIEW_TEXT_SIZE = "smsPhoneInputViewTextSize"; //设置手机号码输入框字体大小
    public static final String SMS_VERIFY_CODE_TEXT_VIEW_OFFSET_X = "smsVerifyCodeTextViewOffsetX"; //设置验证码标题相对于屏幕左边 x 轴偏移  only android
    public static final String SMS_VERIFY_CODE_TEXT_VIEW_OFFSET_Y = "smsVerifyCodeTextViewOffsetY"; //设置验证码标题相对于相对于标题栏下边缘 y 偏移  only android
    public static final String SMS_VERIFY_CODE_TEXT_VIEW_TEXT_SIZE = "smsVerifyCodeTextViewTextSize"; //设置验证码标题字体大小  only android
    public static final String SMS_VERIFY_CODE_TEXT_VIEW_TEXT_COLOR = "smsVerifyCodeTextViewTextColor"; //设置验证码标题文字颜色  only android
    public static final String SMS_VERIFY_CODE_EDIT_TEXT_VIEW_TEXT_SIZE = "smsVerifyCodeEditTextViewTextSize"; //设置验证码输入框字体大小
    public static final String SMS_VERIFY_CODE_EDIT_TEXT_VIEW_TEXT_COLOR = "smsVerifyCodeEditTextViewTextColor"; //设置验证码输入框字体颜色
    public static final String SMS_VERIFY_CODE_EDIT_TEXT_VIEW_OFFSET_X = "smsVerifyCodeEditTextViewOffsetX"; //设置验证码输入框相对于屏幕左边 x 轴偏移
    public static final String SMS_VERIFY_CODE_EDIT_TEXT_VIEW_OFFSET_Y = "smsVerifyCodeEditTextViewOffsetY"; //设置验证码输入框相对于标题栏下边缘 y 偏移
    public static final String SMS_VERIFY_CODE_EDIT_TEXT_VIEW_OFFSET_R = "smsVerifyCodeEditTextViewOffsetR"; //设置验证码输入框相对于屏幕右边偏移
    public static final String SMS_VERIFY_CODE_EDIT_TEXT_VIEW_WIDTH = "smsVerifyCodeEditTextViewWidth"; //设置验证码输入框宽度
    public static final String SMS_VERIFY_CODE_EDIT_TEXT_VIEW_HEIGHT = "smsVerifyCodeEditTextViewHeight"; //设置验证码输入框高度
    public static final String SMS_GET_VERIFY_CODE_TEXT_VIEW_OFFSET_X = "smsGetVerifyCodeTextViewOffsetX"; //设置获取验证码按钮相对于屏幕左边 x 轴偏移
    public static final String SMS_GET_VERIFY_CODE_TEXT_VIEW_OFFSET_Y = "smsGetVerifyCodeTextViewOffsetY"; //设置获取验证码按钮相对于标题栏下边缘 y 偏移
    public static final String SMS_GET_VERIFY_CODE_TEXT_VIEW_TEXT_SIZE = "smsGetVerifyCodeTextViewTextSize"; //设置获取验证码按钮字体大小
    public static final String SMS_GET_VERIFY_CODE_TEXT_VIEW_TEXT_COLOR = "smsGetVerifyCodeTextViewTextColor"; //设置获取验证码按钮文字颜色
    public static final String SMS_GET_VERIFY_CODE_TEXT_VIEW_OFFSET_R = "smsGetVerifyCodeTextViewOffsetR"; //设置获取验证码按钮相对于屏幕右边偏移
    public static final String SMS_GET_VERIFY_CODE_BTN_BACKGROUND_PATH = "smsGetVerifyCodeBtnBackgroundPath"; //设置获取验证码按钮图片
    public static final String SMS_LOG_BTN_OFFSET_X = "smsLogBtnOffsetX"; //设置登录按钮相对于屏幕左边 x 轴偏移
    public static final String SMS_LOG_BTN_OFFSET_Y = "smsLogBtnOffsetY"; //设置登录按钮相对于标题栏下边缘 y 偏移
    public static final String SMS_LOG_BTN_WIDTH = "smsLogBtnWidth"; //设置登录按钮宽度
    public static final String SMS_LOG_BTN_HEIGHT = "smsLogBtnHeight"; //设置登录按钮高度
    public static final String SMS_LOG_BTN_TEXT_SIZE = "smsLogBtnTextSize"; //设置登录按钮字体大小
    public static final String SMS_LOG_BTN_BOTTOM_OFFSET_Y = "smsLogBtnBottomOffsetY"; //设置登录按钮相对屏幕底部 y 轴偏移
    public static final String SMS_LOG_BTN_TEXT = "smsLogBtnText"; //设置登录按钮文字
    public static final String SMS_LOG_BTN_TEXT_COLOR = "smsLogBtnTextColor"; //设置登录按钮文字颜色
    public static final String SMS_LOG_BTN_TEXT_BOLD = "isSmsLogBtnTextBold"; //设置登录按钮字体是否加粗
    public static final String SMS_LOG_BTN_BACKGROUND_PATH = "smsLogBtnBackgroundPath"; //设置授权登录按钮图片
    public static final String SMS_FIRST_SEPER_LINE_OFFSET_X = "smsFirstSeperLineOffsetX"; //第一分割线相对于屏幕左边 x 轴偏移 only android
    public static final String SMS_FIRST_SEPER_LINE_OFFSET_Y = "smsFirstSeperLineOffsetY"; //第一分割线相对于标题栏下边缘 y 偏移 only android
    public static final String SMS_FIRST_SEPER_LINE_OFFSET_R = "smsFirstSeperLineOffsetR"; //第一分割线相对于屏幕右边偏移 only android
    public static final String SMS_FIRST_SEPER_LINE_COLOR = "smsFirstSeperLineColor"; //第一分割线颜色 only android
    public static final String SMS_SECOND_SEPER_LINE_OFFSET_X = "smsSecondSeperLineOffsetX"; //第二分割线相对于屏幕左边 x 轴偏移 only android
    public static final String SMS_SECOND_SEPER_LINE_OFFSET_Y = "smsSecondSeperLineOffsetY"; //第二分割线相对于标题栏下边缘 y 偏移 only android
    public static final String SMS_SECOND_SEPER_LINE_OFFSET_R = "smsSecondSeperLineOffsetR"; //第二分割线相对于屏幕右边偏移 only android
    public static final String SMS_SECOND_SEPER_LINE_COLOR = "smsSecondSeperLineColor"; //第二分割线颜色 only android
    public static final String SMS_PRIVACY_TEXT_GRAVITY_CENTER = "isSmsPrivacyTextGravityCenter"; //设置隐私条款文字是否居中对齐（默认左对齐）
    public static final String SMS_PRIVACY_OFFSET_X = "smsPrivacyOffsetX"; //协议相对于屏幕左边 x 轴偏移
    public static final String SMS_PRIVACY_OFFSET_Y = "smsPrivacyOffsetY"; //协议相对于底部 y 偏移
    public static final String SMS_PRIVACY_TOP_OFFSET_Y = "smsPrivacyTopOffsetY"; //协议相对于标题栏下边缘 y 偏移
    public static final String SMS_PRIVACY_MARGIN_L = "smsPrivacyMarginL"; //设置协议相对于登录页左边的间距 only android
    public static final String SMS_PRIVACY_MARGIN_R = "smsPrivacyMarginR"; //设置协议相对于登录页右边的间距 only android
    public static final String SMS_PRIVACY_MARGIN_T = "smsPrivacyMarginT"; //设置协议相对于登录页顶部的间距 only android
    public static final String SMS_PRIVACY_MARGIN_B = "smsPrivacyMarginB"; //设置协议相对于登录页底部的间距 only android
    public static final String SMS_PRIVACY_CHECKBOX_SIZE = "smsPrivacyCheckboxSize"; //设置隐私条款 checkbox 尺寸
    public static final String SMS_PRIVACY_CHECKBOX_OFFSET_X = "smsPrivacyCheckboxOffsetX"; //设置隐私条款 checkbox 相对于屏幕左边 x 轴偏移
    public static final String SMS_PRIVACY_CHECKBOX_OFFSET_Y = "smsPrivacyCheckboxOffsetY"; //设置隐私条款 checkbox 相对于屏幕 y 轴偏移
    public static final String SMS_PRIVACY_CHECKBOX_IN_CENTER = "isSmsPrivacyCheckboxInCenter"; //设置隐私条款 checkbox 是否相对协议文字纵向居中
    public static final String SMS_PRIVACY_CHECKBOX_STATE = "smsPrivacyCheckboxState"; //设置隐私条款 checkbox 默认状态 : 是否选择 默认:NO
    public static final String SMS_PRIVACY_CHECKBOX_MARGIN = "smsPrivacyCheckboxMargin"; //设置协议相对于登录页的间距 only android
    public static final String SMS_PRIVACY_BEAN_LIST = "smsPrivacyBeanList"; //设置协议内容
    public static final String SMS_PRIVACY_CLAUSE_START = "smsPrivacyClauseStart"; //设置协议条款开头文本
    public static final String SMS_PRIVACY_CLAUSE_END = "smsPrivacyClauseEnd"; //设置协议条款结尾文本
    public static final String ENABLE_SMS_SERVICE = "enableSMSService"; //如果开启了短信服务，在认证服务失败时，短信服务又可用的情况下拉起短信服务
    //android独占
    public static final String SMS_PRIVACY_UNCHECKED_MSG = "smsPrivacyUncheckedMsg"; //短信协议没有被勾选的提示
    public static final String SMS_GET_CODE_FAIL_MSG = "smsGetCodeFailMsg"; //短信获取失败提示
    public static final String SMS_PHONE_INVALID_MSG = "smsPhoneInvalidMsg"; //手机号无效提示

}
