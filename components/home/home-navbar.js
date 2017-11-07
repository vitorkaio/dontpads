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
import { Button, Icon, Text } from "native-base";

export default class NavBarHomeComponent extends Component {
  render() {
    return (
      <View style={styles.container}>
        <View style={styles.viewTitulo}>
          <Text style={styles.titulo}>Dontpad</Text>
        </View>
        
        <View style={styles.viewHis}>
          <Button transparent>
            <Text style={styles.his}>
              <FontAwesome>{Icons.star}</FontAwesome>
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
