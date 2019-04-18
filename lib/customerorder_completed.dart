import 'package:flutter/material.dart';

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