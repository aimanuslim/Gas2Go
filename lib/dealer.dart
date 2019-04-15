import 'package:flutter/material.dart';
import 'texts.dart';
import 'commonelements.dart';
import 'texts.dart';

//Screen 9
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
              child: linkText("View complete order history", null), // TODO: add > icon later
          )
          ],
          
        ),
        );
  }
}

// Screen 11
class DealerOrderDetailsPage extends StatefulWidget {
  @override
  DealerOrderDetailsState createState() {
    return DealerOrderDetailsState();
  }
}

class DealerOrderDetailsState  extends State<DealerOrderDetailsPage> {

@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            )),
        body: ListView(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    significantText("Order #3252"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                      Text(
                        "Total amount",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("RM 40")
                    ])
                  ])),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 3, bottom: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                headerText(string: "Delivered to"),
                nameText("Ahmad Saiful"),
                normalText("The long adress..............sdfgsgsdfgs")

              ],
              )
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                headerText(string: 'Order made on'),
                normalText(' 25 March 2019, 10.15 AM')
            ],)
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                headerText(string: 'Delivered on'),
                normalText(' 31st March 2019, 2.15 PM')
            ],)
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                headerText(string: "Items"),
                normalText("1 x LPG 14 kg NEW")
              ],

            )
            ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                headerText(string: "Amount Details", headerSize: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    headerText(string: "Subtotal"),
                    normalText("RM35")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    headerText(string: "Delivery fee"),
                    normalText("RM5")
                  ],
                )
              ],

            )
            )

        ]));
  }
}