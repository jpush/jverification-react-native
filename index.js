import { 
    DeviceEventEmitter, 
    NativeModules,
    Platform
} from 'react-native'

const JVerificationModule = NativeModules.JVerificationModule

export default class JVerification {
    
    /**
     * 初始化 JVerification SDK
     * @param {Object} params = { android在build.gradle中配置
     *  appKey: String, // 极光官网注册的 appkey
     *  channel: String, // channel 发布渠道. 可选，默认为空
     *  advertisingId: String, // advertisingIdentifier 广告标识符（IDFA). 可选，默认为空
     *  isProduction: boolean // isProduction 是否生产环境. 如果为开发状态,设置为NO;如果为生产状态,应改为YES.可选，默认为NO
     * }
     */
    
    static init(params) {
        if(Platform.OS==="android"){
            JVerificationModule.init();
        }else{
            JVerificationModule.setupWithConfig(params);
        }
    }
    
    /**
     * 请在SDK启动后调用本接口, 调用本接口可打开日志级别为: Debug, 打印调试日志.
     * @param {boolean} enable 
     */
    static setDebugEnable(enable) {
        if(Platform.OS==="android"){
            JVerificationModule.setDebugMode(enable);
        }else{
            JVerificationModule.setDebug(enable);
        }
    }
    
     /**
     * 判断网络环境是否支持
     * @param {Function} callback = (result) => {
     *  result = {
     *      enable: boolean//true:支持，false:不支持
     *  }
     * }
     */
    static checkVerifyEnable(callback){
        JVerificationModule.checkVerifyEnable(callback);
    }

     /**
     * Android 权限获取:"android.permission.READ_PHONE_STATE"
     * @param {Function} callback = (result) => {
     *  result = {
     *      code: int,//0 获取成功，1 获取失败
     *      content: string
     *  }
     * }
     */
    static requestPermission(callback) {
        if (Platform.OS == "android") {
          JVerificationModule.requestPermission(callback);
        }
    }

    /**
     * 获取手机号校验token
     * @param {Function} callback = (result) => {
     *  result = {
     *      code: int,
     *      content: string
     *      operator：string
     *  }
     * }
     */
    static getToken(callback) {
        JVerificationModule.getToken(callback);
    }

    /**
     * 手机号校验
     * @param {Object} params = {
     *      number: string,
     *      token: string
     * }
     * @param {Function} callback = (result) => {
     *  result = {
     *      code: int,
     *      content: string,
     *      operator: string
     *  }
     * }
     */
    static verifyNumber(params, callback) {
        JVerificationModule.verifyNumber(params, callback);
    }

     /**
     * 一键登录
     * @param {Function} callback = (result) => {
     *  result = {
     *      code: int,
     *      content: string,
     *      operator: string
     *  }
     * }
     */
    static login(callback){
        if(Platform.OS=="android"){
            JVerificationModule.loginAuth(callback)
        }else{
            JVerificationModule.getAuthorizationWithController(callback)
        }
    }


    /** 
     * 设置一键登录页面样式
     *   均可选,需要在login前调用生效(ios需要将图片放入JVerificationResource.bundle)
     *   var config = {
     *       navColor:number,                  //导航栏颜色    
     *       navText: string,                  //导航栏标题
     *       navTextColor:number,              //导航栏标题文字颜色
     *       navReturnImage:string,            //导航栏左侧返回按钮
     *
     *       logoHidden:boolean,               //logo是否隐藏
     *       logoImage:string,                 //logo(android默认为应用图标;ios默认无)
     *       logoWidth:number,                 //logo宽
     *       logoHeight:number,                //logo高
     *       logoOffsetY:number,               //logo相对导航栏向下偏移量
     *
     *       numberColor:number,               //手机号码文字颜色
     *       numOffsetY:number,                //手机号码相对导航栏向下偏移量
     *
     *       sloganTextColor:number,           //slogan文字颜色
     *       sloganOffsetY:number,             //slogan相对导航栏向下偏移量
     *
     *       loginBtnText:string,              //登录按钮文字
     *       loginBtnTextColor:number,         //登录按钮文字颜色
     *       loginBtnImageStyle:string,        //登录按钮selector选择样式 （仅android）
     *       loginBtnNormalImage:string,       //登录按钮正常图片 （仅ios,三个同时设置生效）
     *       loginBtnUnableImage:string,       //登录按钮失效图片  (仅ios,三个同时设置生效）
     *       loginBtnPressedImage:string,      //登录按钮按下图片  (仅ios,三个同时设置生效）
     *       loginBtnOffsetY:number,           //登录按钮相对导航栏向下偏移量
     *
     *       privacyOneName:string,            //隐私条款一
     *       privacyOneUrl:string,             //隐私条款一链接
     *       privacyTwoName:string,            //隐私条款二
     *       privacyTwoUrl:string,             //隐私条款二链接
     *       privacyBasicColor:number,         //隐私条款基础文字颜色
     *       privacyProtocolColor:number,      //隐私条款文字颜色
     *       privacyCheckImage:string,         //隐私条款复选框选中图片
     *       privacyUncheckImage:string,       //隐私条款复选框未选中图片
     *       privacyOffsetY:number             //隐私条款相对底部向上偏移量
     *  }
    */
    static setLoginUIConfig(parmas){
        if(Platform.OS==="android"){
            JVerificationModule.setCustomUIWithConfig(parmas)
        }else{
            JVerificationModule.customUIWithConfig(parmas)
        }
    }

}
