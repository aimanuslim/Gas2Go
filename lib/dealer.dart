import 'package:flutter/material.dart';
import 'texts.dart';
import 'commonelements.dart';

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
                            child: Center(
                                child: smallText("Time left to respond"))),
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Center(
                                child: significantText("09:45 minutes"))),
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
                        getLine(
                            width: 2, top: 5, bottom: 5, color: Colors.blue),
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
                  )
                  ),
                  Card(
                    child: Padding(padding: EdgeInsets.all(15), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        focusText("New Order!"),
                        normalText("Order #32425")
                      ],
                    )),), // First order
                    Card(
                    child: Padding(padding: EdgeInsets.all(15), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        focusText("New Order!"),
                        normalText("Order #324436")
                      ],
                    )),) // Second order
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(15),
              child: linkText("View complete order history"), // TODO: add > icon later
          )
          ],
          
        ),
        );
  }
}
