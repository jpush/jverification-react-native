import React from 'react';
import { StyleSheet, Text, View, TouchableHighlight, ScrollView, TextInput, Alert ,Platform } from 'react-native';
import JVerification from 'jverification-react-native'

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  setBtnStyle: {
    width: 280,
    justifyContent: 'center',
    alignItems: 'center',
    marginTop: 10,
    borderWidth: 1,
    borderColor: '#3e83d7',
    borderRadius: 8,
    backgroundColor: '#3e83d7',
    padding: 10
  },
  textStyle: {
    textAlign: 'center',
    fontSize: 25,
    color: '#ffffff'
  },
  inputText: {
    width: 180,
    fontSize: 15,
    marginLeft: 5,
    marginRight: 5,
    color: '#000000',
    padding: 10,
    textAlign: 'left'
  }
})

class Button extends React.Component {
  render() {
    return <TouchableHighlight
              onPress={this.props.onPress}
              underlayColor='#e4083f'
              activeOpacity={0.5}
            >
              <View
                style={styles.setBtnStyle}
              >
                <Text style={styles.textStyle}>{this.props.title}</Text>
              </View>
            </TouchableHighlight>
  }
}

//一键登录页面自定义配置，需要在调用login之前设置
var config = {
  navColor:-16742704,                  //导航栏颜色    
  navText: "一键登录",                  //导航栏标题
  navTextColor:-1,                     //导航栏标题文字颜色
  navReturnImage:"自定义返回按钮图片",    //导航栏左侧返回按钮
  
  logoHidden:false,                    //logo是否隐藏
  logoImage:"umcsdk_mobile_logo",      //logo(android默认为应用图标;ios默认无)
  logoWidth:100,                       //logo宽
  logoHeight:100,                      //logo高
  logoOffsetY:75,                      //logo相对导航栏向下偏移量
  
  numberColor:-16742704,               //手机号码文字颜色
  numOffsetY:200,                      //手机号码相对导航栏向下偏移量

  sloganTextColor:-16742704,           //slogan文字颜色
  sloganOffsetY:250,                   //slogan相对导航栏向下偏移量

  loginBtnText:"本机号码登录",                 //登录按钮文字
  loginBtnTextColor:-1,                      //登录按钮文字颜色
  loginBtnImageStyle:"自定义登录按钮样式",      //登录按钮selector选择样式 （仅android）
  loginBtnNormalImage:"自定义登录按钮正常图片",  //登录按钮正常图片 （仅ios,三个同时设置生效）
  loginBtnUnableImage:"自定义登录按钮失效图片",  //登录按钮失效图片  (仅ios,三个同时设置生效）
  loginBtnPressedImage:"自定义登录按钮按下图片", //登录按钮按下图片  (仅ios,三个同时设置生效）

  loginBtnOffsetY:280,                       //登录按钮相对导航栏向下偏移量
  
  privacyOneName:"自定义隐私条款一",           //隐私条款一
  privacyOneUrl:"https://www.jiguang.cn",   //隐私条款一链接
  privacyTwoName:"自定义隐私条款二",           //隐私条款二
  privacyTwoUrl:"https://www.jiguang.cn",   //隐私条款二链接
  privacyBasicColor:-16742704,              //隐私条款基础文字颜色
  privacyProtocolColor:-16777216,           //隐私条款文字颜色
  privacyCheckImage:"自定义选择图片",         //隐私条款复选框选中图片
  privacyUncheckImage:"自定义未选择图片",      //隐私条款复选框未选中图片
  privacyOffsetY:20                         //隐私条款相对底部向上偏移量
}

export default class App extends React.Component {
  constructor(props){
    super(props)
    this.state = {token:''}
  }

  render() {
    return (
      <View style={styles.container}>
        <Button title="init" 
          onPress={() => JVerification.init({appKey :"您的appKey"}) }/>


        <Button title="设置日志级别:Debug" 
          onPress={() => JVerification.setDebugEnable(true) }/>

        <Button title="checkVerifyEnable" 
          onPress={() => JVerification.checkVerifyEnable((res) => {
            Alert.alert("check verify enable",JSON.stringify(res));})}/>

        <Button title="getToken" 
          onPress={() => {
              if(Platform.OS == "android"){
                JVerification.requestPermission(res => {
                  if(res.code == 0){
                    JVerification.getToken(res => {
                      Alert.alert("get token", JSON.stringify(res));
                      if(res.code == 2000){
                          this.setState({ token: res.content });
                      }
                    });     
                  }else{
                    Alert.alert("requestPermission", JSON.stringify(res));
                  }
                  
                });
              }else{
                JVerification.getToken(res => {
                  Alert.alert("get token", JSON.stringify(res));
                  if (res.code == 2000) {
                    this.setState({ token: res.content });
                  }
                });
              }
            }
        }/>

        <Button title="numberVerify" 
        onPress={() => JVerification.verifyNumber({
          number: '13802286451',
          token: this.state.token
        },(res) => {
          Alert.alert('number verify', JSON.stringify(res));
        })}/>

        <Button title="customLoginUI" 
          onPress={() => JVerification.setLoginUIConfig(config)}/>

        <Button title="login" 
          onPress={() => JVerification.login((res) => {
            Alert.alert("login",JSON.stringify(res));})}/>
      </View>
    );
  }
}

// const styles = StyleSheet.create({
//   container: {
//     flex: 1,
//     justifyContent: 'center',
//     alignItems: 'center',
//     backgroundColor: '#F5FCFF',
//   },
//   welcome: {
//     fontSize: 20,
//     textAlign: 'center',
//     margin: 10,
//   },
//   instructions: {
//     textAlign: 'center',
//     color: '#333333',
//     marginBottom: 5,
//   },
// });