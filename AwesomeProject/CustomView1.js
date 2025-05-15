import React from 'react';
import {StyleSheet, Text, View,Alert,Image, TouchableHighlight} from 'react-native';
import JVerification from 'jverification-react-native';

export default class CustomView1 extends React.Component {
	createAlert = (title) =>
	  Alert.alert(
	    "提示",
	    title,
	    [
	      { text: "OK", onPress: () => console.log("OK Pressed") }
	    ]
	  );
	
	
	
    render() {
		
		return (
		  <View>
		          <TouchableHighlight onPress={() =>{
					  // this.createAlert("CustomView1 onClicked")
					  JVerification.dismissLoginPage()
				  }}>
		          <Image
		            source={{uri: "https://reactnative.dev/docs/assets/p_cat1.png"}}
		            style={{width: 50, height: 50}}
		          />
		          </TouchableHighlight>
		  </View>
		);
       //  return (
       //      <View style={styles.container}>
       //          <Button title="this is CustomView1"
       //                  onPress={() =>
							// this.createAlert("CustomView1 onClicked")
       //             }/>
       //      </View>
       //  );
    }
}



const styles = StyleSheet.create({
    container: {
        width: 150,
        height: 30,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#6FC6FC',
    }
});

class Button extends React.Component {
    render() {
        return <TouchableHighlight
            onPress={this.props.onPress}
            underlayColor='#e4083f'
            activeOpacity={0.5}>

            <View style={styles.setBtnStyle}>
                <Text style={styles.textStyle}>{this.props.title}</Text>
            </View>

        </TouchableHighlight>
    }
}
