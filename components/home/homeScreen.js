/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from "react";
import { Platform, StyleSheet, View, ScrollView } from "react-native";

import NavBarHome from "./home-navbar";
import { Button, Icon, Text, Item, Input } from "native-base";

import { Col, Row, Grid } from "react-native-easy-grid";

import { Actions } from 'react-native-router-flux'

export default class HomeComponent extends Component {

  goUrl() {
    Actions.url();
  }

  render() {
    return (
      <View style={styles.container}>
        <Grid>
          <Col size={100}>

            <ScrollView>
              <Row>
                <Col>
                  <NavBarHome />
                </Col>
              </Row>
            </ScrollView>

            <View style={styles.entrada}>
              <View style={styles.dontUrl}>
                <Text>www.dontpad.com/</Text>

                <View style={{marginTop: 10, flexDirection: "row", justifyContent: "center" }} >
                  <Item regular style={{ flex: 5, marginLeft: 10 }}>
                    <Input placeholder="path..." />
                  </Item>
                  <View style={{flex: 2, marginLeft: 6, marginRight: 1, alignItems: "center",
                      justifyContent: "center"
                    }}
                  >
                    <Button rounded info style={{ padding: 10 }} onPress={this.goUrl.bind(this)}>
                      <Text style={{ color: "white" }}> Go! </Text>
                    </Button>
                  </View>
                </View>
              </View>

              <View style={styles.instru}>
                <Text style={styles.textoInstru}>1. Dont login, just use a URL</Text>
                <Text style={styles.textoInstru}>2. Dont save, text is auto-saved</Text>
                <Text style={styles.textoInstru}>3. Dont juggle attached files, edit online with your friends</Text>
                <Text style={styles.textoInstru}>4. Dont lose your content, download with YourURL.zip</Text>
                <Text style={styles.textoInstru}>5. Dont forget, you can use yourURL/yourFolder/yourSubfolder</Text>
              </View>

              <View />
            </View>

            <View style={styles.foo}>
              <Text>Footer</Text>
            </View>
          </Col>
        </Grid>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "flex-start",
    justifyContent: "space-around",
    flexDirection: "column",
    backgroundColor: "#f4f4f4"
  },

  nav: {
    backgroundColor: "blue",
    flex: 1
  },

  entrada: {
    flex: 11,
    backgroundColor: "#f4f4f4",
    flexDirection: "column",
    justifyContent: "space-around",
    alignItems: "center"
  },
  dontUrl: {
    flexDirection: "column",
    justifyContent: "space-around",
    alignItems: "center"
  },

  instru: {
    flex: 1,
    marginTop: 50,
    flexDirection: "column",
    justifyContent: 'flex-start',
    alignSelf: "stretch"
  },

  textoInstru: {
    padding: 10,
    fontSize: 15
  },

  foo: {
    flex: 1,
    backgroundColor: "whitesmoke",
    flexDirection: "row",
    justifyContent: "center",
    alignItems: "center",
    alignSelf: "stretch"
  }
});
