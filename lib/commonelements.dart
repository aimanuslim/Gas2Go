import 'package:flutter/material.dart';
import 'texts.dart';

Widget getLine(
    {color: Colors.black87,
    double width: 1,
    double top: 0,
    double bottom: 0,
    double left: 0,
    double right: 0}) {
  return Padding(
      padding:
          EdgeInsets.only(top: top, bottom: bottom, right: right, left: left),
      child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: width, color: color)))));
}

Widget getOrderCard(context) {
  return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: new BoxDecoration(border: Border.all(color: Colors.grey)
            // new Border(top: BorderSide(
            //   color: Colors.grey
            // ))
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  headerText(string: "Items".toUpperCase()),
                  Text("1 x LPG 14 kg - NEW"),
                  Text("RM 35")
                ],
              ),
            ),
            new FlatButton(
              child: Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
              color: Theme.of(context).cardColor,
              onPressed: () {
                // Perform some action
              },
            )
          ],
        ),
      ));
}

