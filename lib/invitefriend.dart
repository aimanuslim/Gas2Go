import 'package:flutter/material.dart';

class InviteFriend extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          tooltip: "Previous page",
          icon: new Icon (Icons.arrow_back, color: Colors.white),
          onPressed: null,
        ),
      ),

      body: new Container (
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(
              //new Image(image: Image.file(file)
            ),

            new Container (
              child: new Text("Enjoy Cashback & Perks", style: new TextStyle(
                  color: Colors.white, fontSize: 15.1
              ),),
            ),

            new Container (
              child:new Text("Share your invite code an discover how you and your friends can get cashback",
                textAlign: TextAlign.center,
                style: new TextStyle(
                    color: Colors.white, fontSize: 12.1
                ),),
            ),

            new Container (
              child: new Center(
              child: new HowDoInvitesWork(),
            ),
            ),

            new Container (
              child: new Center (
                child: new InviteCode ()
              ),
            ),

          ],
        ),
      )



    );
  }

}

class InviteCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      onTap: null ,

      child: new Container(
        padding: const EdgeInsets.all(6) ,
        decoration: BoxDecoration(
          color: Colors.white30
        ),
        child: new Text ("saiful0145454",
            style: new TextStyle (color: Colors.blueAccent, fontSize: 12.1)),
      )
    );
  }

}

class HowDoInvitesWork extends StatelessWidget{
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
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );},

      child: new Text("How do invites work?",
        style: new TextStyle(
            color: Colors.white, fontSize: 12.1,
        decoration: TextDecoration.underline),),
    );
  }
}