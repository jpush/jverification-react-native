import {
    DeviceEventEmitter,
    NativeModules,
    Platform,
} from 'react-native';

const JVerificationModule = NativeModules.JVerificationModule;

const listeners = {};
const LoginEvent = 'LoginEvent';  //登录事件

export default class JVerification {

    /*
   * 设置调试模式，默认关闭状态
   *
   * 该接口需在 init 接口之前调用，避免出现部分日志没打印的情况
   * @param params = {"debug":boolean}
   * */
    static setLoggerEnable(params) {
        if (Platform.OS == 'android') {
            JVerificationModule.setDebugMode(params);
        }
    }

    static init(params, callback) {
        if (Platform.OS == 'android') {
            JVerificationModule.init(params, callback);
        }
    }

    static isInitSuccess(callback) {
        if (Platform.OS == 'android') {
            JVerificationModule.isInitSuccess(callback);
        }
    }

    static checkLoginEnable(callback) {
        if (Platform.OS == 'android') {
            JVerificationModule.checkVerifyEnable(callback);
        }
    }

    static getToken(params, callback) {
        if (Platform.OS == 'android') {
            JVerificationModule.getToken(params, callback);
        }
    }

    static preLogin(params, callback) {
        JVerificationModule.preLogin(params, callback);
    }

    static clearPreLoginCache() {
        JVerificationModule.clearPreLoginCache();
    }

    static login(params) {
        if (Platform.OS == 'android') {
            JVerificationModule.loginAuth(params);
        }
    }

    static dismissLoginPage() {
        if (Platform.OS == 'android') {
            JVerificationModule.dismissLoginAuthActivity();
        }
    }

