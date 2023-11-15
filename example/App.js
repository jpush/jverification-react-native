import React from 'react';
import {StyleSheet, Text, View,Alert, TouchableHighlight, Platform} from 'react-native';
import JVerification from 'jverification-react-native';


const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    setBtnStyle: {
        width: 320,
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: 10,
        borderWidth: 1,
        borderColor: '#3e83d7',
        borderRadius: 8,
        backgroundColor: '#3e83d7',
        padding: 10,
    },
    textStyle: {
        textAlign: 'center',
        fontSize: 25,
        color: '#ffffff',
    },
});

class Button extends React.Component {
    render() {
        return <TouchableHighlight
            onPress={this.props.onPress}
            underlayColor='#e4083f'
            activeOpacity={0.5}
        >
            <View
                style={styles.setBtnStyle}>
                <Text
                    style={styles.textStyle}>
                    {this.props.title}
                </Text>
            </View>
        </TouchableHighlight>;
    }
}


const initParams = {
    'time': 5000,
    'appKey': 'a0e6ace8d5b3e0247e3f58db', //仅iOS
    'channel': 'channel',                 //仅iOS
    'advertisingId': 'advertisingId',     //仅iOS
    'isProduction': false,                //仅iOS
};

//一键登录页面自定义配置，需要在调用login之前设置


