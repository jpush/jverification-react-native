import {
    DeviceEventEmitter,
    NativeModules,
    Platform,
} from 'react-native';

const JVerificationModule = NativeModules.JVerificationModule;

const listeners = {};
const LoginEvent = 'LoginEvent';  //登录事件
const UnCheckBox = 'UncheckBoxCallBack';  //iOS 未选中隐私协议CheckBox,点击登录按钮的回调事件

export default class JVerification {

    /*
     * 设置调试模式，默认关闭状态
     * 该接口需在 init 接口之前调用，避免出现部分日志没打印的情况
     * @param enable = boolean
     * */
    static setLoggerEnable(enable) {
        if (Platform.OS == 'android') {
            JVerificationModule.setDebugMode(enable);
        } else {
            JVerificationModule.setDebug(enable);
        }
    }

    /*
     * SDK初始化
     * @param params = {'time':int,'appkey':String,'channel':String,'advertisingId':String,'isProduction':boolean}
     * @param callback = (result) => {"code":int,'content':String}
     *
     * time:初始化超时时间,单位毫秒，合法范围是(0,30000]，推荐设置为5000-10000,默认值为10000
     * appkey：极光系统应用唯一标识，必填                                                             (仅ios)
     * channel:应用发布渠道，可选                                                                    (仅ios)
     * advertisingId:广告标识符，可选                                                                (仅ios)
     * isProduction:是否生产环境。如果为开发状态，设置为false；如果为生产状态，应改为true。默认为false,可选  (仅ios)
     * */
    static init(params, callback) {
        if (Platform.OS == 'android') {
            JVerificationModule.init(params, callback);
        } else {
            JVerificationModule.setupWithConfig(params, callback);
        }
    }

    /*
     * 获取sdk初始化是否成功标识
     * @param callback = (result) => {"enable":boolean}
     * */
    static isInitSuccess(callback) {
        if (Platform.OS == 'android') {
            JVerificationModule.isInitSuccess(callback);
        } else {
            JVerificationModule.isSetupClient(callback);
        }
    }

    /*
     * SDK判断网络环境是否支持-是否开启严格模式
     * @param callback = (result) => {"enable":boolean}
     * */
    static checkLoginEnable(strictMode,callback) {
        if (Platform.OS == 'android') {
            JVerificationModule.checkVerifyEnable(strictMode,callback);
        } else {
            JVerificationModule.checkVerifyEnable(callback);
        }
    }

    /*
     * SDK获取号码认证token
     * @param time : int
     * @param callback = (result) => {"code":int,'content':String,'operator':String}
     *
     * time:超时时间（毫秒）,有效取值范围(0,10000],若小于等于0则取默认值5000.大于10000则取10000.为保证获取token的成功率，建议设置为3000-5000ms.
     * code:返回码，2000代表获取成功，其他为失败，详见错误码描述
     * content:成功时为token，可用于调用验证手机号接口。token有效期为1分钟，超过时效需要重新获取才能使用。失败时为失败信息
     * operator:成功时为对应运营商，CM代表中国移动，CU代表中国联通，CT代表中国电信。失败时可能为null
     * */
    static getToken(time, callback) {
        JVerificationModule.getToken(time, callback);
    }

    /*
     * SDK获取预取号token
     * @param time : int
     * @param callback = (result) => {"code":int,'content':String}
     *
     * time:超时时间（毫秒）,有效取值范围(0,10000],若小于等于0则取默认值5000.大于10000则取10000, 为保证预取号的成功率，建议设置为3000-5000ms
     * code:返回码，7000代表获取成功，其他为失败，详见错误码描述
     * content:调用结果信息描述
     * */
    static preLogin(time, callback) {
        JVerificationModule.preLogin(time, callback);
    }

    /*
     * SDK清除预取号缓存
     * */
    static clearPreLoginCache() {
        JVerificationModule.clearPreLoginCache();
    }

