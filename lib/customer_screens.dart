import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gas2go/texts.dart';
import 'commonelements.dart';

class HomeNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EZGas',
      theme: ThemeData(
          brightness: Brightness.dark,
          backgroundColor: Color(0xff45569B),
          primaryColor: Color(0xff45569B),
          accentColor: Color(0xff2892D7),
          cardColor: Color(0xff3D4C8A),
          bottomAppBarColor: Color(0xff3D4C8A)),
      home: CustomerAppEntry(),
    );
  }
}

class CustomerAppEntry extends StatefulWidget {
  @override
  _CustomerAppEntryState createState() => _CustomerAppEntryState();
}

class _CustomerAppEntryState extends State<CustomerAppEntry> {
  // final Key keyOne = PageStorageKey('pageOne');
  // final Key keyTwo = PageStorageKey('pageTwo');

  int currentTab = 0;

  CustomerHomePage one;
  TransactionHistory two;
  ProfileTab three;
  List<Widget> pages;
  Widget currentPage;

  // List<Data> dataList;
  // final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    one = CustomerHomePage();
    two = TransactionHistory();
    three = ProfileTab();

    pages = [one, two, three];

    currentPage = one;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("NavBar demo"),
      // ),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        unselectedItemColor: Color(0xff808080),
        selectedItemColor: Color(0xff00B3EF),
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            title: Text("Transactions"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
}

// class PageOne extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Homepage"),
//         backgroundColor: Colors.green,
//       ),
//       backgroundColor: Colors.green,
//     );
//   }
// }

// class PageTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300.0,
//       color: Colors.pink,
//     );
//   }
// }

// class PageThree extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300.0,
//       color: Colors.orange,
//     );
//   }
// }

// Home Tab - Screen 12 //

class CustomerHomePage extends StatefulWidget {
  @override
  CustomerHomePageState createState() {
    return CustomerHomePageState();
  }
}

class CustomerHomePageState extends State<CustomerHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: new Text('EZ Gas'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: new ListView(
        children: <Widget>[
          new Container(
            color: Theme.of(context).backgroundColor,
            child: new ListTile(
              title: new Text(
                'Select your LPG',
                style: new TextStyle(color: Colors.white),
              ),
            ),
          ),
          new Container(
              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
              child: new Column(
                children: <Widget>[
                  new TabBar(
                    controller: _tabController,
                    indicatorColor: Theme.of(context).accentColor,
                    tabs: [
                      new Tab(
                        // icon: const Icon(Icons.home),
                        text: 'New',
                      ),
                      new Tab(
                          // icon: const Icon(Icons.my_location),
                          text: 'Refill'),
                    ],
                  ),
                  new Container(
                    height: 200.0,
                    alignment: Alignment.center,
                    child: new TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        new Card(
                          color: Theme.of(context).cardColor,
                          child: new Column(
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new RaisedButton(
                                    child: new Text(
                                      'LPG 14 kg',
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                    color: Theme.of(context).accentColor,
                                    elevation: 4.0,
                                    splashColor: Colors.blueGrey,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      // Perform some action
                                    },
                                  ),
                                  new RaisedButton(
                                    child: new Text(
                                      'LPG 12 kg',
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                    color: Theme.of(context).accentColor,
                                    elevation: 4.0,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
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
                                    child: new Text(
                                      '-',
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                    color: Theme.of(context).accentColor,
                                    elevation: 4.0,
                                    shape: new CircleBorder(
                                        side: BorderSide(
                                            width: 0,
                                            color:
                                                Theme.of(context).accentColor)),
                                    splashColor: Colors.amber,
                                    onPressed: () {
                                      // Perform some action
                                    },
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                    child: Text("1",
                                        style:
                                            new TextStyle(color: Colors.white)),
                                  ), //TODO: to replace with variable
                                  new RaisedButton(
                                    child: new Text(
                                      '+',
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                    color: Theme.of(context).accentColor,
                                    elevation: 4.0,
                                    shape: new CircleBorder(
                                        side: BorderSide(
                                            width: 0,
                                            color:
                                                Theme.of(context).accentColor)),
                                    splashColor: Colors.amber,
                                    onPressed: () {
                                      // Perform some action
                                    },
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(15.0),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "Total Amount",
                                    style: new TextStyle(color: Colors.white70),
                                  ),
                                  Text(
                                    "RM115.00",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        new Card(
                          color: Theme.of(context).cardColor,
                          child: new Column(
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new RaisedButton(
                                    child: new Text(
                                      'LPG 14 kg',
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                    color: Theme.of(context).accentColor,
                                    elevation: 4.0,
                                    splashColor: Colors.amber,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      // Perform some action
                                    },
                                  ),
                                  new RaisedButton(
                                    child: new Text(
                                      'LPG 12 kg',
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                    color: Theme.of(context).accentColor,
                                    elevation: 4.0,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
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
                                    child: new Text(
                                      '-',
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                    color: Theme.of(context).accentColor,
                                    elevation: 4.0,
                                    shape: new CircleBorder(
                                        side: BorderSide(
                                            width: 0,
                                            color:
                                                Theme.of(context).accentColor)),
                                    splashColor: Colors.amber,
                                    onPressed: () {
                                      // Perform some action
                                    },
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      child: Text(
                                          "1")), //TODO: to replace with variable
                                  new RaisedButton(
                                    child: new Text(
                                      '+',
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                    color: Theme.of(context).accentColor,
                                    elevation: 4.0,
                                    shape: new CircleBorder(
                                        side: BorderSide(
                                            width: 0,
                                            color:
                                                Theme.of(context).accentColor)),
                                    splashColor: Colors.amber,
                                    onPressed: () {
                                      // Perform some action
                                    },
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(15.0),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "Total Amount",
                                    style: new TextStyle(color: Colors.white70),
                                  ),
                                  Text(
                                    "RM37.00",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        // onPressed: _changeText,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ConfirmOrder()));
        },
      ),
    );
  }
}

// Home Tab - Screen 13 //

class ConfirmOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          tooltip: "Previous Screen",
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: new Text("Select Address"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(children: <Widget>[
          Container(
            width: 350.0,
            height: 450.0,
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      new Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      new Text(
                        "Delivery Address",
                        style: new TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                new Container(
                  child: new Container(
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: new Text(
                                "No.18, Jalan SS15/2 Desa Petaling, Petaling Jaya 47305 Selangor",
                                style: new TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                new Container(
                  child: new SelectDifferentAddress(),
                ),
              ],
            ),
          ),
          new Container(
            width: 300.0,
            child: new RaisedButton(
              child: Text("Confirm Address",
                  style: TextStyle(color: Colors.white)),
              color: Theme.of(context).accentColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              elevation: 50,
              onPressed: () {
                // Perform some action
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeliveryWindow()));
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class SelectDifferentAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: null, //<-to be connected to Register Alternate Address
        child: new Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.white30),
          child: new Text("Select a different address",
              style: new TextStyle(color: Colors.blueAccent, fontSize: 12.1)),
        ));
  }
}

// Home Tab - Screen 15 //

class RegisterAlternateAddress extends StatefulWidget {
  @override
  _RegisterAlternateAddressState createState() =>
      _RegisterAlternateAddressState();
}

class _RegisterAlternateAddressState extends State<RegisterAlternateAddress> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          leading: IconButton(
            tooltip: "Previous Screen",
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: new Text(
            "Enter New Address",
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: new Container(
            child: new Column(children: <Widget>[
          new Expanded(
            child: SingleChildScrollView(
              child: Form(
                // key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    createFormField(
                      "Address Line 1",
                      () {},
                    ),
                    createFormField("Address Line 2", () {}),
                    createFormField("City", () {}),
                    createFormField("Postcode", () {}),
                    createFormField("State", () {}),
                  ],
                ),
              ),
            ),
          ),
          new Center(
            child: new Container(
              child: new Center(
                child: FlatButton(
                  color: Colors.grey,
                  textColor: Colors.white,
                  onPressed: null,
                  child: new Text(
                    "Add new address",
                    style: new TextStyle(fontSize: 12.3),
                  ),
                ),
              ),
            ),
          )
        ])));
  }
}

Widget createFormField(String placeholder, Function validation) {
  return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        validator: validation,
        decoration: InputDecoration(labelText: placeholder),
        maxLines: null,
        autovalidate: true,
      ));
}

//screen 16a/b

class DeliveryWindow extends StatefulWidget {
  @override
  DeliveryWindowState createState() => new DeliveryWindowState();
}

class DeliveryWindowState extends State<DeliveryWindow> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          tooltip: "Previous Screen",
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: new Text("Select delivery period"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 450.0,
              width: 350.0,
              child: ListView(
                children: <Widget>[
                  RadioListTile(
                    title: Text(
                      "Deliver as soon as possible",
                      style: new TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Same-day deliveries are only applicable for orders made by 12pm. Orders made after 12pm will be delivered the following day.",
                      style: new TextStyle(color: Colors.white24),
                    ),
                    value: "deliver-asap",
                    groupValue: "deliver-asap",
                    onChanged: (String value) {
                      setState(() {});
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      "Deliver later",
                      style: new TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Typically customers will receive their orders within 2 days",
                      style: new TextStyle(color: Colors.white24),
                    ),
                    value: "deliver-later",
                    groupValue: "deliver-asap",
                    onChanged: (String value) {},
                  ),
                ],
              ),
            ),
            Container(
              width: 300.0,
              child: new RaisedButton(
                child: Text("Confirm Delivery Period",
                    style: TextStyle(color: Colors.white)),
                color: Theme.of(context).accentColor,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                elevation: 50,
                onPressed: () {
                  // Perform some action
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomerOrderPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Home Tab - Screen 17 //

class CustomerOrderPage extends StatefulWidget {
  @override
  CustomerOrderState createState() => new CustomerOrderState();
}

class CustomerOrderState extends State<CustomerOrderPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text('Order Details'),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(children: <Widget>[
          Container(
              height: 450.0,
              width: 350.0,
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
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))
                                // new Border(top: BorderSide(
                                //   color: Colors.grey
                                // ))
                                ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        headerText(
                                            string: "Delivery Address"
                                                .toUpperCase()),
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
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))
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
                                        string:
                                            "Delivery  Period".toUpperCase()),
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
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  headerText(string: "Subtotal"),
                                  normalText("RM45")
                                ]),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            width: 2,
                                            color: Colors.blueAccent))),
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
          Container(
            width: 300.0,
            child: new RaisedButton(
              child:
                  Text("Confirm Order", style: TextStyle(color: Colors.white)),
              color: Theme.of(context).accentColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              elevation: 50,
              onPressed: () {
                // Perform some action
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerOrderComplete()));
              },
            ),
          )
        ]),
      ),
    );
  }
}

