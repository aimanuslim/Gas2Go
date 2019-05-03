import 'package:flutter/material.dart';

//Screen 13
class ConfirmOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          tooltip: "Previous Screen",
          icon: new Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: null,
        ),
        title: new Text("Confirm Address"),
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  new Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  new Text("Delivery Address"),
                ],
              ),
            ),
            new Expanded(
              child: new Container(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: new Text(
                              "No.18, Jalan SS15/2 Desa Petaling, Petaling Jaya 47305 Selangor"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            new Expanded(
              child: new SelectDifferentAddress(),
            ),
            new Container(
              child: new Center(
                child: FlatButton(
                  color: Colors.grey,
                  textColor: Colors.white,
                  onPressed: () => debugPrint("Confirm"),
                  child: new Text(
                    "Confirm Address",
                    style: new TextStyle(fontSize: 12.3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectDifferentAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: null,
        child: new Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(color: Colors.white30),
          child: new Text("Select a different address",
              style: new TextStyle(color: Colors.blueAccent, fontSize: 12.1)),
        ));
  }
}
