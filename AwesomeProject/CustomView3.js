import React from 'react';
import {StyleSheet, Text, View, TouchableHighlight} from 'react-native';

export default class CustomView3 extends React.Component {
    render() {
        return (
            <View style={styles.container}>
                <Button title="this is CustomView3"
                        onPress={() =>
                            console.log("CustomView3 onClicked")
                        }/>
            </View>
        );
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
