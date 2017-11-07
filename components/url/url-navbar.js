/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  View
} from 'react-native';

import FontAwesome, { Icons } from 'react-native-fontawesome';
import { Button, Icon, Text, Title } from "native-base";

import { Actions } from 'react-native-router-flux'

export default class NavBarURlComponent extends Component {

  constructor(props){
    super(props);

    this.state = {favoritado: false};
  }

  favoritar(){
    this.setState({favoritado: !this.state.favoritado});
  }

  goBack() {
    Actions.pop();
  }

  render() {
    return (
      <View style={styles.container}>
        <View style={styles.viewTitulo}>
          <Button transparent onPress={this.goBack.bind(this)}>
            <Text style={styles.his}>
              <FontAwesome>{Icons.arrowLeft}</FontAwesome>
            </Text>
            <Title> Url</Title>
          </Button>
        </View>
        
        <View style={styles.viewHis}>
          <Button transparent onPress={this.favoritar.bind(this)}>
            <Text style={styles.his}>
              <FontAwesome>{this.state.favoritado ? Icons.star : Icons.starO}</FontAwesome>
            </Text>
          </Button>
        </View>

      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignSelf: 'stretch',
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    backgroundColor: 'cornflowerblue',
    height: 57
  },

  viewTitulo: {
    marginLeft: 10,
    
  },
  titulo: {
    color: 'white',
    fontSize: 18,
  },

  viewHis: {
    marginRight: 40,
  },
  his: {
    color: 'white',
    fontSize: 20,
  },

});
