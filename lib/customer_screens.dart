import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gas2go/texts.dart';
import 'commonelements.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:sticky_headers/sticky_headers.dart';

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
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RegisterAlternateAddress()));
        },
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
  final _formKey = GlobalKey<FormState>();

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
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: new Container(
            padding: EdgeInsets.all(20.0),
            child: new Column(children: <Widget>[
              new Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        createFormField(
                          "Address Line 1",
                          (value) {},
                        ),
                        createFormField("Address Line 2", (value) {}),
                        createFormField("City", (value) {}),
                        createFormField("Postcode", (value) {}),
                        createFormField("State", (value) {}),
                      ],
                    ),
                  ),
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                child: new RaisedButton(
                  child: Text("Add new address",
                      style: TextStyle(
                          color: Theme.of(context).textSelectionColor)),
                  color: Theme.of(context).accentColor,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  elevation: 50,
                  onPressed: null,
                ),
              ),
            ])));
  }
}

Widget createFormField(String placeholder, Function validation) {
  return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        validator: validation,
        decoration: InputDecoration(labelText: placeholder),
        maxLines: 20,
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
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: new Column(
          children: <Widget>[
            new Container(
              height: 250.0,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 0.0),
              child: new Column(children: <Widget>[
                Container(
                  //padding: EdgeInsets.all(20.0),
                  child: new Text(
                    "Order completed!",
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: new Text(
                    "You will receive notification updates as your order progresses",
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),

                Container(
                  child: new Text(
                    "Order #292374",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ), //to be made a var
              ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 280.0,
              child: new Icon(
                Icons.check,
                size: 100.0,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
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
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
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
                      fontSize: 16.0,
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
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
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
                          title: Text('Feature not available'),
                          content: const Text(
                              'This feature will be made available in future updates!'),
                          actions: <Widget>[
                            FloatingActionButton(
                              child: Icon(Icons.check),
                              backgroundColor: Color(0xffFFA630),
                              foregroundColor: Color(0xff222222),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileTabAboutUs()),
                );
              },
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Text(
                      "About",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
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
                        MaterialPageRoute(
                            builder: (context) => ProfileTabAboutUs()),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile tab - screen 22

class ProfileTabSettings extends StatefulWidget {
  @override
  _ProfileTabSettingsState createState() {
    return _ProfileTabSettingsState();
  }
}

class _ProfileTabSettingsState extends State<ProfileTabSettings> {
  final nameController = TextEditingController();
  String name = 'Ahmad Saiful';
  String email = 'ahmadsaiful@gmail.com';
  String phone = '017xxxxxxx';

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
                    name,
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
                    onPressed: () {
                      _valueFromEditFormName(context);
                    })
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    email,
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
                  onPressed: () {
                    _valueFromEditFormEmail(context);
                  },
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    phone,
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
                    onPressed: () {
                      _valueFromEditFormPhone(context);
                    })
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 30.0, 0, 0),
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

  void _valueFromEditFormName(BuildContext context) async {
    final resultName = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditFormName()));

    setState(() {
      name = resultName;
    });
  }

  void _valueFromEditFormEmail(BuildContext context) async {
    final resultEmail = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditFormEmail()));

    setState(() {
      email = resultEmail;
    });
  }

  void _valueFromEditFormPhone(BuildContext context) async {
    final resultPhone = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditFormPhone()));

    setState(() {
      phone = resultPhone;
    });
  }
}

class EditFormName extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditFormNameState();
  }
}

class EditFormNameState extends State<EditFormName> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  // @override
  // void dispose(){
  //   nameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: new AppBar(
        title: new Text("Edit Name"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        height: 400.0,
        child: new Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter some text";
                    }
                    return null;
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        backgroundColor: Theme.of(context).accentColor,
        foregroundColor: Theme.of(context).textSelectionColor,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            return _sendNameBack(context);
          }
        },
      ),
    );
  }

  void _sendNameBack(BuildContext context) {
    String nameToSendBack = nameController.text;
    Navigator.pop(context, nameToSendBack);
  }
}

class EditFormEmail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditFormEmailState();
  }
}

class EditFormEmailState extends State<EditFormEmail> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  // @override
  // void dispose(){
  //   nameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: new AppBar(
        title: new Text("Edit Email"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        height: 400.0,
        child: new Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter email";
                    }
                    return null;
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        backgroundColor: Theme.of(context).accentColor,
        foregroundColor: Theme.of(context).textSelectionColor,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            return _sendEmailBack(context);
          }
        },
      ),
    );
  }

  void _sendEmailBack(BuildContext context) {
    String emailToSendBack = emailController.text;
    Navigator.pop(context, emailToSendBack);
  }
}