    /*
     * SDK请求授权一键登录
     * @param enable : boolean
     * @param time : int
     * @param callback = (result) => {"code":int,'content':String}
     * 
     * 
     * boolean:是否自动关闭授权页，true - 是，false - 否；若此字段设置为false，请在收到一键登录回调后调用SDK提供的关闭授权页面方法
     * time:超时时间（毫秒）,有效取值范围(0,10000],若小于等于0则取默认值5000.大于10000则取10000.为保证获取token的成功率，建议设置为3000-5000ms.
     * code:返回码，6000代表获取成功，其他为失败，详见错误码描述
     * content:成功时为logintoken,用于置换手机号
     * 
     * */
    static login(enable, time , callback) {
        if (Platform.OS == 'android') {
            JVerificationModule.loginAuth(enable, time , callback);
        } else {
            JVerificationModule.getAuthorizationWithController(enable, time , callback);
        }
    }

    /*
     * SDK关闭授权页面
     * */
    static dismissLoginPage() {
        if (Platform.OS == 'android') {
            JVerificationModule.dismissLoginAuthActivity();
        }
        else {
            JVerificationModule.dismissLoginController();
        }
    }


    static smsLogin(enable, time , callback) {
        if (Platform.OS == 'android') {
            JVerificationModule.smsLogin(enable, time , callback);
        } else {
            JVerificationModule.smsLogin(enable, time , callback);
        }
    }