// Home Tab - Screen 18 //

class CustomerOrderComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 400.0,
      width: 300.0,
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: new Column(
        children: <Widget>[
          new Container(
            height: 550.0,
            width: 300.0,
            padding: EdgeInsets.all(50.0),
            child: new Column(children: <Widget>[
              new Text(
                "Order Completed",
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 12.3, color: Colors.white),
              ),
              new Text(
                "You will receive notification updates as your order progresses",
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 12.1, color: Colors.white),
              ),
              new Text(
                "Order #292374",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 20.2,
                ),
              ),
            ]), //to be made a var
          ),
          //new Image(image: null,), //to add image

          Container(
            width: 300.0,
            child: new RaisedButton(
              child: Text("Home", style: TextStyle(color: Colors.white)),
              color: Theme.of(context).accentColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              elevation: 50,
              onPressed: () {
                // Perform some action
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeNav()));
              },
            ),
          )
        ],
      ),
    );
  }
}

// Transaction Tab - Screen 19 //

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() {
    return _TransactionHistoryState();
  }
}

class _TransactionHistoryState extends State<TransactionHistory> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Transaction History",
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor),
      body: new Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
        child: ListView(
          children: <Widget>[
            _order("Order #10959", "21st March, 10:15am"),
            Divider(
              color: Color(0xff4D4D4D),
            ),
            _order("Order #10678", "21st March, 10:15am"),
            Divider(
              color: Color(0xff4D4D4D),
            ),
            _order("Order #10459", "21st March, 10:15am"),
            Divider(
              color: Color(0xff4D4D4D),
            ),
            _order("Order #10244", "21st March, 10:15am"),
            Divider(
              color: Color(0xff4D4D4D),
            ),
            _order("Order #10244", "21st March, 10:15am"),
            Divider(
              color: Color(0xff4D4D4D),
            ),
          ],
        ),
      ),
    );
  }
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

