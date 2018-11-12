import React from 'react';
import { StyleSheet, Text, View, TouchableHighlight, ScrollView, TextInput, Alert  } from 'react-native';
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
  render() {
    return (
      <View style={styles.container}>
        <Button title="init" 
          onPress={() => JVerification.init({
            appKey: 'a1703c14b186a68a66ef86c1',
            channel: 'the channel'
            })}/>
        
        <Button title="getToken" 
          onPress={() => JVerification.getToken((res) => {
            Alert.alert('token', JSON.stringify(res));
          })}/>

        <Button title="verifyNumber" 
        onPress={() => JVerification.verifyNumber({
          number: 'the number',
          code: 'code'
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