class EditFormPhone extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditFormPhoneState();
  }
}

class EditFormPhoneState extends State<EditFormPhone> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  // @override
  // void dispose(){
  //   nameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: new AppBar(
        title: new Text("Edit Phone Number"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        height: 400.0,
        child: new Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  controller: phoneController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter phone number";
                    }
                    return null;
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        backgroundColor: Theme.of(context).accentColor,
        foregroundColor: Theme.of(context).textSelectionColor,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            return _sendPhoneBack(context);
          }
        },
      ),
    );
  }

  void _sendPhoneBack(BuildContext context) {
    String phoneToSendBack = phoneController.text;
    Navigator.pop(context, phoneToSendBack);
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
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              // work on the onTap method
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Text(
                      "About us",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUs()),
                );
              },
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Text(
                      "Contact us",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
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
                        MaterialPageRoute(builder: (context) => ContactUs()),
                      );
                    },
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: _launchWebsite,
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Text(
                      "Visit our website",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
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
                    onPressed: _launchWebsite,
                  )
                ],
              ),
            ),
            GestureDetector(
              // work on the onTap method
              onTap: () {
                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Privacy Policy'),
                        content: const Text('LoremIpsum Bla bla blablalbla'),
                        actions: <Widget>[
                          FloatingActionButton(
                            child: Icon(Icons.check),
                            backgroundColor: Color(0xffFFA630),
                            foregroundColor: Color(0xff222222),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
              },
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Text(
                      "Privacy Policy",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
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
                            title: Text('Our Privacy Policy'),
                            content:
                                const Text('LoremIpsum Bla bla blablalbla'),
                            actions: <Widget>[
                              FloatingActionButton(
                                child: Icon(Icons.check),
                                backgroundColor: Color(0xffFFA630),
                                foregroundColor: Color(0xff222222),
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
            ),
            GestureDetector(
              // work on the onTap method
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsAndConditions()),
                );
              },
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Text(
                      "Terms & conditions",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
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
                        MaterialPageRoute(
                            builder: (context) => TermsAndConditions()),
                      );
                    },
                  )
                ],
              ),
            ),
            GestureDetector(
              // work on the onTap method
              onTap: () {
                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('FAQ'),
                        content: const Text('LoremIpsum Bla bla blablalbla'),
                        actions: <Widget>[
                          FloatingActionButton(
                            child: Icon(Icons.check),
                            backgroundColor: Color(0xffFFA630),
                            foregroundColor: Color(0xff222222),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
              },
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Text(
                      "FAQ",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
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
                            title: Text('Frequently Asked Questions'),
                            content:
                                const Text('LoremIpsum Bla bla blablalbla'),
                            actions: <Widget>[
                              FloatingActionButton(
                                child: Icon(Icons.check),
                                backgroundColor: Color(0xffFFA630),
                                foregroundColor: Color(0xff222222),
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
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Follow us",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: new Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: _launchFacebook,
                        child: Icon(
                          FontAwesomeIcons.facebookSquare,
                          color: Theme.of(context).buttonColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GestureDetector(
                          onTap: _launchTwitter,
                          child: Icon(
                            FontAwesomeIcons.twitter,
                            color: Theme.of(context).buttonColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GestureDetector(
                          onTap: _launchInstagram,
                          child: Icon(
                            FontAwesomeIcons.instagram,
                            color: Theme.of(context).buttonColor,
                          ),
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

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final ezGasLogo = Container(
    margin: EdgeInsets.symmetric(vertical: 50.0),
    child: Center(
      child: Image.asset("assets/ezgas_logo_white_text.png", height: 100.0),
    ),
  );

  final aboutUsDescription = Container(
    child: Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              "Proudly made and developed in Malaysia",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            // italicise 'taukes'
            child: Text(
                "We at EZ Gas believed that the old fashioned way of ordering cooking gas barrels from taukes and convenient stores are not very efficient. We have also tried existing services and apps that try to digitalise this space, but we ran into a number of issues.",
                style: TextStyle(fontSize: 15.0)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
                "Some of them don’t even end up delivering the barrels, while others only cater to a small delivery area. Then there’s some that only provide cooking gas made by a certain brand. We thought we could do a better job than what’s already out there, and thus came about the idea of this app.",
                style: TextStyle(fontSize: 15.0)),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Text(
                "Currently there’s 3 of us actively developing, improving and awaiting your feedback that we will take on board to get this product to greater and greater heights. We hope you will enjoy using this app and this service as much as we have developing it.",
                style: TextStyle(fontSize: 15.0),
              )),
        ],
      ),
    ),
  );

  final comingSoonTitle = Container(
    child: Center(
      child: Column(
        children: <Widget>[
          Image.asset(
            "assets/about_us_whats_coming.png",
            height: 300.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Text("What’s still to come",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    ),
  );

  final comingSoonList = Container(
    margin: EdgeInsets.only(top: 30.0, right: 30.0, bottom: 100.0, left: 30.0),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset(
              "assets/online_payment_icon.png",
              height: 80.0,
              width: 100.0,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 40.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Online payments",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Text(
                        "Lorem ipsum dolor sit amet, elit consectetur adipiscing",
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xffCCCCCC)),
                        textAlign: TextAlign.left),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/expanded_delivery_areas_icon.png",
                height: 80.0,
                width: 100.0,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 40.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Expanded delivery areas",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Text(
                          "Lorem ipsum dolor sit amet, elit consectetur adipiscing",
                          style: TextStyle(
                              fontSize: 14.0, color: Color(0xffCCCCCC)),
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Image.asset(
              "assets/robust_rewards_system_icon.png",
              height: 80.0,
              width: 100.0,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 40.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Robust rewards & referral system",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Text(
                        "Lorem ipsum dolor sit amet, elit consectetur adipiscing",
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xffCCCCCC)),
                        textAlign: TextAlign.left),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );

  final footerInfo = Container(
    margin: EdgeInsets.only(bottom: 50.0),
    child: Center(
      child: Text(
        "EZ Gas is a product of Auxci Sdn. Bhd. (1325487-W)",
        style: TextStyle(fontSize: 13.0, color: Color(0xff808080)),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("About us"),
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          tooltip: "Previous page",
          icon: Icon(Icons.arrow_back, color: Theme.of(context).buttonColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          ezGasLogo,
          aboutUsDescription,
          comingSoonTitle,
          comingSoonList,
          footerInfo,
        ],
      ),
    );
  }
}

_launchWebsite() async {
  // edit the proper link once website has been created
  const websiteURL = 'https://auxci.com/ezgas';
  if (await canLaunch(websiteURL)) {
    await launch(websiteURL);
  } else {
    throw 'Could not launch $websiteURL';
  }
}

_launchFacebook() async {
  // edit the proper link once FB account has been created
  const facebookURL = 'https://facebook.com';
  if (await canLaunch(facebookURL)) {
    await launch(facebookURL);
  } else {
    throw 'Could not launch $facebookURL';
  }
}

_launchInstagram() async {
  // edit the proper link once IG account has been created
  const instagramURL = 'https://instagram.com';
  if (await canLaunch(instagramURL)) {
    await launch(instagramURL);
  } else {
    throw 'Could not launch $instagramURL';
  }
}

_launchTwitter() async {
  // edit the proper link once twitter account has been created
  const twitterURL = 'https://twitter.com';
  if (await canLaunch(twitterURL)) {
    await launch(twitterURL);
  } else {
    throw 'Could not launch $twitterURL';
  }
}

_launchEmail() async {
  // edit the proper mailto link once emails have been created
  const emailTo = 'mailto:<email address>?subject=<subject>&body=<body>';
  if (await canLaunch(emailTo)) {
    await launch(emailTo);
  } else {
    throw 'Could not send email to $emailTo';
  }
}

// Contact us screen
class ContactUs extends StatelessWidget {
  final contactUsDescription = Container(
    margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
    child: Text(
      "Should you need help, never hesitate to reach out to us through these official channels. Whether you’re having issues with an order or would like to provide some feedback on our app/service, we would love to hear from you.",
      style: TextStyle(fontSize: 15.0),
    ),
  );

  final fbContact = Container(
    margin: EdgeInsets.only(top: 30.0, bottom: 30.0, left: 15.0),
    child: GestureDetector(
      onTap: _launchFacebook,
      child: Row(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                FontAwesomeIcons.facebookSquare,
                color: Color(0xffFFA630),
              )),
          Container(
              child: Text(
            "Facebook",
            style: TextStyle(color: Color(0xffFFA630)),
          ))
        ],
      ),
    ),
  );

  final twitterContact = Container(
    margin: EdgeInsets.only(bottom: 30.0, left: 15.0),
    child: GestureDetector(
      onTap: _launchTwitter,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              FontAwesomeIcons.twitter,
              color: Color(0xffFFA630),
            ),
          ),
          Container(
            child: Text(
              "Twitter",
              style: TextStyle(color: Color(0xffFFA630)),
            ),
          )
        ],
      ),
    ),
  );

  final instagramContact = Container(
    margin: EdgeInsets.only(bottom: 30.0, left: 15.0),
    child: GestureDetector(
      onTap: _launchInstagram,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              FontAwesomeIcons.instagram,
              color: Color(0xffFFA630),
            ),
          ),
          Container(
            child: Text(
              "Instagram",
              style: TextStyle(color: Color(0xffFFA630)),
            ),
          )
        ],
      ),
    ),
  );

  final emailContact = Container(
    margin: EdgeInsets.only(left: 15.0),
    child: GestureDetector(
      onTap: _launchEmail,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              FontAwesomeIcons.envelopeOpen,
              color: Color(0xffFFA630),
            ),
          ),
          Container(
            child: Text(
              "Email",
              style: TextStyle(color: Color(0xffFFA630)),
            ),
          )
        ],
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Contact us"),
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          tooltip: "Previous page",
          icon: Icon(Icons.arrow_back, color: Theme.of(context).buttonColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            contactUsDescription,
            fbContact,
            twitterContact,
            instagramContact,
            emailContact
          ],
        ),
      ),
    );
  }
}

