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
     * SDK判断网络环境是否支持
     * @param callback = (result) => {"enable":boolean}
     * */
    static checkLoginEnable(callback) {
        if (Platform.OS == 'android') {
            JVerificationModule.checkVerifyEnable(callback);
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
     * SDK获取号码认证token
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
     *
     * boolean:是否自动关闭授权页，true - 是，false - 否；若此字段设置为false，请在收到一键登录回调后调用SDK提供的关闭授权页面方法
     * */
    static login(enable) {
        if (Platform.OS == 'android') {
            JVerificationModule.loginAuth(enable);
        } else {
            JVerificationModule.getAuthorizationWithController(enable);
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

    /**
     * 设置一键登录页面样式
     *   均可选,需要在login前调用生效(ios需要将图片放入JVerificationResource.bundle)
     *   var customConfigParams = {
     *       backgroundImage: String                   //背景图
     *
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
     *       navReturnImage: string                    //导航栏左侧返回按钮图标
     *       navReturnX: int                           //导航栏返回按钮距屏幕左侧偏移 （仅Android)
     *       navReturnY: int                           //导航栏返回按钮距屏幕右侧偏移 （仅Android)
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
     *       privacyColor: intArray                    //[隐私条款名称颜色,隐私条款链接颜色]
     *       privacyText: StringArray                  //[隐私条款名称外的文字,隐私条款名称外的文字,隐私条款名称外的文字,隐私条款名称外的文字]
     *       privacyTextSize: int                      //隐私条款文字字体大小
     *       privacyTextGravityMode: String            //隐私条款文本对齐方式，目前仅支持 left、center
     *       privacyBookSymbolEnable: boolean          //隐私条款运营商协议名是否加书名号
     *       privacyX:int                              //隐私条款相对于屏幕左边x轴偏移
     *       privacyY:int                              //隐私条款相对于导航栏下边缘y偏移
     *       privacyW:int                              //隐私条款宽度
     *       privacyH:int                              //隐私条款高度
     *
     *       privacyCheckboxHidden: boolean            //隐私条款checkbox是否隐藏
     *       privacyCheckEnable: boolean               //隐私条款默认选中状态。默认不选中
     *       privacyCheckedImage: string               //隐私条款复选框选中图片
     *       privacyUncheckedImage: string             //隐私条款复选框未选中图片
     *
     *       privacyWebNavColor: int                   //协议展示web页面导航栏背景颜色
     *       privacyWebNavTitle:String                 //协议页导航栏标题（仅iOS）
     *       privacyWebNavTitleSize: int               //协议展示web页面导航栏标题文字大小
     *       privacyWebNavTitleColor: int              //协议展示web页面导航栏标题文字颜色
     *       privacyWebNavReturnImage: String      //协议展示web页面导航栏返回按钮图标
     *  }
     *
     *  var customViewParams = {
     *      'customViewName':String,                   //在index.js中注册的component
     *      'customViewPoint':StringArray              //[int,int] 基于屏幕左上角的x,y坐标点
     *  }
     *
     *  关于图片资源，Android请将图片放到res/drawable目录下,iOS请将图片放到JVerificationResour.bundle
     *  关于颜色，为colorInt，可在Android代码中直观的看到数值，例如Color.BLACK = -16777216,Color.WHITE = -1
     *  关于x,y,w,h，为保障显示效果，请同时设置。数值为
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

    //移除事件
    static removeListener(callback) {
        if (!listeners[callback]) {
            return;
        }
        listeners[callback].remove();
        listeners[callback] = null;
    }

}
