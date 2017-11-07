import React, { Component } from "react";
import { Platform, StyleSheet, View, ScrollView } from "react-native";

import { Button, Icon, Text, Item, Input } from "native-base";

import { Col, Row, Grid } from "react-native-easy-grid";

export default class UrlComponent extends Component {

  constructor(props){
    super(props);
  }

  render(){
    return(
      <View style={styles.container}>
        <Text>Url</Text>
      </View>
    )
  }

}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
    backgroundColor: "#f4f4f4"
  },

})