    /**
     * 设置一键登录页面样式
     *   均可选,需要在login前调用生效(ios需要将图片放入JVerificationResource.bundle)
     *   var customConfigParams = {
     *       backgroundImage: String                   //背景图
     *       backgroundGifImage: String                //背景gif
     *       backgroundVideo: String                   //背景视频
     *       backgroundVideoPlaceHolderImage: String   //背景视频默认图
     *       appLanguageType: String                  //语言 0.中文简体（默认） 1.中文繁体 2.英文    
     * 
     *       statusBarTransparent: boolean             //状态栏是否透明
     *       statusBarHidden: boolean                  //状态栏是否隐藏
     *       statusBarMode: String                     //状态栏模式 light,dark
     *
     *       navHidden: boolean                        //导航栏是否隐藏
     *       navColor: int                             //导航栏颜色
     *
     *       navTitle: string                          //导航栏标题
     *       navTitleSize: int                         //导航栏标题文字字体大小(单位:sp）
     *       navTitleColor: number                     //导航栏标题文字颜色
     *
     *       navReturnHidden: boolean                  //导航栏返回按钮是否隐藏
     *       navTransparent: boolean                  //导航栏是否透明
     *       navReturnImage: string                    //导航栏左侧返回按钮图标
     *       navReturnX: int                           //导航栏返回按钮距屏幕左侧偏移 
     *       navReturnY: int                           //导航栏返回按钮距屏幕右侧偏移 
     *       navReturnW: int                           //导航栏返回按钮宽度 （仅Android)
     *       navReturnH: int                           //导航栏返回按钮高度 （仅Android)
     *
     *       logoHidden: boolean                       //logo是否隐藏
     *       logoImage: string                         //logo(android默认为应用图标;ios默认无)
     *       logoX: int                                //logo相对于屏幕左边x轴偏移
     *       logoY: int                                //logo相对于标题栏下边缘y偏移
     *       logoW: int                                //logo宽
     *       logoH: int                                //logo高
     *
     *       numberSize: int                           //手机号码字体大小（单位:sp）
     *       numberColor: int                          //手机号码字体颜色
     *       numberX: int                              //号码栏相对于屏幕左边x轴偏移
     *       numberY: int                              //号码栏相对于标题栏下边缘y偏移
     *       numberW: int                              //号码栏宽度
     *       numberH: int                              //号码栏高度
     *
     *       sloganHidden: boolean                     //slogan是否隐藏
     *       sloganTextSize: int                       //slogan字体大小
     *       sloganTextColor: int                      //slogan文字颜色
     *       sloganX: int                              //slogan相对于屏幕左边x轴偏移
     *       sloganY: int                              //slogan相对于标题栏下边缘y偏移
     *       sloganW: int,                             //slogan宽度 (仅iOS)
     *       sloganH: int,                             //slogan高度 (仅iOS)
     *
     *       loginBtnText: string,                     //登录按钮文字
     *       loginBtnTextSize: int                     //登录按钮字体大小
     *       loginBtnTextColor: int                    //登录按钮文字颜色
     *
     *       loginBtnImage: string                     //登录按钮selector选择样式 （仅android）
     *       loginBtnNormalImage: string               //登录按钮正常图片 （仅ios,三个同时设置生效）
     *       loginBtnDisabledImage: string             //登录按钮失效图片  (仅ios,三个同时设置生效）
     *       loginBtnSelectedImage: string             //登录按钮按下图片  (仅ios,三个同时设置生效）
     *       loginBtnX: int                            //登录按钮相对于屏幕左边x轴偏移
     *       loginBtnY: int                            //登录按钮相对于标题栏下边缘y偏移
     *       loginBtnW: int                            //登录按钮宽度
     *       loginBtnH: int                            //登录按钮高度
     *
     *       privacyOne: StringArray                   //[隐私条款一名称,隐私条款一链接]
     *       privacyTwo: StringArray                   //[隐私条款二名称,隐私条款二链接]
     *       privacyNameAndUrlBeanList                 //[{'name':'隐私条款一','url':'https://www.jiguang.cn/about','separator':'、'}, {'name':'隐私条款一','url':'https://www.jiguang.cn/about','separator':'、'}]
     *       privacyColor: intArray                    //[隐私条款名称颜色,隐私条款链接颜色]
     *       privacyText: StringArray                  //[隐私条款名称外的文字,隐私条款名称外的文字,隐私条款名称外的文字,隐私条款名称外的文字]
     *       privacyTextSize: int                      //隐私条款文字字体大小
     *       privacyTextGravityMode: String            //隐私条款文本对齐方式，目前仅支持 left、center
     *       privacyBookSymbolEnable: boolean          //隐私条款运营商协议名是否加书名号
     *       privacyX:int                              //隐私条款相对于屏幕左边x轴偏移
     *       privacyY:int                              //隐私条款相对于页面下边缘y偏移
     *       privacyW:int                              //隐私条款宽度
     *       privacyH:int                              //隐私条款高度
     *       textVerAlignment: String                  //设置条款文字是否垂直居中对齐(默认居中对齐) 0是top 1是m 2是b only iOS
     *       openPrivacyInBrowser: boolean            //是否在浏览器中打开隐私条款 默认是false  
     * 
     *       privacyCheckboxHidden: boolean            //隐私条款checkbox是否隐藏
     *       privacyCheckEnable: boolean               //隐私条款默认选中状态。默认不选中
     *       privacyCheckedImage: string               //隐私条款复选框选中图片
     *       privacyUncheckedImage: string             //隐私条款复选框未选中图片
     *       privacyCheckboxSize:int                   //设置隐私条款checkbox尺寸 默认是10
     *       isAlertPrivacyVC: boolean                 //是否在未勾选隐私协议的情况下 弹窗提示窗口 iOS
     *       enablePrivacyCheckDialog: boolean         //是否在未勾选隐私协议的情况下 弹窗提示窗口 Android
     *
     *       privacyWebNavColor: int                   //协议展示web页面导航栏背景颜色
     *       privacyWebNavTitle:String                 //协议页导航栏标题（仅iOS）
     *       privacyWebNavTitleSize: int               //协议展示web页面导航栏标题文字大小
     *       privacyWebNavTitleColor: int              //协议展示web页面导航栏标题文字颜色
     *       privacyWebNavReturnImage: String          //协议展示web页面导航栏返回按钮图标
     * 
     *       //////////iOS 二次弹窗////////////
     *       agreementAlertViewCornerRadius: double                  //协议二次弹窗的圆角
     *       agreementAlertViewBackgroundColor: int                  //协议二次弹窗背景颜色
     *       agreementAlertViewBackgroundImgPath: String            //协议二次弹窗背景图片
     *       agreementAlertViewTitleText: String                    //协议二次弹窗标题文本
     *       agreementAlertViewTitleTexSize: int                    //协议二次弹窗标题文本样式
     *       agreementAlertViewTitleTextColor: int                  //协议二次弹窗标题文本颜色
     *       agreementAlertViewContentTextAlignment: String        //协议二次弹窗内容文本对齐方式
     *       agreementAlertViewContentTextFontSize: int             //协议二次弹窗内容文本字体大小
     *       agreementAlertViewLogBtnText: String                   //协议二次弹窗登录按钮文本
     *       agreementAlertViewLogBtnTextFontSize: int             //协议二次弹窗登录按钮文本字体大小
     *       agreementAlertViewLoginBtnNormalImagePath: String      //协议二次弹窗登录按钮背景图片 - 激活状态的图片
     *       agreementAlertViewLoginBtnPressedImagePath: String     //协议二次弹窗登录按钮背景图片 - 高亮状态的图片
     *       agreementAlertViewLoginBtnUnableImagePath: String      //协议二次弹窗登录按钮背景图片 - 失效状态的图片
     *       agreementAlertViewLogBtnTextColor: int                 //协议二次弹窗登录按钮文本颜色
     *       agreementAlertViewUIFrames: object     //协议二次弹窗各控件的frame设置 { "superViewFrame": [left, top, width, height],"alertViewFrame": [left, top, width, height],"titleFrame": [left, top, width, height],"contentFrame": [left, top, width, height],"buttonFrame": [left, top, width, height]}
     *       //////////iOS 二次弹窗////////////
     * 
     *       //////////android 二次弹窗////////////
     *       privacyCheckDialogGravityModeCenter: boolean   //协议的二次弹窗对齐方式 目前仅支持 bottom、center  
     * 
     *       setPrivacyCheckDialogOffsetX: int         //隐私二次弹窗相对于屏幕左边x轴偏移 
     *       setPrivacyCheckDialogOffsetY: int         //隐私二次弹窗相对于屏幕左边x轴偏移 
     *       setPrivacyCheckDialogWidth: int           //隐私二次弹窗 宽
     *       setPrivacyCheckDialogHeight: int          //隐私二次弹窗 高
     *       
     *       setPrivacyCheckDialogTitleText:String     //协议二次弹窗标题
     *       setPrivacyCheckDialogTitleTextSize: int   //协议二次弹窗标题字号
     *       setPrivacyCheckDialogTitleTextColor: int  //协议二次弹窗标题文字颜色
     *     
     *       setPrivacyCheckDialogContentTextGravity: String  //协议的二次弹窗对齐方式 目前仅支持 left、center
     *       setPrivacyCheckDialogContentTextSize: int        //协议的二次弹窗文字大小
     * 
     *       setPrivacyCheckDialogLogBtnMarginL: int          //隐私二次弹窗相对于屏幕左边x轴偏移       
     *       setPrivacyCheckDialogLogBtnMarginT: int          //协议二次弹窗相对于屏幕左边y轴偏移
     *       setPrivacyCheckDialogLogBtnMarginB: int          //协议二次弹窗相对于屏幕左边b轴偏移
     *       setPrivacyCheckDialogLogBtnMarginR: int          //协议二次弹窗相对于屏幕右边x轴偏移
     * 
     *       setPrivacyCheckDialogLogBtnImgPath: String       //协议的二次弹窗按钮背景图片
     * 
     *       setPrivacyCheckDialoglogBtnTextColor: int        //协议二次弹窗按钮字体颜色
     * 
     *       setPrivacyCheckDialogLogBtnWidth: int           //隐私二次弹窗 登录按钮宽
     *       setPrivacyCheckDialogLogBtnHeight: int          //隐私二次弹窗 登录按钮高
     * 
     *       setPrivacyCheckDialogLogBtnText:String          //协议的二次弹窗按钮标题字体
     *
     *       setPrivacyCheckDialogContentTextPaddingL: int   //隐私协议弹窗内容文字左边距
     *       setPrivacyCheckDialogContentTextPaddingT: int   //隐私协议弹窗内容文字上边距
     *       setPrivacyCheckDialogContentTextPaddingR: int   //隐私协议弹窗内容文字右边距
     *       setPrivacyCheckDialogContentTextPaddingB: int   //隐私协议弹窗内容文字下边距
     *       //////////android 二次弹窗////////////
     * 
     *      smsUIConfig: {
                smsAuthPageBackgroundImagePath: String                   //登录界面背景图片
                smsNavText: String                                      //导航栏标题文字
                smsNavTextColor: int                                    //导航栏标题颜色 only iOS
                smsNavTextBold: bool                                    //导航栏标题是否加粗 only iOS
                smsNavTextSize: int                                     //导航栏标题大小 only iOS
                smsSloganTextSize: int                                 //设置slogan字体大小
                isSmsSloganHidden: bool                                //设置slogan字体是否隐藏 only android
                isSmsSloganTextBold: bool                              //设置slogan字体是否加粗 only android
                smsSloganOffsetX: int                                  //设置slogan相对于屏幕左边x轴偏移
                smsSloganOffsetY: int                                  //设置slogan相对于标题栏下边缘y偏移
                smsSloganOffsetBottomY: int                            //设置slogan相对于屏幕底部下边缘y轴偏移
                smsSloganWidth: int                                    //设置slogan宽度 only iOS
                smsSloganHeight: int                                   //设置slogan高度 only iOS
                smsSloganTextColor: int                                //设置移动slogan文字颜色
                smsLogoWidth: int                                      //设置logo宽度（单位：dp）
                smsLogoHeight: int                                     //设置logo高度（单位：dp）
                smsLogoOffsetX: int                                    //设置logo相对于屏幕左边x轴偏移
                smsLogoOffsetY: int                                    //设置logo相对于标题栏下边缘y偏移
                smsLogoOffsetBottomY: int                              //设置logo相对于屏幕底部y轴偏移
                isSmsLogoHidden: bool                                  //隐藏logo
                smsLogoResName: String                                 //设置logo图片
                smsPhoneTextViewOffsetX: int                           //设置号码标题相对于屏幕左边x轴偏移 only android
                smsPhoneTextViewOffsetY: int                           //设置号码标题相对于标题栏下边缘y偏移 only android
                smsPhoneTextViewTextSize: int                          //设置号码标题字体大小 only android
                smsPhoneTextViewTextColor: int                         //设置号码标题文字颜色 only android
                smsPhoneInputViewOffsetX: int                          //设置号码输入框相对于屏幕左边x轴偏移
                smsPhoneInputViewOffsetY: int                          //设置号码输入框相对于屏幕底部y轴偏移
                smsPhoneInputViewWidth: int                            //设置号码输入框宽度
                smsPhoneInputViewHeight: int                           //设置号码输入框高度
                smsPhoneInputViewTextColor: int                        //设置手机号码输入框字体颜色
                smsPhoneInputViewTextSize: int                         //设置手机号码输入框字体大小
                smsPhoneInputViewPlaceholderText: String               //设置手机号码输入框提示词 only iOS
                smsVerifyCodeTextViewOffsetX: int                      //设置验证码标题相对于屏幕左边x轴偏移 only android
                smsVerifyCodeTextViewOffsetY: int                      //设置验证码标题相对于标题栏下边缘y偏移 only android
                smsVerifyCodeTextViewTextSize: int                     //设置验证码标题字体大小 only android
                smsVerifyCodeTextViewTextColor: int                    //设置验证码标题文字颜色 only android
                smsVerifyCodeEditTextViewTextSize: int                 //设置验证码输入框字体大小
                smsVerifyCodeEditTextViewTextColor: int                //设置验证码输入框字体颜色
                smsVerifyCodeEditTextViewPlaceholderText: String       //设置验证码输入框提示词 only iOS
                smsVerifyCodeEditTextViewOffsetX: int                  //设置验证码输入框相对于屏幕左边x轴偏移
                smsVerifyCodeEditTextViewOffsetY: int                  //设置验证码输入框相对于标题栏下边缘y偏移
                smsVerifyCodeEditTextViewOffsetR: int                  //设置验证码输入框相对于屏幕右边偏移
                smsVerifyCodeEditTextViewWidth: int                    //设置验证码输入框宽度
                smsVerifyCodeEditTextViewHeight: int                   //设置验证码输入框高度
                smsGetVerifyCodeTextViewOffsetX: int                   //设置获取验证码按钮相对于屏幕左边x轴偏移
                smsGetVerifyCodeTextViewOffsetY: int                   //设置获取验证码按钮相对于标题栏下边缘y偏移
                smsGetVerifyCodeTextViewTextSize: int                  //设置获取验证码按钮字体大小
                smsGetVerifyCodeTextViewTextColor: int                 //设置获取验证码按钮文字颜色
                smsGetVerifyCodeTextViewOffsetR: int                   //设置获取验证码按钮相对于屏幕右边偏移
                smsGetVerifyCodeBtnWidth: int                          //设置获取验证码按钮宽度 only iOS
                smsGetVerifyCodeBtnHeight: int                         //设置获取验证码按钮高度 only iOS
                smsGetVerifyCodeBtnCornerRadius: int                   //设置获取验证码按钮圆角度数 only iOS
                smsGetVerifyCodeBtnBackgroundPath: String              //设置获取验证码按钮图片
                smsGetVerifyCodeBtnBackgroundPaths: StringArray       //设置获取验证码按钮图片[激活状态,失效状态,高亮状态] only iOS
                smsGetVerifyCodeBtnText: String                        //设置获取验证码按钮文字 only iOS
                smsLogBtnOffsetX: int                                  //设置登录按钮相对于屏幕左边x轴偏移
                smsLogBtnOffsetY: int                                  //设置登录按钮相对于标题栏下边缘y偏移
                smsLogBtnWidth: int                                    //设置登录按钮宽度
                smsLogBtnHeight: int                                   //设置登录按钮高度
                smsLogBtnTextSize: int                                 //设置登录按钮字体大小
                smsLogBtnBottomOffsetY: int                           //设置登录按钮相对屏幕底部y轴偏移
                smsLogBtnText: String                                  //设置登录按钮文字
                smsLogBtnTextColor: int                                //设置登录按钮文字颜色
                isSmsLogBtnTextBold: bool                              //设置登录按钮字体是否加粗
                smsLogBtnBackgroundPath: String                        //设置授权登录按钮图片
                smsLogBtnBackgroundPaths: String                       //设置授权登录按钮图片[激活状态,失效状态,高亮状态] only iOS
                smsFirstSeperLineOffsetX: int                          //第一分割线相对于屏幕左边x轴偏移 only android
                smsFirstSeperLineOffsetY: int                          //第一分割线相对于标题栏下边缘y偏移 only android
                smsFirstSeperLineOffsetR: int                          //第一分割线相对于屏幕右边偏移 only android
                smsFirstSeperLineColor: int                            //第一分割线颜色 only android
                smsSecondSeperLineOffsetX: int                         //第二分割线相对于屏幕左边x轴偏移 only android
                smsSecondSeperLineOffsetY: int                         //第二分割线相对于标题栏下边缘y偏移 only android
                smsSecondSeperLineOffsetR: int                         //第二分割线相对于屏幕右边偏移 only android
                smsSecondSeperLineColor: int                           //第二分割线颜色 only android
                isSmsPrivacyTextGravityCenter: bool                    //设置隐私条款文字是否居中对齐（默认左对齐）
                smsPrivacyColor: IntArray                             //设置隐私条款名称颜色[基础文字颜色,协议文字颜色] only iOS
                smsPrivacyTextVerAlignment: int                        //设置隐私条款垂直对齐方式 0:top 1:middle 2:bottom only iOS
                smsPrivacyOffsetX: int                                 //协议相对于屏幕左边x轴偏移
                smsPrivacyOffsetY: int                                 //协议相对于底部y偏移
                smsPrivacyTopOffsetY: int                              //协议相对于标题栏下边缘y偏移
                smsPrivacyWidth: int                                   //协议宽度 only iOS
                smsPrivacyHeight: int                                  //协议高度 only iOS
                smsPrivacyMarginL: int                                 //设置协议相对于登录页左边的间距 only android
                smsPrivacyMarginR: int                                 //设置协议相对于登录页右边的间距 only android
                smsPrivacyMarginT: int                                 //设置协议相对于登录页顶部的间距 only android
                smsPrivacyMarginB: int                                 //设置协议相对于登录页底部的间距 only android
                smsPrivacyCheckboxSize: int                            //设置隐私条款checkbox尺寸
                smsPrivacyCheckboxOffsetX: int                         //设置隐私条款checkbox相对于屏幕左边x轴偏移
                smsPrivacyCheckboxOffsetY: int                         //设置隐私条款checkbox相对于屏幕y轴偏移
                isSmsPrivacyCheckboxInCenter: bool                     //设置隐私条款checkbox是否相对协议文字纵向居中
                smsPrivacyCheckboxState: bool                          //设置隐私条款checkbox默认状态:是否选择 默认:NO
                smsPrivacyCheckboxMargin: IntArray                    //设置协议相对于登录页的间距 only android
                smsPrivacyCheckboxUncheckedImgPath: String             //设置隐私条款checkbox未选中时图片 only iOS
                smsPrivacyCheckboxCheckedImgPath: String               //设置隐私条款checkbox选中时图片 only iOS
                smsPrivacyBeanList: Array                    //[{'name':'隐私条款一','url':'https://www.jiguang.cn/about','separator':'、'}, {'name':'隐私条款一','url':'https://www.jiguang.cn/about','separator':'、'}]
                smsPrivacyClauseStart: String                          //设置协议条款开头文本
                smsPrivacyClauseEnd: String                            //设置协议条款结尾文本
                enableSMSService: bool                                 //如果开启了短信服务,在认证服务失败时,短信服务又可用的情况下拉起短信服务
                //android独占
                smsPrivacyUncheckedMsg: String                         //短信协议没有被勾选的提示
                smsGetCodeFailMsg: String                              //短信获取失败提示
                smsPhoneInvalidMsg: String                             //手机号无效提示
     *      }
     * 
     *  }
     *
     *  var customViewParams = {
     *      'customViewName':String,                   //在index.js中注册的component
     *      'customViewPoint':StringArray              //[int,int,int,int] 基于屏幕左上角的x,y,w,h
     *  }
     *
     *  关于图片资源，Android请将图片放到res/drawable目录下,iOS请将图片放到JVerificationResour.bundle
     *  关于颜色，为colorInt，可在Android代码中直观的看到数值，例如Color.BLACK = -16777216,Color.WHITE = -1
     *  关于x,y,w,h，为保障显示效果，请同时设置。
     */
    static addLoginCustomConfig(customConfigParams, customViewParams) {
        if (Platform.OS == 'android') {
            JVerificationModule.setCustomUIWithConfig(customConfigParams, customViewParams);
        } else {
            JVerificationModule.customUIWithConfig(customConfigParams, customViewParams);
        }
    }

    /*
     * 登录事件监听
     * @param callback = result => {'code':int,'content':String,'operator':String}
     * */
    static addLoginEventListener(callback) {
        listeners[callback] = DeviceEventEmitter.addListener(
            LoginEvent, result => {
                callback(result);
            });
    }

    static addUncheckBoxEventListener(callback) {
		    listeners[callback] = DeviceEventEmitter.addListener(
		        UnCheckBox, result => {
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
    /*
    * SDK获取验证码
    * @param params = {'phonenum':String,'signid':String,'tempid':String}
    * @param callback = (result) => {"code":int,'msg':String}
    * */
    static getVerifyCode(params,callback) {
        JVerificationModule.getSmsCode(params,callback);
    }

    /*
     * 设置前后两次获取验证码的时间间隔
     * @param time : int
     * */
    static setCodeTime(time) {
        JVerificationModule.setTimeWithConfig(time);
    }

}
