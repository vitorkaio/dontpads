import React, { Component } from "react";
import { Platform, StyleSheet, View, ScrollView } from "react-native";

import { Button, Icon, Text, Item, Input } from "native-base";
import { Col, Row, Grid } from "react-native-easy-grid";

import NavBarURlComponent from './url-navbar'

export default class UrlComponent extends Component {

  constructor(props){
    super(props);
  }

  render(){
    return(
      <View style={styles.container}>
        <Grid>
          <Col size={100}>
            <ScrollView>
              <Row>
                <Col>
                  <NavBarURlComponent />
                </Col>
              </Row>
            </ScrollView>
            
            <View style={styles.content}>
              <Text>Url</Text>
            </View>

          </Col>
        </Grid>
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

  content: {
    flex: 11,
    alignItems: "center",
    justifyContent: "center",
    backgroundColor: "green"
  }

})