import 'package:flutter/material.dart';

//screen 21

class ProfileTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text("Name"), //this should be pulled from server. need a var
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.settings),
            onPressed: () =>debugPrint("Edit"),
          )
        ],
      ),

      body: new Column(

      ),

      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: new Icon(Icons.home, color: Colors.grey), title: new Text("Home")),
        new BottomNavigationBarItem(icon: new Icon(Icons.format_list_bulleted, color: Colors.grey), title: new Text("Transactions", style: new TextStyle(color: Colors.white),)),
        new BottomNavigationBarItem(icon: new Icon(Icons.person, color: Colors.grey), title: new Text("Profile",style: new TextStyle(color: Colors.white)),)
      ],
      backgroundColor: Colors.black,

      ),
    );
  }

}