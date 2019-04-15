import 'package:flutter/material.dart';

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
