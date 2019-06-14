import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//screen 21

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text(
            "Ahmad Saiful"), //this should be pulled from server. need a var
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => debugPrint("Edit"),
          )
        ],
      ),
      
      body: new Column(
        children: <Widget>[
        new Row(
          children: <Widget>[
            Expanded(
              child: new Text(
                "Invite friends",
                style: new TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        
        new Row(
          children: <Widget>[
            Expanded(
              child: new Text(
                "Redemption code",
                style: new TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        
        new Row(
          children: <Widget>[
            Expanded(
              child: new Text(
                "About gas",
                style: new TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        ]
      ),
      
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home, color: Colors.grey),
              title: new Text("Home")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.format_list_bulleted, color: Colors.grey),
              title: new Text(
                "Transactions",
                style: new TextStyle(color: Colors.white),
              )),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person, color: Colors.grey),
            title:
                new Text("Profile", style: new TextStyle(color: Colors.white)),
          )
        ],
        backgroundColor: Colors.black,
      ),
    );
  }
}


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


//screen 23
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

//screen 24/25
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