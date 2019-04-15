import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTabAboutUs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black12,
      appBar: new AppBar(
        leading: IconButton(
          icon: new Icon (Icons.arrow_back, color: Colors.white,),
          onPressed: null,
        ),
        title: new Text("About",
          style: new TextStyle(
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
                    child: new Text("About us",
                      style: new TextStyle(
                        color: Colors.white,
                      ),),
                  ),

                  new IconButton(
                    iconSize: 12,
                    alignment: Alignment.center,
                    icon: new Icon (Icons.arrow_forward_ios, color: Colors.white,),
                    onPressed: null,
                  )
                ],
              ),

            new Row(
              children: <Widget>[
                Expanded (
                  child: new Text("Visit our website",
                    style: new TextStyle(
                        color: Colors.white
                    ),),
                ),

                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon (Icons.arrow_forward_ios, color: Colors.white,),
                  onPressed: null,
                )
              ],
            ),

            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text("Privacy Policy",
                    style: new TextStyle(
                        color: Colors.white
                    ),),
                ),

                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon (Icons.arrow_forward_ios, color: Colors.white,),
                  onPressed: null,
                )
              ],
            ),

            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text("Terms & Conditions",
                    style: new TextStyle(
                        color: Colors.white
                    ),),
                ),

                new IconButton(
                  iconSize: 12,
                  alignment: Alignment.center,
                  icon: new Icon (Icons.arrow_forward_ios, color: Colors.white,),
                  onPressed: null,
                )
              ],
            ),

            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("Follow us",
                  style: new TextStyle(
                      color: Colors.white
                  ),),

                new Row(
                  children: <Widget>[
                    new Icon(Icons.battery_alert, color: Colors.white,),
                    new Icon(Icons.battery_full, color: Colors.white,),
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