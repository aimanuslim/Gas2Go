import 'package:flutter/material.dart';

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
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ConfirmOrder()
          ));
        },
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

//Need Screen 14

//screen 15
class RegisterAlternateAddress extends StatefulWidget {
  @override
  _RegisterAlternateAddressState createState() => _RegisterAlternateAddressState();
}

class _RegisterAlternateAddressState extends State<RegisterAlternateAddress> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            tooltip: "Previous Screen",
            icon: new Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: null,
          ),
          title: new Text("Enter New Address",
            style: new TextStyle(
              color: Colors.white,
            ),),
          backgroundColor: Colors.black,
        ),


        body: new Container(
            child: new Column(
                children: <Widget>[
                  new Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        // key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            createFormField ("Address Line 1",(){

                            },
                            ),

                            createFormField("Address Line 2", (){

                            }
                            ),

                            createFormField("City", (){

                            }
                            ),

                            createFormField("Postcode", (){

                            }
                            ),

                            createFormField("State", (){

                            }
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                  new Center(
                    child: new Container(
                      child: new Center(child: FlatButton(
                        color: Colors.grey,
                        textColor: Colors.white,
                        onPressed: null,
                        child: new Text ("Add new address",
                          style: new TextStyle(
                              fontSize: 12.3
                          ),),
                      ),),
                    ),
                  )
                ]
            )
        )

    );








  }
}

Widget createFormField(String placeholder, Function validation) {
  return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        validator: validation,
        decoration: InputDecoration(
            labelText: placeholder
        ),
        maxLines: null,
        autovalidate: true,
      )
  );


}


//NEED screen 16a and 16b


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
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => CustomerOrderComplete()
              ));
            },
          )
        ]));
  }
}

//screen 18
class CustomerOrderComplete extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(45.4),
      decoration: BoxDecoration(
        color: Colors.black
      ),
        child: new Column(
          children: <Widget>[
            Expanded(
              child: new Container(
              child: new Column(
            children: <Widget>[
            
            new Text("Order Completed", textAlign: TextAlign.center, style: new TextStyle(
              fontSize: 12.3, color: Colors.white
            ), 
            ),

            new Text("You will receive notification updates as your order progresses",
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 12.1,
              color: Colors.white
            ),),

            new Text("Order #292374",
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 20.2,
            ),),
            ]
               ), //to be made a var

            ),),
            //new Image(image: null,), //to add image

            new Container(
              child: new FlatButton(
                color: Colors.grey,
                onPressed: ()=> debugPrint ("Home"), //to be navigate to home
                child: new Text("Home"),
              ),

            ),
          ],
        ),

    );
  }

}