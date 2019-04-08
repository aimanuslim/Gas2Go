import 'package:flutter/material.dart';
import 'texts.dart';

class OrderDetailsPage extends StatefulWidget {
  @override
  OrderDetailsState createState() {
    return OrderDetailsState();
  }
}

class OrderDetailsState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text('Order Details'),
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