const customUIWithConfigiOS = {
    showWindow:false,
	navReturnHidden:false,
	//logo
	logoImage: 'umcsdk_mobile_logo', 
	logoConstraints:[0,-200,60,60],
	//number
	numberConstraints:[0,-132,200,14],
	//slogn
	sloganConstraints:[0,-112,200,14],
	//登录按钮
	logBtnConstraints:[0,-80,220,40],
	loginBtnText:"一键登录",
	loginBtnTextColor:0x0000FF,
	privacyConstraints:[0,180,200,60],
	checkViewConstraints:[-108,180,10,10],
	unAgreePrivacyCallBack:true,
	
	privacyOne: ['隐私条款一', 'https://www.jiguang.cn/about'],  //隐私条款一（显示名称和url，请严格按照格式）过期 2.7.3+不生效
	privacyTwo: ['隐私条款二', 'https://www.jiguang.cn/about'],  //隐私条款二（显示名称和url，请严格按照格式）过期 2.7.3+不生效
    privacyNameAndUrlBeanList: [{'name':'隐私条款一','url':'https://www.jiguang.cn/about','beforeName':'、'}, {'name':'隐私条款一','url':'https://www.jiguang.cn/about','beforeName':'、'}],
	privacyColor: [-16777216, -65536],                          //隐私条款颜色 （显示名称和url的颜色，请严格按照格式）
	privacyText: ['登录即同意', '并使用本机号码登录'],  //隐私条款名称外的文字
	privacyTextSize: 15,                                        //隐私条款文字字体大小
	privacyTextGravityMode: 'left',                             //隐私条款文本对齐方式，目前仅支持 left、center
	privacyBookSymbolEnable: false,                             //隐私条款是否显示书名号，默认不显示
	
}
const customUIWithConfigAndroid = {
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
    navReturnX: 5,                        //导航栏左侧返回按钮图标距屏幕上端偏移（仅Android)
    navReturnY: 5,                        //导航栏左侧返回按钮图标距屏幕左侧偏移（仅Android)
    navReturnW: 25,                        //导航栏左侧返回按钮图标宽度（仅Android)
    navReturnH: 25,                        //导航栏左侧返回按钮图标高度（仅Android)

    logoHidden: false,                        //logo是否隐藏
    logoImage: 'umcsdk_mobile_logo',          //logo(android默认为应用图标;)
    //为保障显示效果，请同时设置x,y,w,h
    // logoX: 50,                              //logo相对于屏幕左边x轴偏移
    // logoY: 50,                              //logo相对于标题栏下边缘y偏移
    // logoW: 100,                             //logo宽
    // logoH: 100,                              //logo高

    numberSize: 16,                           //手机号码字体大小（单位:sp）
    numberColor: -16777216,                   //手机号码字体颜色
    //为保障显示效果，请同时设置x,y,w,h
    // numberX: 50,                            //号码栏相对于屏幕左边x轴偏移
    // numberY: 100,                           //号码栏相对于标题栏下边缘y偏移
    // numberW: 250,                           //号码栏宽度
    // numberH: 25,                            //号码栏高度

    sloganHidden: false,                      //slogan是否隐藏
    sloganTextSize: 16,                       //slogan字体大小
    sloganTextColor: -16777216,               //slogan文字颜色
	
    //为保障显示效果，请同时设置x,y,w,h
    // sloganX: 50,                            //slogan相对于屏幕左边x轴偏移
    // sloganY: 150,                           //slogan相对于标题栏下边缘y偏移

    loginBtnText: '登录按钮',                  //登录按钮文字
    loginBtnTextSize: 16,                     //登录按钮字体大小
    loginBtnTextColor: -16777216,             //登录按钮文字颜色

    loginBtnImage: 'login_btn_selector',      //登录按钮selector选择样式 （仅android）
    loginBtnNormalImage: 'loginBtn_Nor',      //登录按钮正常图片 （仅ios,三个同时设置生效）
    loginBtnDisabledImage: 'loginBtn_Dis',    //登录按钮失效图片  (仅ios,三个同时设置生效）
    loginBtnSelectedImage: 'loginBtn_Hig',    //登录按钮按下图片  (仅ios,三个同时设置生效）
    //为保障显示效果，请同时设置x,y,w,h
    // loginBtnX: 50,                          //登录按钮相对于屏幕左边x轴偏移
    // loginBtnY: 200,                         //登录按钮相对于标题栏下边缘y偏移
    // loginBtnW: 250,                         //登录按钮宽度
    // loginBtnH: 40,                          //登录按钮高度

    privacyOne: ['隐私条款一', 'https://www.jiguang.cn/about'],  //隐私条款一（显示名称和url，请严格按照格式）过期 2.7.3+不生效
    privacyTwo: ['隐私条款二', 'https://www.jiguang.cn/about'],  //隐私条款二（显示名称和url，请严格按照格式）过期 2.7.3+不生效
    privacyNameAndUrlBeanList: [{'name':'隐私条款一','url':'https://www.jiguang.cn/about','beforeName':'、'}, {'name':'隐私条款一','url':'https://www.jiguang.cn/about','beforeName':'、'}],
    privacyColor: [-16777216, -65536],                          //隐私条款颜色 （显示名称和url的颜色，请严格按照格式）
    privacyText: ['登录即同意', '并使用本机号码登录1'],  //隐私条款名称外的文字
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
    privacyCheckboxSize:10,                                     //设置隐私条款checkbox尺寸 默认是10
	unAgreePrivacyHintToast: true,
	
    privacyWebNavColor: -16777216,                              //协议页导航栏背景颜色
    privacyWebNavTitle: '服务条款',                              //协议页导航栏标题（仅iOS）
    privacyWebNavTitleSize: 16,                                 //协议页导航栏标题字体大小
    privacyWebNavTitleColor: -1,                                //协议页导航栏标题字体颜色
    privacyWebNavReturnImage: 'close',                          //协议页导航栏返回按钮图片
    enablePrivacyCheckDialog: true,                             //是否开启协议二次弹窗
};

const customViewParams = [
    {customViewName: 'customView1', customViewPoint: [20, 200, 150, 30]},
    {customViewName: 'customView2', customViewPoint: [20, 300, 150, 30]},
    {customViewName: 'customView3', customViewPoint: [20, 400, 150, 30]},
];

