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
        backgroundColor: Color(0xff323E6E),
        primaryColor: Color(0xff45569B),
        accentColor: Color(0xffFFA630),
        cardColor: Color(0xff3D4C8A),
        bottomAppBarColor: Color(0xff3D4C8A),
        buttonColor: Color(0xffFFA630),
        textSelectionColor: Color(0xff222222),
      ),
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
        unselectedItemColor: Color(0xFF808080),
        selectedItemColor: Color(0xFFFFA630),
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
    with TickerProviderStateMixin {
  TabController _tabController;
  TabController _secondTabController;
  TabController _thirdTabController;
  bool _minOrder;
  bool _maxOrder;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _secondTabController = TabController(length: 2, vsync: this);
    _thirdTabController = TabController(length: 2, vsync: this);
    _minOrder = true;
    _maxOrder = false;
  }

  num quantity = 1;
  double basePriceNew14 = 115.0;
  double basePriceNew12 = 111.2;
  double basePriceRefill14 = 35.0;
  double basePriceRefill12 = 31.2;

  double newPrice14 = 115.0;
  double newPrice12 = 111.2;
  double refillPrice14 = 35.0;
  double refillPrice12 = 31.2;

  void subtractOrders() {
    setState(() {
      quantity = quantity - 1;
      newPrice14 = basePriceNew14 * quantity;
      newPrice12 = basePriceNew12 * quantity;
      refillPrice14 = basePriceRefill14 * quantity;
      refillPrice12 = basePriceRefill12 * quantity;

      if (quantity == 1) {
        return _minOrder = true;
      }

      if (quantity == 9) {
        return _maxOrder = false;
      }
    });
  }

  void addOrders() {
    setState(() {
      quantity = quantity + 1;
      newPrice14 = basePriceNew14 * quantity;
      newPrice12 = basePriceNew12 * quantity;
      refillPrice14 = basePriceRefill14 * quantity;
      refillPrice12 = basePriceRefill12 * quantity;

      if (quantity == 2) {
        return _minOrder = false;
      }

      if (quantity == 10) {
        return _maxOrder = true;
      }
    });
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
                style: new TextStyle(color: Color(0xffCCCCCC), fontSize: 14.0),
              ),
            ),
          ),
          new Container(
              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
              child: new Column(
                children: <Widget>[
                  new TabBar(
                    unselectedLabelColor: Color(0xff999999),
                    labelColor: Theme.of(context).accentColor,
                    controller: _tabController,
                    indicatorColor: Theme.of(context).accentColor,
                    tabs: [
                      new Tab(
                        // icon: const Icon(Icons.home),
                        text: 'NEW',
                      ),
                      new Tab(
                          // icon: const Icon(Icons.my_location),
                          text: 'REFILL'),
                    ],
                  ),
                  new Container(
                    height: 250.0,
                    alignment: Alignment.center,
                    child: new TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        new Container(
                          //for NEW
                          padding: EdgeInsets.all(15.0),
                          child: new Column(
                            children: <Widget>[
                              new TabBar(
                                unselectedLabelColor: Color(0xff999999),
                                labelColor: Color(0xff222222),
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Theme.of(context).accentColor,
                                ),
                                controller: _secondTabController,
                                tabs: <Widget>[
                                  new Tab(
                                    child: new Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color:
                                                  Theme.of(context).accentColor,
                                              width: 1)),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("LPG 14 kg"),
                                      ),
                                    ),
                                  ),
                                  new Tab(
                                    child: new Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color:
                                                  Theme.of(context).accentColor,
                                              width: 1)),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("LPG 12 kg"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Container(
                                height: 150.0,
                                color: Theme.of(context).cardColor,
                                child: new TabBarView(
                                  controller: _secondTabController,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(15.0),
                                          child: new Row(
                                            //for 14kg
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              new RaisedButton(
                                                child: new Text(
                                                  '-',
                                                  style: new TextStyle(
                                                      color: Theme.of(context)
                                                          .textSelectionColor),
                                                ),
                                                color: Theme.of(context)
                                                    .accentColor,
                                                elevation: 4.0,
                                                shape: new CircleBorder(
                                                    side: BorderSide(
                                                        width: 0,
                                                        color: Theme.of(context)
                                                            .accentColor)),
                                                splashColor: Colors.amber,
                                                onPressed: _minOrder
                                                    ? null
                                                    : subtractOrders,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0),
                                                child: Text("$quantity",
                                                    style: new TextStyle(
                                                        color: Colors.white)),
                                              ), //TODO: to replace with variable
                                              new RaisedButton(
                                                child: new Text(
                                                  '+',
                                                  style: new TextStyle(
                                                      color: Theme.of(context)
                                                          .textSelectionColor),
                                                ),
                                                color: Theme.of(context)
                                                    .accentColor,
                                                elevation: 4.0,
                                                shape: new CircleBorder(
                                                    side: BorderSide(
                                                        width: 0,
                                                        color: Theme.of(context)
                                                            .accentColor)),
                                                splashColor: Colors.amber,
                                                onPressed: _maxOrder
                                                    ? null
                                                    : addOrders,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(15.0),
                                        ),
                                        new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            new Text(
                                              "Total Amount",
                                              style: new TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            new Text(
                                              "RM ${newPrice14.toStringAsFixed(2)}",
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(15.0),
                                          child: new Row(
                                            //for 12kg
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              new RaisedButton(
                                                child: new Text(
                                                  '-',
                                                  style: new TextStyle(
                                                      color: Theme.of(context)
                                                          .textSelectionColor),
                                                ),
                                                color: Theme.of(context)
                                                    .accentColor,
                                                elevation: 4.0,
                                                shape: new CircleBorder(
                                                    side: BorderSide(
                                                        width: 0,
                                                        color: Theme.of(context)
                                                            .accentColor)),
                                                splashColor: Colors.amber,
                                                onPressed: _minOrder
                                                    ? null
                                                    : subtractOrders,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0),
                                                child: Text("$quantity",
                                                    style: new TextStyle(
                                                        color: Colors.white)),
                                              ), //TODO: to replace with variable
                                              new RaisedButton(
                                                child: new Text(
                                                  '+',
                                                  style: new TextStyle(
                                                      color: Theme.of(context)
                                                          .textSelectionColor),
                                                ),
                                                color: Theme.of(context)
                                                    .accentColor,
                                                elevation: 4.0,
                                                shape: new CircleBorder(
                                                    side: BorderSide(
                                                        width: 0,
                                                        color: Theme.of(context)
                                                            .accentColor)),
                                                splashColor: Colors.amber,
                                                onPressed: _maxOrder
                                                    ? null
                                                    : addOrders,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(15.0),
                                        ),
                                        new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            new Text(
                                              "Total Amount",
                                              style: new TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            new Text(
                                              "RM ${newPrice12.toStringAsFixed(2)}",
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ), //end of container for new

                        new Container(
                          //for REFILL
                          padding: EdgeInsets.all(15.0),
                          child: new Column(
                            children: <Widget>[
                              new TabBar(
                                unselectedLabelColor: Color(0xff999999),
                                labelColor: Color(0xff222222),
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Theme.of(context).accentColor,
                                ),
                                controller: _thirdTabController,
                                tabs: <Widget>[
                                  new Tab(
                                    child: new Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color:
                                                  Theme.of(context).accentColor,
                                              width: 1)),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("LPG 14 kg"),
                                      ),
                                    ),
                                  ),
                                  new Tab(
                                    child: new Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color:
                                                  Theme.of(context).accentColor,
                                              width: 1)),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("LPG 12 kg"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Container(
                                height: 150.0,
                                color: Theme.of(context).cardColor,
                                child: new TabBarView(
                                  controller: _thirdTabController,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(15.0),
                                          child: new Row(
                                            //for 14kg
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              new RaisedButton(
                                                child: new Text(
                                                  '-',
                                                  style: new TextStyle(
                                                      color: Theme.of(context)
                                                          .textSelectionColor),
                                                ),
                                                color: Theme.of(context)
                                                    .accentColor,
                                                elevation: 4.0,
                                                shape: new CircleBorder(
                                                    side: BorderSide(
                                                        width: 0,
                                                        color: Theme.of(context)
                                                            .accentColor)),
                                                splashColor: Colors.amber,
                                                onPressed: _minOrder
                                                    ? null
                                                    : subtractOrders,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0),
                                                child: Text("$quantity",
                                                    style: new TextStyle(
                                                        color: Colors.white)),
                                              ), //TODO: to replace with variable
                                              new RaisedButton(
                                                child: new Text(
                                                  '+',
                                                  style: new TextStyle(
                                                      color: Theme.of(context)
                                                          .textSelectionColor),
                                                ),
                                                color: Theme.of(context)
                                                    .accentColor,
                                                elevation: 4.0,
                                                shape: new CircleBorder(
                                                    side: BorderSide(
                                                        width: 0,
                                                        color: Theme.of(context)
                                                            .accentColor)),
                                                splashColor: Colors.amber,
                                                onPressed: _maxOrder
                                                    ? null
                                                    : addOrders,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(15.0),
                                        ),
                                        new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            new Text(
                                              "Total Amount",
                                              style: new TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            new Text(
                                              "RM ${refillPrice14.toStringAsFixed(2)}", //14kg
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(15.0),
                                          child: new Row(
                                            //for 12kg
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              new RaisedButton(
                                                child: new Text(
                                                  '-',
                                                  style: new TextStyle(
                                                      color: Theme.of(context)
                                                          .textSelectionColor),
                                                ),
                                                color: Theme.of(context)
                                                    .accentColor,
                                                elevation: 4.0,
                                                shape: new CircleBorder(
                                                    side: BorderSide(
                                                        width: 0,
                                                        color: Theme.of(context)
                                                            .accentColor)),
                                                splashColor: Colors.amber,
                                                onPressed: _minOrder
                                                    ? null
                                                    : subtractOrders,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0),
                                                child: Text("$quantity",
                                                    style: new TextStyle(
                                                        color: Colors.white)),
                                              ), //TODO: to replace with variable
                                              new RaisedButton(
                                                child: new Text(
                                                  '+',
                                                  style: new TextStyle(
                                                      color: Theme.of(context)
                                                          .textSelectionColor),
                                                ),
                                                color: Theme.of(context)
                                                    .accentColor,
                                                elevation: 4.0,
                                                shape: new CircleBorder(
                                                    side: BorderSide(
                                                        width: 0,
                                                        color: Theme.of(context)
                                                            .accentColor)),
                                                splashColor: Colors.amber,
                                                onPressed: _maxOrder
                                                    ? null
                                                    : addOrders,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(15.0),
                                        ),
                                        new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            new Text(
                                              "Total Amount",
                                              style: new TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            new Text(
                                              "RM ${refillPrice12.toStringAsFixed(2)}", //12kg
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ], //end of column for refill
                    ),
                  ),
                ],
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        // onPressed: _changeText,
        backgroundColor: Theme.of(context).accentColor,
        foregroundColor: Theme.of(context).textSelectionColor,
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
            color: Theme.of(context).buttonColor,
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
                        style:
                            new TextStyle(color: Colors.white, fontSize: 16.0),
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
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 14.0),
                              ),
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
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            child: new RaisedButton(
              child: Text("Confirm Address",
                  style:
                      TextStyle(color: Theme.of(context).textSelectionColor)),
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
          child: new Text("Select a different address?",
              style: new TextStyle(
                  color: Theme.of(context).accentColor, fontSize: 14.0)),
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
              color: Theme.of(context).buttonColor,
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
  int deliveryPeriod = 1;

  void handleRadioValueChanged(int value) {
    setState(() {
      deliveryPeriod = value;
    });
  }

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
            color: Theme.of(context).buttonColor,
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
                      activeColor: Theme.of(context).accentColor,
                      title: Text(
                        "Deliver as soon as possible",
                        style: new TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "Same-day deliveries are only applicable for orders made by 12pm. Orders made after 12pm will be delivered the following day.",
                        style: new TextStyle(color: Colors.white24),
                      ),
                      value: 1,
                      groupValue: deliveryPeriod,
                      onChanged: handleRadioValueChanged),
                  RadioListTile(
                    activeColor: Theme.of(context).accentColor,
                    title: Text(
                      "Deliver later",
                      style: new TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Typically customers will receive their orders within 2 days",
                      style: new TextStyle(color: Colors.white24),
                    ),
                    value: 2,
                    groupValue: deliveryPeriod,
                    onChanged: handleRadioValueChanged,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: new RaisedButton(
                child: Text("Confirm Delivery Period",
                    style:
                        TextStyle(color: Theme.of(context).textSelectionColor)),
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
        leading: IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Theme.of(context).buttonColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: new Text('Checkout'),
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
                                    bottom:
                                        BorderSide(color: Color(0xff667FE6)))
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
                                          "Change address?",
                                          style: TextStyle(
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          Container(
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
                                        Text("Tuesday, 31st March 2019",
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
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor)),
                              ]))),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1,
                                            color: Color(0xff667FE6)))),
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
                                            color: Color(0xff667FE6)))),
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
            width: MediaQuery.of(context).size.width,
            child: new RaisedButton(
              child: Text("Confirm Order",
                  style:
                      TextStyle(color: Theme.of(context).textSelectionColor)),
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
                style: new TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              new Text(
                "You will receive notification updates as your order progresses",
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 15.0, color: Colors.white),
              ),
              new Text(
                "Order #292374",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]), //to be made a var
          ),
          //new Image(image: null,), //to add image

          Container(
            width: MediaQuery.of(context).size.width,
            child: new RaisedButton(
              child: Text("Home",
                  style:
                      TextStyle(color: Theme.of(context).textSelectionColor)),
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
            color: Color(0xffFFA630),
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey),
      ),
      onTap: () {
        // Perform some action
        BuildContext context;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OrderDetailsPage()));
      },
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
            color: Theme.of(context).buttonColor,
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
            color: Theme.of(context).buttonColor,
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
                    color: Theme.of(context).buttonColor,
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
                    color: Theme.of(context).buttonColor,
                  ),
                  onPressed: null,
                )
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    "About",
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).buttonColor,
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
            color: Theme.of(context).buttonColor,
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
                    style: new TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    "Ahmad Saiful",
                    style: new TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.edit,
                    color: Theme.of(context).buttonColor,
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
                    style: new TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.edit,
                    color: Theme.of(context).buttonColor,
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
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
                IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon(
                    Icons.edit,
                    color: Theme.of(context).buttonColor,
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
                      color: Theme.of(context).buttonColor,
                    ),
                  ],
                ),
                Text(
                  "Sign out",
                  style: TextStyle(color: Theme.of(context).accentColor),
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
            color: Theme.of(context).buttonColor,
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
                    color: Theme.of(context).buttonColor,
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
                    color: Theme.of(context).buttonColor,
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
                    color: Theme.of(context).buttonColor,
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
                    color: Theme.of(context).buttonColor,
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
                      Icon(
                        FontAwesomeIcons.facebookF,
                        color: Theme.of(context).buttonColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Icon(
                          FontAwesomeIcons.instagram,
                          color: Theme.of(context).buttonColor,
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
          icon:
              new Icon(Icons.arrow_back, color: Theme.of(context).buttonColor),
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
                child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: new Image.asset("assets/invite_friends.png"),
            )),
            new Container(
              child: new Text(
                "Enjoy Cashback & Perks",
                style: new TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
            new Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: new Text(
                  "Share your invite code an discover how you and your friends can get cashback",
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: Colors.white, fontSize: 15.0),
                ),
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.share),
        // onPressed: _changeText,
        backgroundColor: Theme.of(context).accentColor,
        foregroundColor: Theme.of(context).textSelectionColor,
        onPressed: null,
      ),
    );
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
              style: new TextStyle(
                  color: Theme.of(context).accentColor, fontSize: 13.0)),
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
      child: new Text(
        "How do invites work?",
        style: new TextStyle(
            color: Colors.white,
            fontSize: 13.0,
            decoration: TextDecoration.underline),
      ),
    );
  }
}
