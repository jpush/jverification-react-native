import React from 'react';
import { StyleSheet, Text, View, TouchableHighlight, ScrollView, TextInput, Alert ,Platform } from 'react-native';
import JVerification from 'jverification-react-native'

var styles = StyleSheet.create({
  parent: {
    padding: 35,
    
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
  },
  setBtnStyle: {
    width: 180,
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

// type Props = {};

export default class App extends React.Component {
  constructor(props){
    super(props)
    this.state = {token:''}
  }

  render() {
    return (
      <View style={styles.container}>
        <Button title="init" 
          onPress={() => JVerification.init({
            appKey: 'your appkey',
            channel: 'the channel'
            })}/>
        
        <Button title="getToken" 
          onPress={() => {
              if(Platform.OS == "android"){
                JVerification.requestPermission(res => {
                  if(res.code == 0){
                    JVerification.getToken(res => {
                      Alert.alert("token", JSON.stringify(res));
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
                  Alert.alert("token", JSON.stringify(res));
                  if (res.code == 2000) {
                    this.setState({ token: res.content });
                  }
                });
              }
            }
        }/>

        <Button title="verifyNumber" 
        onPress={() => JVerification.verifyNumber({
          number: 'your number',
          token: this.state.token
        },(res) => {
          Alert.alert('token', JSON.stringify(res));
        })}/>

        <Button title="setDebug" 
          onPress={() => JVerification.setDebug(true)}/>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
