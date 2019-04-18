import 'package:flutter/material.dart';

class ConfirmOrder extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          tooltip: "Previous Screen",
          icon: new Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: null,
        ),
        title: new Text("Confirm Address"),
      ),

      body: new Container(
        child: Column(
          children: <Widget>[
            new Expanded(
              child: new Container(

              ),

            ),

            new Container(
              child: new Center(
                child: FlatButton(
                  color: Colors.grey,
                  textColor: Colors.white,
                  onPressed: ()=> debugPrint ("Confirm"),
                  child: new Text("Confirm Address", 
                  style: new TextStyle(
                    fontSize: 12.3
                  ) ,
                  ),
                ),
              ),
            )
          ],
        ),
      ),

      
    );
  }

} 