    /**
     * 设置一键登录页面样式
     *   均可选,需要在login前调用生效(ios需要将图片放入JVerificationResource.bundle)
     *   var config = {
     *       backgroundImage: string                   //背景图
     *
     *       statusBarColorWithNav: boolean            //状态栏与导航栏同色。仅在android 5.0以上设备生效
     *       statusBarDarkMode: boolean                //状态栏暗色模式。仅在android 6.0以上设备生效。
     *       statusBarTransparent: boolean             //状态栏是否透明。仅在android 4.4以上设备生效。
     *       statusBarHidden: boolean                  //状态栏是否隐藏
     *
     *       navHidden: boolean                        //导航栏是否隐藏
     *       navColor: int                             //导航栏颜色
     *       navTitle: string                          //导航栏标题
     *       navTitleSize: int                         //导航栏标题文字字体大小(单位:sp）
     *       navTitleColor: number                     //导航栏标题文字颜色
     *       navTransparent: boolean                   //导航栏背景是否透明,默认不透明
     *
     *       navReturnBtnHidden: boolean               //导航栏返回按钮是否隐藏
     *       navReturnBtnImage: string                 //导航栏左侧返回按钮图标
     *       navReturnBtnWidth: int                    //导航栏返回按钮宽度
     *       navReturnBtnHeight: int                   //导航栏返回按钮高度
     *       navReturnBtnOffsetX: int                  //导航栏返回按钮距屏幕左侧偏移
     *       navReturnBtnRightOffsetX: int             //导航栏返回按钮距屏幕右侧偏移
     *       navReturnBtnOffsetY: int                  //导航栏返回按钮距上端偏移
     *
     *       logoHidden: boolean                       //logo是否隐藏
     *       logoImage: string                         //logo(android默认为应用图标;ios默认无)
     *       logoWidth: int                            //logo宽
     *       logoHeight: int                           //logo高
     *       logoOffsetX: int                          //logo相对于屏幕左边x轴偏移
     *       logoOffsetY: int                          //logo相对于标题栏下边缘y偏移
     *       logoOffsetBottomY: int                    //logo相对于屏幕底部y轴偏移
     *
     *       numberSize: int                           //手机号码字体大小（单位:sp）
     *       numberColor: int                          //手机号码字体颜色
     *       numberWidth: int                          //号码栏宽度
     *       numberHeight: int                         //号码栏高度
     *       numOffsetX: int                           //号码栏相对于屏幕左边x轴偏移
     *       numOffsetY: int                           //号码栏相对于标题栏下边缘y偏移
     *       numberOffsetBottomY: int                  //号码栏相对于屏幕底部y轴偏移
     *
     *       sloganHidden: boolean                     //slogan是否隐藏
     *       sloganTextSize: int                       //slogan字体大小
     *       sloganTextColor: int                      //slogan文字颜色
     *       sloganOffsetX: int                        //slogan相对于屏幕左边x轴偏移
     *       sloganOffsetY: int                        //slogan相对于标题栏下边缘y偏移
     *       sloganBottomOffsetY: int                  //slogan相对于屏幕底部下边缘y轴偏移
     *
     *       loginBtnText: string,                     //登录按钮文字
     *       loginBtnTextSize: int                     //登录按钮字体大小
     *       loginBtnTextColor: int                    //登录按钮文字颜色
     *       loginBtnImage: string                     //登录按钮selector选择样式 （仅android）
     *       loginBtnNormalImage: string               //登录按钮正常图片 （仅ios,三个同时设置生效）
     *       loginBtnUnableImage: string               //登录按钮失效图片  (仅ios,三个同时设置生效）
     *       loginBtnPressedImage: string              //登录按钮按下图片  (仅ios,三个同时设置生效）
     *       loginBtnWidth: int                        //登录按钮宽度
     *       loginBtnHeight: int                       //登录按钮高度
     *       loginBtnOffsetX: int                      //登录按钮相对于屏幕左边x轴偏移
     *       loginBtnOffsetY: int                      //登录按钮相对于标题栏下边缘y偏移
     *       loginBtnBottomOffsetY: int                //登录按钮相对屏幕底部y轴偏移
     *
     *       privacyOneName: string                    //隐私条款一名称
     *       privacyOneUrl: string                     //隐私条款一链接
     *       privacyTwoName: string                    //隐私条款二名称
     *       privacyTwoUrl: string                     //隐私条款二链接
     *       privacyNameColor: int                     //隐私条款名称颜色
     *       privacyUrlColor: int                      //隐私条款链接颜色
     *       privacyTextOne: String                    //隐私条款名称外的文字
     *       privacyTextTwo: String                    //隐私条款名称外的文字
     *       privacyTextThree: String                  //隐私条款名称外的文字
     *       privacyTextFour: String                   //隐私条款名称外的文字
     *       privacyTextWidth: int                     //隐私条款名称外的文字栏宽度(单位:dp)
     *       privacyOffsetX: int                       //隐私条款相对于屏幕左边x轴偏移
     *       privacyOffsetY: int                       //隐私条款相对于授权页面底部下边缘y偏移
     *       privacyTopOffsetY: int                    //隐私条款相对导航栏下端y轴偏移
     *       privacyTextGravityCenter: boolean         //隐私条款文字是否居中对齐（默认左对齐）
     *       privacyWithBookTitleMark: boolean         //隐私条款运营商协议名是否加书名号
     *      
     *       privacyCheckboxHidden: boolean            //隐私条款checkbox是否隐藏
     *       privacyCheckboxSize: boolean              //隐私条款checkbox尺寸
     *       privacyCheckboxImage: string              //隐私条款复选框选中图片
     *       privacyUnCheckboxImage: string            //隐私条款复选框未选中图片
     *       privacyCheckboxState: boolean             //隐私条款默认选中状态。默认不选中
     *       privacyCheckboxInCenter: boolean          //隐私条款checkbox是否相对协议文字纵向居中。默认居顶
     *       privacyToastEnable: boolean               //协议栏checkbox未选中时，点击登录按钮是否弹出toast提示用户勾选协议，默认不弹。支持自定义Toast。
     *
     *       privacyWebNavColor: int                   //协议展示web页面导航栏背景颜色
     *       privacyWebNavTitleColor: int              //协议展示web页面导航栏标题文字颜色
     *       privacyWebNavTitleSize: int               //协议展示web页面导航栏标题文字大小
     *       privacyWebNavReturnBtnImage: String       //协议展示web页面导航栏返回按钮图标
     *  }
     */
    static setLoginPageConfig(params) {
        if (Platform.OS == 'android') {
            JVerificationModule.setCustomUIWithConfig(params);
        }
    }

    static addLoginLoadingView(params) {
        if (Platform.OS == 'android') {
            
        }
    }

    static addLoginCustomView(params) {
        if (Platform.OS == 'android') {
            JVerificationModule.addCustomView(params);
        }
    }
    
    static addLoginNavCustomView(params) {
        if (Platform.OS == 'android') {
            JVerificationModule.addNavControlView(params);
        }
    }

    //事件监听
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

}
