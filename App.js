/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
} from 'react-native';

import { Router, Scene } from 'react-native-router-flux'
import HomeScreen from './components/home/homeScreen'
import UrlScreen from './components/url/url-screen'
import NavBarURlComponent from './components/url/url-navbar'

export default class App extends Component {
  constructor(){
    super();
    console.log();
    
  }
  render() {
    return (
      <Router>
        <Scene key="root">
          <Scene key="home" component={HomeScreen} title="Home" initial hideNavBar />
          <Scene key="url" component={UrlScreen} title="Url" hideNavBar />
          {/*<Scene key="lista" component={ListaScreen} title="Lista" hideNavBar modal />*/}
        </Scene>
      </Router>
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
