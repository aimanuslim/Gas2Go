import 'package:flutter/material.dart';

class DealerOrderHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DealerOrderHistoryState();
}

class DealerOrderHistoryState extends State<DealerOrderHistory> {
  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: null),
          title: new Text("History"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onPressed: null,
            )
          ],
        ),
        body: new Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
          ),
          child: ListView(
            children: <Widget>[
              _order("Order #10912", "21st March, 10:15am"),
              Divider(
                color: Colors.grey,
              ),
              _order("Order #10859", "21st March, 10:15am"),
              Divider(
                color: Colors.grey,
              ),
              _order("Order #10459", "21st March, 10:15am"),
              Divider(
                color: Colors.grey,
              ),
            ],
          ),
        ),
      );
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