class TermsAndConditions extends StatefulWidget {
  // TermsAndConditions({Key key}) : super(key: key);
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  final tncIntroduction = Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(
                "Updated as at 5 July 2019",
                style: TextStyle(fontSize: 15.0, fontStyle: FontStyle.italic),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Text(
              "The Services are made available by EZ Gas to you at its sole and absolute discretion and by using the Services upon Activation including but not limited to, purchasing any product and/or services on the App, you unconditionally: –",
              style: TextStyle(fontSize: 15.0, height: 1.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Text(
                "(a) acknowledge that you have read and fully understood these Terms and Conditions and agree to be bound by these Terms and Conditions;",
                style: TextStyle(fontSize: 15.0, height: 1.2)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Text(
                "(b) consent to EZ Gas using and processing your personal information and data in accordance with EZ Gas’ Privacy Policy which can be found on the EZ Gas mobile application.",
                style: TextStyle(fontSize: 15.0, height: 1.2)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Text(
                "Any person that you allow to access the Service using your Account shall also be bound by these Terms and Conditions. If you do not accept these Terms and Conditions, please do not continue with the registration process or Activation or the use of this Service(s).",
                style: TextStyle(fontSize: 15.0, height: 1.2)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              color: Color(0xff808080),
            ),
          )
        ],
      ),
    ),
  );