const codeConfig = {
    phoneNumber :  "18925241111", //在此替换你的phoneNumber
    signID : "1",             //在此替换你的signID
    templateID : "1"         //在此替换你的templateID
};
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
//ios授权页弹窗模式
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
    privacyConstraints:[0,100,200,60],        //隐私条款布局对象
    checkViewConstraints:[-108,100,10,10],    //checkBox布局对象

    loadingConstraints:[0,0,20,20],
    showWindow:true,  // 是否弹窗，默认no
    //windowBackgroundImage:"bg", // 弹框内部背景图片
    windowBackgroundAlpha: 0.3,  //弹窗外侧 透明度 0~1.0
    windowCornerRadius:10, //弹窗圆角数值
    windowConstraints:[0,0,300,300], //弹窗布局对象
    windowCloseBtnImgs:["windowClose","windowClose"],//弹窗close按钮图片 @[普通状态图片，高亮状态图片]
    windowCloseBtnConstraints:[-135,-135,20,20],//弹窗close按钮布局,
}

export default class App extends React.Component {

  createAlert = (title) =>
    Alert.alert(
      "提示",
      title,
      [
        { text: "OK", onPress: () => console.log("OK Pressed") }
      ]
    );

    constructor(props) {
        super(props);
    }

    componentDidMount() {
        JVerification.setLoggerEnable(true);
        this.LoginListener = result => {
            console.log('LoginListener:' + JSON.stringify(result));
        };
        JVerification.addLoginEventListener(this.LoginListener);
		if(Platform.OS == 'ios'){
			this.UnCheckboxEvent = result => {
				console.log('UnCheckboxEvent:未选中隐私协议框');
				this.createAlert('Listener:未选中隐私协议框' );
			}
			JVerification.addUncheckBoxEventListener(this.UnCheckboxEvent);
		 }
    }

    render() {
        return (
            <View style={styles.container}>

                <Button title='init'
                        onPress={() => JVerification.init(initParams, result => {
                            console.log('init:' + JSON.stringify(result));
							this.createAlert('init:' + JSON.stringify(result));
                        })}/>

                <Button title='isInitSuccess'
                        onPress={() => JVerification.isInitSuccess(result => {
                            console.log('isInitSuccess:' + JSON.stringify(result));
							this.createAlert('isInitSuccess:' + JSON.stringify(result));
							})}/>
								
                <Button title='checkLoginEnable'
                        onPress={() => JVerification.checkLoginEnable(true,result => {
							console.log('checkLoginEnable:' + JSON.stringify(result));
							this.createAlert('checkLoginEnable:' + JSON.stringify(result));
						})}/>

                <Button title='getToken'
                        onPress={() => JVerification.getToken(5000, result => {
                            console.log('getToken:' + JSON.stringify(result));
							this.createAlert('getToken:' + JSON.stringify(result));
							
                        })}/>

                <Button title='preLogin'
                        onPress={() => JVerification.preLogin(5000, result => {
                            console.log('preLogin:' + JSON.stringify(result));
							this.createAlert('preLogin:' + JSON.stringify(result));
                        })}/>

                <Button title='addLoginCustomConfig'
                       onPress={() => {
                            if(Platform.OS == 'android'){
                                JVerification.addLoginCustomConfig(customUIWithConfigAndroid, customViewParams);
                            } else {
                                JVerification.addLoginCustomConfig(customUIWithConfigiOS, customViewParams);
                            }
                        }}/>

                <Button title='自定义弹窗授权页'
                        onPress={() => {
                            if(Platform.OS == 'android'){
                                JVerification.addLoginCustomConfig(androidDialogConfig, customViewParams);
                            } else {
                                JVerification.addLoginCustomConfig(iosDialogConfig, customViewParams);
                            }
                        }}/>

                <Button title='login'
                        onPress={() => JVerification.login(true)}/>

                <Button title='获取验证码' onPress={() => JVerification.getVerifyCode(codeConfig, result => {
                    console.log('获取验证码:' + JSON.stringify(result));
                })}/>

                <Button title='设置获取验证码时间间隔' onPress={() => JVerification.setCodeTime(1000)}/>


            </View>
        );
    }
}