// Transaction Tab - Screen 20 //

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
          backgroundColor: Theme.of(context).backgroundColor,
          centerTitle: true,
          title: Text('Order Details'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
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
              )),
          Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  headerText(string: 'Order made on'),
                  normalText(' 25 March 2019, 10.15 AM')
                ],
              )),
          Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  headerText(string: 'Delivered on'),
                  normalText(' 31st March 2019, 2.15 PM')
                ],
              )),
          Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  headerText(string: "Items"),
                  normalText("1 x LPG 14 kg NEW")
                ],
              )),
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
              ))
        ]));
  }
}

// Profile tab - screen 21

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: new Text(
            "Ahmad Saiful"), //this should be pulled from server. need a var
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileTabSettings()),
              );
            },
          )
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: new Container(
        padding: const EdgeInsets.all(10),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    "Invite Friends",
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InviteFriend()),
                    );
                  },
                )
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    "Redemption Code",
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: null,
                )
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    "About Us",
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileTabAboutUs()),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Profile tab - screen 22

class ProfileTabSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Account settings",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: new Container(
        padding: const EdgeInsets.all(10),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    "Personal details",
                    style: new TextStyle(color: Colors.grey, fontSize: 16.5),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    "Ahmad Saiful",
                    style: new TextStyle(color: Colors.white, fontSize: 14.5),
                  ),
                ),
                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: null,
                )
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    "ahmadsaiful@gmail.com",
                    style: new TextStyle(color: Colors.white, fontSize: 14.5),
                  ),
                ),
                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: null,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "+60172839056",
                    style: TextStyle(color: Colors.white, fontSize: 14.5),
                  ),
                ),
                IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: null,
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                  ],
                ),
                Text(
                  "Sign out",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Profile tab - screen 23

class ProfileTabAboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: new AppBar(
        leading: IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: new Text(
          "About",
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: new Container(
        padding: const EdgeInsets.all(10),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    "About us",
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('About Gas2Go'),
                          content: const Text('LoremIpsum Bla bla blablalbla'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    "Visit our website",
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Please click on the link below'),
                          content: const Text('LoremIpsum Bla bla blablalbla'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    "Privacy Policy",
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Our Privacy Policy'),
                          content: const Text('LoremIpsum Bla bla blablalbla'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    "Terms & Conditions",
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Terms and Conditions'),
                          content: const Text('LoremIpsum Bla bla blablalbla'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Follow us",
                  style: new TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: new Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.facebook),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Icon(
                          FontAwesomeIcons.instagram,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

//screen 24/25
class InviteFriend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: new AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: IconButton(
            tooltip: "Previous page",
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                  child: new Image.asset("assets/invite_friends.png")),
              new Container(
                child: new Text(
                  "Enjoy Cashback & Perks",
                  style: new TextStyle(color: Colors.white, fontSize: 15.1),
                ),
              ),
              new Container(
                child: new Text(
                  "Share your invite code an discover how you and your friends can get cashback",
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: Colors.white, fontSize: 12.1),
                ),
              ),
              new Container(
                child: new Center(
                  child: new HowDoInvitesWork(),
                ),
              ),
              new Container(
                child: new Center(child: new InviteCode()),
              ),
            ],
          ),
        ));
  }
}

class InviteCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: null,
        child: new Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(color: Colors.white30),
          child: new Text("saiful0145454",
              style: new TextStyle(color: Colors.blueAccent, fontSize: 12.1)),
        ));
  }
}

class HowDoInvitesWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('How do invites work?'),
              content: const Text('LoremIpsum Bla bla blablalbla'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: new Text(
        "How do invites work?",
        style: new TextStyle(
            color: Colors.white,
            fontSize: 12.1,
            decoration: TextDecoration.underline),
      ),
    );
  }
}
