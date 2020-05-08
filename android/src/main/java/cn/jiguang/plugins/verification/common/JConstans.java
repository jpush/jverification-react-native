package cn.jiguang.plugins.verification.common;

public class JConstans {

    public static final String CODE = "code";
    public static final String TIME = "time";
    public static final String ENABLE = "enable";
    public static final String CONTENT = "content";
    public static final String OPERATOR = "operator";

    public static final String LOGIN_EVENT = "LoginEvent";

    public static final String PARAMS_NULL = "params cant be null";

    //*******************************自定义登录页面*******************************

    public static final String BACK_GROUND_IMAGE = "backgroundImage";                       //背景图

    public static final String STATUS_BAR_HIDDEN = "statusBarHidden";                       //状态栏是否隐藏
    public static final String STATUS_BAR_MODE = "statusBarMode";                           //状态栏模式。light和dark
    public static final String STATUS_BAR_MODE_LIGHT = "light";                             //状态栏暗色模式。
    public static final String STATUS_BAR_MODE_DARK = "dark";                               //状态栏暗色模式。仅在android 6.0以上设备生效。

    public static final String NAV_HIDDEN = "navHidden";                                    //导航栏是否隐藏
    public static final String NAV_COLOR = "navColor";                                      //导航栏颜色

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

    public static final String NUMBER_SIZE  = "numberSize";                                 //手机号码字体大小（单位:sp）
    public static final String NUMBER_COLOR  = "numberColor";                               //手机号码字体颜色
    public static final String NUMBER_X = "numberX";                                        //号码栏相对于屏幕左边x轴偏移
    public static final String NUMBER_Y = "numberY";                                        //号码栏相对于标题栏下边缘y偏移
    public static final String NUMBER_W = "numberW";                                        //号码栏宽度
    public static final String NUMBER_H = "numberH";                                        //号码栏高度

    public static final String SLOGAN_HIDDEN  = "sloganHidden";                             //slogan是否隐藏
    public static final String SLOGAN_TEXT_SIZE  = "sloganTextSize";                        //slogan字体大小
    public static final String SLOGAN_TEXT_COLOR  = "sloganTextColor";                      //slogan文字颜色
    public static final String SLOGAN_X = "sloganX";                                        //slogan相对于屏幕左边x轴偏移
    public static final String SLOGAN_Y = "sloganY";                                        //slogan相对于标题栏下边缘y偏移

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

    public static final String PRIVACY_ONE  = "privacyOne";                                 //隐私条款一
    public static final String PRIVACY_TWO  = "privacyTwo";                                 //隐私条款二
    public static final String PRIVACY_COLOR  = "privacyColor";                             //隐私条款颜色
    public static final String PRIVACY_TEXT  = "privacyText";                               //隐私条款名称外的文字
    public static final String PRIVACY_TEXT_SIZE  = "privacyTextSize";                      //隐私条款文字字体大小
    public static final String PRIVACY_TEXT_GRAVITY_MODE  = "privacyTextGravityMode";       //隐私条款文字是否居中对齐（默认左对齐）
    public static final String PRIVACY_TEXT_GRAVITY_LEFT  = "left";                         //隐私条款文字是否居中对齐（默认左对齐）
    public static final String PRIVACY_TEXT_GRAVITY_CENTER  = "center";                     //隐私条款文字是否居中对齐（默认左对齐）
    public static final String PRIVACY_X = "privacyOffsetX";                                //隐私条款相对于屏幕左边x轴偏移
    public static final String PRIVACY_Y = "privacyOffsetY";                                //隐私条款相对于授权页面底部下边缘y偏移
    public static final String PRIVACY_W = "privacyW";                                      //隐私条款名称外的文字栏宽度(单位:dp)
    public static final String PRIVACY_H = "privacyH";                                      //隐私条款名称外的文字栏高度度(单位:dp)
    public static final String PRIVACY_BOOK_SYMBOL_ENABLE = "privacyBookSymbolEnable";      //隐私条款运营商协议名是否加书名号

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

    public static final String CUSTOM_VIEW_NAME = "customViewName";
    public static final String CUSTOM_VIEW_POINT = "customViewPoint";

    //*******************************验证码*******************************
    public static final String PHONE_NUMBER = "phoneNumber";
    public static final String SING_ID = "signID";
    public static final String TEMPLATE_ID = "templateID";

    // 授权页动画
    public static final String PRIVACY_NEED_START_ANIM = "privacyNeedStartAnim";
    public static final String PRIVACY_NEED_CLOSE_ANIM = "privacyNeedCloseAnim";
    // 授权页弹窗模式
    public static final String PRIVACY_DIALOG_THEME = "privacyDialogTheme";

}
