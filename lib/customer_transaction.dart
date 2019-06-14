import 'package:flutter/material.dart';
import 'texts.dart';

//screen 19
class TransactionHistory extends StatefulWidget{
  @override
  _TransactionHistoryState createState() {
    return _TransactionHistoryState();
  }

}

class _TransactionHistoryState extends State<TransactionHistory>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Transaction History",
          style: new TextStyle(
            color: Colors.white,
          ),),
        backgroundColor: Colors.black,
      ),

      body: new Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
        ),
        child: ListView(
          children: <Widget>[
            _order("Order #10959", "21st March, 10:15am"), Divider (color: Colors.grey,),
            _order("Order #10678", "21st March, 10:15am"), Divider (color: Colors.grey,),
            _order("Order #10459", "21st March, 10:15am"), Divider (color: Colors.grey,),
            _order("Order #10244", "21st March, 10:15am"), Divider(color: Colors.grey,),
            _order("Order #10244", "21st March, 10:15am"), Divider(color: Colors.grey,),
          ],
        ),
      ),

      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: new Icon(Icons.home, color: Colors.grey), title: new Text("Home")),
        new BottomNavigationBarItem(icon: new Icon(Icons.format_list_bulleted, color: Colors.grey), title: new Text("Transactions")),
        new BottomNavigationBarItem(icon: new Icon(Icons.person, color: Colors.grey), title: new Text("Profile")),
      ],) ,


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
  subtitle: Text(subtitle,
  style: TextStyle(
      color: Colors.grey
  ),),
  );


// Screen 20
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
            ),),
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
