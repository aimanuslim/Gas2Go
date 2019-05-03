import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//screen 22
class ProfileTabSettings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        leading: IconButton(
          icon: new Icon (Icons.arrow_back, color: Colors.white,),
          onPressed: null,
        ),
        title: Text("Account settings",
          style: TextStyle(
            color: Colors.white,
          ),),
        backgroundColor: Colors.black,
      ),

      body: new Container(
        padding: const EdgeInsets.all(10),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
                children: <Widget>[
                  Expanded(
                    child: new Text("Personal details",
                      style: new TextStyle(
                        color: Colors.white,
                      ),),
                  ),
                ],
              ),

            new Row(
              children: <Widget>[
                Expanded (
                  child: new Text("Ahmad Saiful",
                    style: new TextStyle(
                        color: Colors.white
                    ),),
                ),

                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon (Icons.edit, color: Colors.white,),
                  onPressed: null,
                )
              ],
            ),

            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text("ahmadsaiful@gmail.com",
                    style: new TextStyle(
                        color: Colors.white
                    ),),
                ),

                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon (Icons.edit, color: Colors.white,),
                  onPressed: null,
                )
              ],
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: Text("+60172839056",
                    style: TextStyle(
                        color: Colors.white
                    ),),
                ),

                IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon (Icons.edit, color: Colors.white,),
                  onPressed: null,
                )
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Sign out",
                  style: TextStyle(
                      color: Colors.white
                  ),),

                Row(
                  children: <Widget>[
                    Icon(Icons.exit_to_app, color: Colors.white,),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}