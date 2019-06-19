import 'package:flutter/material.dart';

class DeliveryWindow extends StatefulWidget {
  @override
  DeliveryWindowState createState() => new DeliveryWindowState();
}

class DeliveryWindowState extends State<DeliveryWindow> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          tooltip: "Previous Screen",
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: new Text("Select delivery period"),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              RadioListTile(
                title: Text("Deliver as soon as possible"),
                subtitle: Text(
                    "Same-day deliveries are only applicable for orders made by 12pm. Orders made after 12pm will be delivered the following day."),
                value: "deliver-asap",
                groupValue: "deliver-asap",
                onChanged: (String value) {
                  setState(() {
                    
                  });
                },
              ),
              RadioListTile(
                title: Text("Deliver later"),
                subtitle: Text(
                    "Typically customers will receive their orders within 2 days"),
                value: "deliver-later",
                groupValue: "deliver-asap",
                onChanged: (String value) {},
              )
            ],
          )),
    );
  }
}

// for (int i = 0; i < 3; i++) {
//   list.add(new RadioListTile(
//     value: i,
//     title: new Text('Radio $i'),
//     groupValue: _selected,
//     onChanged: (int value) {
//       onChanged(value);
//     },
//     activeColor: Colors.red,
//     secondary: new Icon(Icons.home),
//     subtitle: new Text('Sub Title here'),
//   ));
// }