  final tncDefinitions = Container(
    margin: EdgeInsets.symmetric(vertical: 30.0),
    child: StickyHeader(
      header: Container(
        height: 50.0,
        color: Color(0xff3D4C8A),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        alignment: Alignment.centerLeft,
        child: Text(
          "Definitions",
          style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18.0),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                  "For the purpose of these Terms and Conditions, the following terms shall, unless the context otherwise requires, have the meanings as defined below. All other terms not defined herein shall have the meaning as may generally be accepted within the industry based on the context used herein:",
                  style: TextStyle(fontSize: 15.0, height: 1.2)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'Account'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means your EZ Gas account which is: \n\n 1. linked to the telephone number of your Mobile Device; \n 2. managed and supervised by EZ Gas; and \n 3.	which records, amongst other things, your gas orders;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'Activation' or 'Activated'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means the point in time when your Account is activated for use;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'App'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means software application named as “EZ Gas” or such other name as may be determined by EZ Gas from time to time which is downloaded unto the Mobile Device;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'Authentication' or 'Authenticated'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means a confirmation sent by you to EZ Gas authorising a particular transaction undertaken or transacted by you. Such authenticated shall be in a manner stipulated or determined by EZ Gas from time to time including but not limited to keying in your personal details;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'EZ Gas' or 'we' or 'us' or 'our'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("means AUXCI SDN BHD (Company No. 1325487-W);",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'FAQ'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means frequently asked questions as made available on the EZ Gas mobile application;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'Force Majeure'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means any cause which is not within the control of EZ Gas including but not limited to act of God, flood, natural disaster, landslides, mudslides, soil erosions, storm, fire, earthquakes, war, riot, civil commotion, natural catastrophe, industrial disputes of any kind, act of government, government restraint, expropriation, change of law, strike, lockouts, blockade, outbreaks and pandemics and the interruption or failure of utility service including but not limited to electric, power, gas, water or telecommunication services;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'Intellectual Property Rights'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means rights in, and in relation to, any patents, registered designs, design rights, trademarks, trade and business names (including all goodwill associated with any trademark or trade business names), copyright and related rights, moral rights, databases, domain names, semi-conductor and other topography rights and utility models, and including the benefit of all registrations of, applications to register and the right to apply for registration of any of the foregoing items and all rights in the nature of any of the foregoing items, each for their full term (including any extensions or renewals thereof);",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'Mobile Device'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means a portable and wireless telecommunications device together with accessories including but not limited to smartphones and handheld tablets used by you to access and/or use the Service;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'Payment'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means the payment to EZ Gas for the purchase of goods and services by means of the App;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'Gas Supplier'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means merchants designated by EZ Gas to sell goods and/or services by means of the App;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'Partners'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means the business partners of EZ Gas who offer and sell its goods and services on the App;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'Service(s)'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means a stored value service provided by EZ Gas via the App which enables you to perform the transactions;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'Terms and Conditions' or 'Agreement'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means these terms and conditions for the Service as may be varied or modified from time to time at EZ Gas’s sole discretion;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'You' or 'Your'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means the person who uses and/or accesses the Services;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'KYC'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "means Know Your Customer process as determined by us from time to time;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "'Password'",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("means the password used to log into the App;",
                    style: TextStyle(fontSize: 15.0, height: 1.2)),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  final tncUseOfService = Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: StickyHeader(
          header: Container(
            height: 50.0,
            color: Color(0xff3D4C8A),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Use of Service",
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18.0),
            ),
          ),
          content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text(
                      "2.1 In order to use the Services, you are required to create an account on the App by clicking on the “Register” link and following the on-screen prompts, and provide the requested information including but not limited to your name as per identity card, password, your mobile phone number or other similar identification properties.\n\n 2.2 The provision of the Services and the Activation of your Account is at EZ Gas’s sole and absolute discretion.\n\n 2.3 You may only use the Services once your Account has been Activated. Once your Account has been Activated, your use of the App and the Service shall be strictly in accordance with these Terms and Conditions.\n\n 2.4 The App and the Services is only available on a Mobile Device and is strictly for your own personal use only as a subscriber of the Service. Any instructions, confirmation and/or communication sent from your Mobile Device shall be deemed to have been sent and/or issued by you irrespective of whether such instructions, confirmations and/or communications were actually sent by you or not. You shall be personally liable and responsible for the use of your Account including but not limited to all transactions undertaken and/or transacted using the Account once the said transaction has been Authenticated irrespective of whether the transactions is undertaken and/or transacted by you unless it can be established that such transactions was erroneously transacted due to an error on EZ Gas’s part.\n\n 2.5 The Services made available to you via the App may perform the following transactions (the “Transactions”):\n\n (a) Gas Orders;\n\n 2.6 EZ Gas may engage with third party service providers to make the order deliveries.\n\n 2.7 Any transaction entered into between you and such third parties for third party product and/or services shall also be subject to any terms and conditions which may be stipulated by such third parties. Any such transactions are entered into at your own risk and you acknowledge and agree that EZ Gas shall not take any responsibility and/or liability for the products and/or services offered by the third parties to you including but not limited to the delivery, quality (including any defects or deficiency in the products and/or services), safety or the fitness for purpose of the products and/or services purchased by you from such third parties. EZ Gas shall not be responsible for the refusal of any merchant to honor or accept your purchases or payment made through the use of the Service. You further acknowledge and agree that you shall not initiate any legal proceedings against us for any claim you may have against such third parties.\n\n 2.8 EZ Gas does not make any warranty, representation and/or undertaking (expressly, impliedly or otherwise) that the App and any subsequent revisions, modifications, updates, upgrades or versions is and would be compatible with your Mobile Device. It is your responsibility to ensure that the App is and will be compatible with your Mobile Device at all times and you acknowledge and agree that EZ Gas shall not be liable in any manner whatsoever for any liability, loss, damages, cost and expense suffered and/or incurred by you due to the App being incompatible with your Mobile Device.\n\n 2.9 You shall, at all times be solely responsible to keep confidential and safeguard your account details including your username and password. You shall not disclose your username and password to any person. You shall be solely responsible and liable for any use and misuse of your Account and password and all activities that occur under your Account.\n\n 2.10 The record of all Transactions authenticated through your Mobile Device number registered for the Account shall be binding and conclusive evidence of your Transactions. Any information, instructions and/or confirmation sent from the Mobile Device via the Account shall be deemed to have been issued by you notwithstanding that such information, instructions and/or confirmation may have been issued by a third party, whether authorised or otherwise, EZ Gas shall deem that the Services has been accessed legitimately and the Transactions conducted shall be valid. EZ Gas shall not entertain any request to reverse any wrongful Transactions authenticated through the Mobile Device / mobile number registered for the Account.\n\n 2.11 Notwithstanding anything to the contrary, we reserve the right to block or decline any transaction at our sole and absolute discretion without assigning any reason thereto.\n\n 2.12 You may opt out from the Service at any time by deleting your account on the app.\n\n 2.13 You acknowledge that EZ Gas offers product powered by the Partners as part of our Services.\n\n 2.14 You agree to indemnify EZ Gas from any expenses, liability, loss, damages and actions whatsoever arising from your purchase and use of products from EZ Gas.",
                      style: TextStyle(fontSize: 15.0, height: 1.2)),
                ),
              ]))));

  final tncYourResponsibility = Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: StickyHeader(
          header: Container(
            height: 50.0,
            color: Color(0xff3D4C8A),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Your Responsibility",
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18.0),
            ),
          ),
          content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text(
                      "3.1 You shall:\n\n (a) keep your personal information and Password for your Account confidential at all times and shall take all steps to prevent the disclosure of your Password;\n\n (b) ensure that all information and data provided to EZ Gas including personal data are true, accurate, updated and complete at the time of provision and shall promptly update such information and data if there are any changes to the same. EZ Gas shall not be responsible and liable whatsoever and howsoever to you due to any inaccurate or incomplete information and data provided to EZ Gas;\n\n (c) comply with all notice or instructions given by EZ Gas from time to time in relation to the use of the Service and App;\n\n (d) be responsible for all equipment necessary to use the Service and App, and also for the security and integrity of all information and data transmitted, disclosed and/or obtained through the use of the Service and App;\n\n (e) be responsible and liable for all usage of and all payment of the fees, charges, taxes and duties for using the Services including but not limited to payment of all fee, charges, taxes and duties for the purchase of products and/or services to EZ Gas and third parties including Participating Merchants in a timely manner;\n\n (f) be fully responsible for any and all data, information, instructions and/or confirmation transmitted or broadcasted from your Mobile Device whether by you or any other person whether authorized or otherwise. EZ Gas shall deem that the Services have been accessed legitimately and any Transaction made as a result of transmission of such data, information, instructions and/or confirmation are valid;\n\n (g) comply with all applicable laws of Malaysia relating to the Service, including without limitation to the Communication and Multimedia Act 1998, Financial Services Act 2012, Anti Money Laundering Anti-Terrorism Financing and Proceeds of Unlawful Activities Act 2001 and their respective subsidiary legislation, which may be amended from time to time;\n\n (h) take all reasonable steps to prevent fraudulent, improper or illegal use of the Service;\n\n (i) cease to utilise the Service or any part thereof for such period as may be required by EZ Gas;\n\n (j) report immediately to EZ Gas upon the discovery of any fraud, theft, loss, unauthorised usage or any other occurrence of unlawful acts in relation to the Mobile Device and its use. You agree to lodge a police report whenever instructed by EZ Gas and to give EZ Gas a certified copy of such report;\n\n (k) access the App and/or use the Services only for lawful purposes and in a lawful manner at all times and further agree to conduct any activity relating to the Services or the App (including participate in any campaigns/ promotional activities initiated by us) in good faith;\n\n (l) download and install the EZ Gas app from the Google PlayStore and/or Apple iOS store from the official EZ Gas account. Any downloads & installation outside of this will be deemed unlawful and any actions thereafter by the user will not be liable by EZ Gas; and\n\n (m) fully indemnify and shall keep EZ Gas fully indemnified against any loss, damage, liability, cost or expense, arising from any claims for libel, invasion of privacy, infringement of copyright, patent, breach of confidence or privilege or breach of any law or regulation whatsoever transmitted, received or stored via the Service or part thereof and for all other claims arising out of any act or omission of your or any unauthorised use or exploitation of the Services or part thereof.\n\n 3.2. You shall not:\n\n (a) use the Service and/or the App to cause embarrassment, distress, annoyance, irritation, harassment, inconvenience, anxiety or nuisance to any person;\n\n (b) use the Service and/or the App dishonestly, fraudulently or illegally;\n\n (c) use the Service and/or the App to cause excessive or disproportionate load on the Service or EZ Gas’s system;\n\n (d) use the Service and/or the App for any purpose which is against public interest, public order or national harmony;\n\n (e) use, permit or cause to be used the Service and/or App improperly or for any activities which breach any laws, infringe a third party’s rights, or breach any directives, content requirements or codes promulgated by any relevant authority including activities which will require EZ Gas to take remedial action under any applicable industry code or in a way interferes with other users or defames, harasses, menaces, restricts or inhibits any other use from using or enjoying the Service or the internet;\n\n (f) circumvent user authentication or security of any host, network or account (referred to as “cracking” or “hacking”) nor interfere with service to any user, host or network (referred to as “denial of service attacks”) nor copy any pages or register identical keywords with search engines to mislead other users into thinking that they are reading EZ Gas’s legitimate web pages (referred to as “page-jacking”), or use the App or the Services for any other unlawful or objectionable conduct. Users who violate systems or network security may incur criminal or civil liability, and EZ Gas will at its absolute discretion fully co-operate with investigations of suspected criminal violations, violation of systems or network security under the leadership of law enforcement or relevant authorities;\n\n (g) attempt to probe, scan or test the vulnerability of any of EZ Gas system or network or breach any security or authentication measures;\n\n (h) avoid, bypass, remove, deactivate, impair, descramble or otherwise circumvent any technological measure implemented by us or any of the service providers or any other third party (including other users) appointed by us to protect our ability to provide the Service;\n\n (i) attempt to download the App for the use of the Services through the use of any engine, software, tool, agent, device or mechanism (including spiders, robots, crawlers, data mining tools or the like) other than the software and/or search agents provided by us or other approved third party web browsers;(i) attempt to download the App for the use of the Services through the use of any engine, software, tool, agent, device or mechanism (including spiders, robots, crawlers, data mining tools or the like) other than the software and/or search agents provided by us or other approved third party web browsers;\n\n (j) copy, disclose, modify, reformat, display, distribute, license, transmit, sell, perform, publish, transfer and/or otherwise make available any of the Services or any information obtained by you while using the Services or while accessing the App;\n\n (k) remove, change and/or obscure in any way anything on the App and/or the Services or otherwise use any material obtained whilst using the App and/or the Services except as set out in the Terms and Conditions; and\n\n (l) copy or use any material from the App and/or the Services for any commercial purpose, remove, obscure or change any copyright, trade mark or other intellectual property right notices contained in the original material, or from any material copied or printed off from the App, or obtained as a result of the Services.\n\n (m) use any of our trademarks, logo, URL or product name without EZ Gas’s express written consent;\n\n (n) attempt to decipher, decompile, disassemble or reverse engineer any of the software used to provide the Service; and\n\n (o) impersonate or misrepresent your affiliation with any person or entity.\n\n (p) attempt to receive funds from both EZ Gas and a Participating Merchant or other third party seller for the same transaction by submitting similar claims; (q) use an anonymizing proxy while registering an Account; (r) control an Account that is linked in any way to another account that has or suspected to be engaged in any restricted activities under these Terms and Conditions; (s) interfere with another’s utilization and enjoyment of the App or Services; (t) manipulate or exploit our promotional campaigns/ activities or other Services in anyway which EZ Gas may deem as improper, irregular o dishonest; (u) use the Services for, or in relation to, any illegal purpose or criminal activity of any nature; and (v) use the Services dishonestly or in bad faith or with malicious intent.\n\n 3.3 You acknowledge that chat, discussion groups or bulletin board services and similar services offered by EZ Gas (“Public Communication Services”) are public communications, and your communications may be available to others and consequently you should be cautious when disclosing personal or sensitive information or any information which may identify you. EZ Gas is not responsible for, and does not control or endorse any Public Communication Services.\n\n 3.4 Notwithstanding anything to the contrary, if any information provided by you is untrue, inaccurate, not current or incomplete, EZ Gas has the right to immediately terminate your account and refuse any and all current or future use of the Services or access to the App.",
                      style: TextStyle(fontSize: 15.0, height: 1.2)),
                ),
              ]))));

  final tncRightsOfEZGas = Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: StickyHeader(
          header: Container(
            height: 50.0,
            color: Color(0xff3D4C8A),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "The Rights of EZ Gas",
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18.0),
            ),
          ),
          content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text(
                      "4.1 EZ Gas reserves the right to make any alteration or changes to the Service, or any part thereof, or suspend or terminate the Service or any part thereof without prior notice and EZ Gas shall not be liable for any loss or inconvenience to you resulting therefrom.\n\n 4.2 EZ Gas reserves the right at its absolute discretion, from time to time, to vary, add to or otherwise amend these Terms and Conditions.\n\n 4.3 Unless otherwise notified by you, you agree that EZ Gas may send you notifications relating to promotional and marketing activities from time to time. You may opt out from receiving any promotional or marketing messages from EZ Gas by unsubscribing via email or contacting customer service.\n\n 4.4 EZ Gas may extract any details or personal information or any other data from you which is required to be used as evidence in court and/or when necessary in the event of a suspected and or proven misuse of the Service.\n\n 4.5 EZ Gas may run campaigns/contest or promotions in relation to the Service as may be notified to you from time to time. You agree that your participation in such campaign/contest/promotion shall be subject to the specific terms conditions of such campaign/contest/promotion.\n\n 4.6  You agree that by using the Services, you are giving consent to EZ Gas that the information collected by EZ Gas from you (“Personal Information”) will be used and/or disclosed in accordance to our Privacy Policy as posted on our website and Personal Data Protection Act 2010. You are advised to read our Privacy Policy to understand your rights with regards to your Personal Information.\n\n 4.7  EZ Gas may request for additional information or documentation at any time and for any reason, including but not limited to confirming your identity, age and/or to confirm your bank details or debit, credit, prepaid facilities, for example, cards which you have registered with EZ Gas. You agree that you will provide such information and/or documentation promptly to EZ Gas upon request. If you do not provide such information and/or documentation promptly, EZ Gas may, without any liability to you, either limit your use of the Services or suspend or close your Account.",
                      style: TextStyle(fontSize: 15.0, height: 1.2)),
                ),
              ]))));

  final tncIntellectualPropertyRights = Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: StickyHeader(
          header: Container(
            height: 50.0,
            color: Color(0xff3D4C8A),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Intellectual Property Rights",
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18.0),
            ),
          ),
          content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text(
                      "5.1 The Intellectual Property Rights in respect of all materials including without limitation all current and future copyrights, patent, trademarks, rights in databases, inventions or trade secrets, know-how, rights in designs, integrated circuit, topographies, trade and business names, domain names, get up, arks and devices (whether such applications can be made) which are capable of being protected and/or enforced in Malaysia and/or any relevant country of the world, any brand names, trademarks, services, products, hardware and software shall remain vested in the party originating or which has acquired the same. For clarity purposes, all trademarks used on the App and/or the Services are the trademarks of EZ Gas unless specified otherwise.\n\n 5.2 You acknowledge and agree that the Services and the App are protected by copyrights, trademarks, service marks, patents, or other proprietary rights and laws. All rights are expressly reserved.\n\n 5.3  You are only allowed to use the App and the Services as set out in the Terms and Conditions, and nothing on the App and/or the Services shall be construed as conferring any license or other transfer of rights to you of any intellectual property of other proprietary rights of EZ Gas.",
                      style: TextStyle(fontSize: 15.0, height: 1.2)),
                ),
              ]))));

  final tncDisclaimer = Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
      child: StickyHeader(
          header: Container(
            height: 50.0,
            color: Color(0xff3D4C8A),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Disclaimer",
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18.0),
            ),
          ),
          content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text(
                      "6.1 The App and the Service are provided on an “as is” and “as available” basis.\n\n 6.2 Except as expressly set out in these Terms & Conditions, all representations, conditions and warranties (whether express or implied, statutory or otherwise) including but not limited to the availability, accessibility, timeliness and uninterrupted use of the App and Service; sequence, accuracy, completeness, timeliness or the security of any data or information provided to you as part of the Service; any implied warranty of merchantability; any implied warranty of fitness for a particular purpose; any implied warranty of non-infringement; and any implied warranty arising out of the course of dealing, custom or usage of trade with respect to the Service provided by EZ Gas are expressly negative and excluded. The representations, conditions and warranties set forth in this Agreement with respect to the Services and App are the only representations, conditions and warranties made by EZ Gas and will not be enlarged or diminished without EZ Gas’s prior written approval.",
                      style: TextStyle(fontSize: 15.0, height: 1.2)),
                ),
              ]))));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Terms & conditions"),
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          tooltip: "Previous page",
          icon: Icon(Icons.arrow_back, color: Theme.of(context).buttonColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          tncIntroduction,
          tncDefinitions,
          tncUseOfService,
          tncYourResponsibility,
          tncRightsOfEZGas,
          tncIntellectualPropertyRights,
          tncDisclaimer,
        ],
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
                  "Share your invite code and discover how you and your friends can get cashback",
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
          onPressed: () {
            final RenderBox box = context.findRenderObject();
            Share.share('Order cooking gas from EZ Gas!',
                sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
          }),
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
