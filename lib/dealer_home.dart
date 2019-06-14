import 'package:flutter/material.dart';

import 'commonelements.dart';
import 'texts.dart';

// screen 9: Dealer homescreen //

class DealerHomePage extends StatefulWidget {
  @override
  DealerHomeState createState() {
    return DealerHomeState();
  }
}

class DealerHomeState extends State<DealerHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          'Gas2Go Dealer',
          textAlign: TextAlign.center,
        ),
      )),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Card(
                    child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          focusText("New Order !"),
                          normalText("Order #325346")
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child:
                              Center(child: smallText("Time left to respond"))),
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child:
                              Center(child: significantText("09:45 minutes"))),
                      headerText(string: "ITEMS"),
                      normalText("1 x LPG 14kg - NEW"),
                      getLine(top: 5, bottom: 5),
                      headerText(string: "DELIVERY ADDRESS"),
                      nameText("Ahmad Saiful"),
                      normalText("That long address............gsrerharehsh"),
                      getLine(top: 5, bottom: 5),
                      headerText(string: "DELIVERY PERIOD"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          headerText(headerSize: 11, string: "Date"),
                          normalText("Tuesday, 31st March 2019")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          headerText(headerSize: 11, string: "Time Frame"),
                          normalText("2 - 5 pm")
                        ],
                      ),
                      getLine(width: 2, top: 5, bottom: 5, color: Colors.blue),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          headerText(string: "Total amount"),
                          normalText("RM 45")
                        ],
                      ),
                      Center(
                        heightFactor: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              child: Text("Decline"),
                              color: Colors.redAccent,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {
                                int y = 5;
                              },
                            ),
                            FlatButton(
                              child: Text("Accept"),
                              color: Colors.greenAccent,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {
                                int y = 5;
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
                Card(
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          focusText("New Order!"),
                          normalText("Order #32425")
                        ],
                      )),
                ), // First order
                Card(
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          focusText("New Order!"),
                          normalText("Order #324436")
                        ],
                      )),
                ) // Second order
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: linkText(
                "View complete order history", null), // TODO: add > icon later
          )
        ],
      ),
    );
  }
}

// screen 10: Dealer complete order history //

class DealerOrderHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DealerOrderHistoryState();
}

class DealerOrderHistoryState extends State<DealerOrderHistory> {
  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: null),
          title: new Text("History"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onPressed: null,
            )
          ],
        ),
        body: new Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
          ),
          child: ListView(
            children: <Widget>[
              _order("Order #10912", "21st March, 10:15am"),
              Divider(
                color: Colors.grey,
              ),
              _order("Order #10859", "21st March, 10:15am"),
              Divider(
                color: Colors.grey,
              ),
              _order("Order #10459", "21st March, 10:15am"),
              Divider(
                color: Colors.grey,
              ),
            ],
          ),
        ),
      );
}

ListTile _order(String title, String subtitle) => ListTile(
      title: Text(title,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey),
      ),
    );

// screen 11: Dealer - order details //

