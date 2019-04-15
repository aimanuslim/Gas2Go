import 'package:flutter/material.dart';
import 'texts.dart';
import 'commonelements.dart';

//Screen 12
class CustomerHomePage extends StatefulWidget {
  @override
  CustomerHomeState createState() {
    return CustomerHomeState();
  }
}

class CustomerHomeState extends State<CustomerHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Gas 2 Go'),
      ),
      body: new ListView(
        children: <Widget>[
          new Card(
            child: new ListTile(
              title: const Text('Select your LPG'),
            ),
          ),
          new Container(
            decoration:
                new BoxDecoration(color: Theme.of(context).primaryColor),
            child: new TabBar(
              controller: _tabController,
              tabs: [
                new Tab(
                  // icon: const Icon(Icons.home),
                  text: 'New',
                ),
                new Tab(
                  // icon: const Icon(Icons.my_location),
                  text: 'Refill',
                ),
              ],
            ),
          ),
          new Container(
            height: 190.0,
            alignment: Alignment.center,
            child: new TabBarView(
              controller: _tabController,
              children: <Widget>[
                new Card(
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new RaisedButton(
                            child: const Text('LPG 14 kg'),
                            color: Theme.of(context).accentColor,
                            elevation: 4.0,
                            splashColor: Colors.blueGrey,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () {
                              // Perform some action
                            },
                          ),
                          new RaisedButton(
                            child: const Text('LPG 12 kg'),
                            color: Theme.of(context).accentColor,
                            elevation: 4.0,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            splashColor: Colors.amber,
                            onPressed: () {
                              // Perform some action
                            },
                          ),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new RaisedButton(
                            child: const Text('-'),
                            color: Theme.of(context).accentColor,
                            elevation: 4.0,
                            shape: new CircleBorder(
                                side: BorderSide(
                                    width: 0,
                                    color: Theme.of(context).accentColor)),
                            splashColor: Colors.amber,
                            onPressed: () {
                              // Perform some action
                            },
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child:
                                  Text("1")), //TODO: to replace with variable
                          new RaisedButton(
                            child: const Text('+'),
                            color: Theme.of(context).accentColor,
                            elevation: 4.0,
                            shape: new CircleBorder(
                                side: BorderSide(
                                    width: 0,
                                    color: Theme.of(context).accentColor)),
                            splashColor: Colors.amber,
                            onPressed: () {
                              // Perform some action
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Total Amount"),
                          Text("RM35.00")
                        ],
                      ),
                    ],
                  ),
                ),
                new Card(
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new RaisedButton(
                            child: const Text('LPG 14 kg'),
                            color: Theme.of(context).accentColor,
                            elevation: 4.0,
                            splashColor: Colors.blueGrey,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () {
                              // Perform some action
                            },
                          ),
                          new RaisedButton(
                            child: const Text('LPG 12 kg'),
                            color: Theme.of(context).accentColor,
                            elevation: 4.0,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            splashColor: Colors.amber,
                            onPressed: () {
                              // Perform some action
                            },
                          ),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new RaisedButton(
                            child: const Text('-'),
                            color: Theme.of(context).accentColor,
                            elevation: 4.0,
                            shape: new CircleBorder(
                                side: BorderSide(
                                    width: 0,
                                    color: Theme.of(context).accentColor)),
                            splashColor: Colors.amber,
                            onPressed: () {
                              // Perform some action
                            },
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child:
                                  Text("1")), //TODO: to replace with variable
                          new RaisedButton(
                            child: const Text('+'),
                            color: Theme.of(context).accentColor,
                            elevation: 4.0,
                            shape: new CircleBorder(
                                side: BorderSide(
                                    width: 0,
                                    color: Theme.of(context).accentColor)),
                            splashColor: Colors.amber,
                            onPressed: () {
                              // Perform some action
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Total Amount"),
                          Text("RM90.00")
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        // onPressed: _changeText,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    );
  }
}

class CustomerOrderPage extends StatefulWidget {
  @override
  CustomerOrderState createState() {
    return CustomerOrderState();
  }
}

//Screen 17
class CustomerOrderState extends State<CustomerOrderPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: new Text('Confirm Order')),
        body: new Column(children: <Widget>[
          Expanded(
              child: new ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      getOrderCard(context),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Card(
                      child: Column(
                    children: <Widget>[
                      Container(
                        decoration: new BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey))
                            // new Border(top: BorderSide(
                            //   color: Colors.grey
                            // ))
                            ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    headerText(
                                        string:
                                            "Delivery Address".toUpperCase()),
                                    Text(
                                      "Ahmad Saiful",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("The Very Long Address"),
                                    Text(
                                      "Change address",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 10),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Container(
                        decoration: new BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey))
                            // new Border(top: BorderSide(
                            //   color: Colors.grey
                            // ))
                            ),
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                headerText(
                                    string: "Delivery  Period".toUpperCase()),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Date"),
                                    Text("31st March ....",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Time Frame"),
                                    Text("2 - 5 pm",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ],
                                )
                              ],
                            )),
                      )
                    ],
                  ))),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, top: 10),
                          child: Text.rich(TextSpan(children: [
                            TextSpan(text: "Have a coupon code?"),
                            TextSpan(
                                text: " Enter here",
                                style: TextStyle(color: Colors.blue)),
                          ]))),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.black26))),
                            // child: Row(
                            //   children: <Widget>[
                            //     Expanded(
                            //       child: Text(""),
                            //     )
                            //   ],
                            // )
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              headerText(string: "Subtotal"),
                              normalText("RM45")
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              headerText(string: "Delivery fee"),
                              normalText("RM5")
                            ]),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: 5, bottom: 10, left: 10, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2, color: Colors.blueAccent))),
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                headerText(string: "Total amount"),
                                normalText("RM50")
                              ])),
                      Padding(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 10, left: 15, right: 15),
                          child: smallText(
                              "Please pay by cash upon delivery. We are working on online payments."))
                    ],
                  ),
                ),
              ),
            ],
          )),
          new RaisedButton(
            child: Text("Confirm Order", style: TextStyle(color: Colors.white)),
            color: Colors.black,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            elevation: 50,
            onPressed: () {
              // Perform some action
            },
          )
        ]));
  }
}

class CustomerRegisterAddressPage extends StatefulWidget {
  @override
  CustomerRegisterAddressState createState() => CustomerRegisterAddressState();
}

class CustomerRegisterAddressState extends State<CustomerRegisterAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Register'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: focusText(
                      "Please key in your full address for us to deliver the goods to you."),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.room),
                      linkText("Automatically detect my location", null),
                    ],
                  ),
                ),
                createFormField("Address 1", null, false, null),
                createFormField("Address 2", null, false, null),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Infinite width issue if not wrapped with expanded: https://github.com/flutter/flutter/issues/17036
                    Expanded(
                      child: createFormField("City", null, false, null),
                    ),
                    Expanded(
                      child: createFormField("Postcode", (value) {
                        if (!value.isEmpty &&
                            (!isNumeric(value) || value.length != 10)) {
                          return "Please enter a valid phone number.";
                        }
                      }, false, null),
                    ),
                  ],
                ),
                createFormField("State", null, false, null),
                Row(
                  children: <Widget>[
                    Checkbox(value: false),
                    focusText("Save this address")
                  ],
                ),
                createFormField("Home", null, false,
                    null) // may need just default value instead of a title for form
              ],
            ),
            CommonProceedButton(text: "Complete Registration")
          ],
        ));
  }
}