import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginOrRegister extends StatefulWidget {
  @override
  LoginOrRegisterState createState() {
    return LoginOrRegisterState();
  }
}

class LoginOrRegisterState extends State<LoginOrRegister> {
  final brandLogo = Container(
    margin: EdgeInsets.only(top: 250.0, bottom: 100.0),
    child: Center(child: Image.asset("assets/ezgas_logo_white_text.png")),
    height: 140,
  );

  final registerButton = Container(
    margin: EdgeInsets.only(bottom: 20.0),
    child: RaisedButton(
        textColor: Color(0xff222222),
        padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 8.0),
        color: Color(0xffFFA630),
        child: Text(
          "Register",
          style: TextStyle(fontSize: 14.0),
        ),
        onPressed: () {},
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0))),
  );

  final signInButton = Container(
    child: RaisedButton(
        textColor: Color(0xffFFA630),
        padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 8.0),
        color: Color(0xff323E6E),
        child: Text(
          "Sign In",
          style: TextStyle(fontSize: 14.0),
        ),
        onPressed: () {},
        shape: new RoundedRectangleBorder(
            side: BorderSide(color: Color(0xffFFA630)),
            borderRadius: new BorderRadius.circular(30.0))),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff323E6E),
      body: Container(
          child: new Column(
        children: <Widget>[brandLogo, registerButton, signInButton],
      )),
    );
  }
}
