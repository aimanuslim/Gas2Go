import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'customer_registration.dart';
import 'customer_sign_in.dart';

class CustomerIntro extends StatelessWidget {
  static const String id = "customer_app_entry";

  @override
  Widget build(BuildContext context) {
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
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new CustomerRegistration()));
          }),
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
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new CustomerSignIn()));
          },
          shape: new RoundedRectangleBorder(
              side: BorderSide(color: Color(0xffFFA630)),
              borderRadius: new BorderRadius.circular(30.0))),
    );

    return Scaffold(
      backgroundColor: Color(0xff323E6E),
      body: SingleChildScrollView(
        child: Container(
            child: new Column(
          children: <Widget>[
            brandLogo,
            registerButton,
            signInButton,
          ],
        )),
      ),
    );
  }
}

// class _CustomerAppEntryState extends State<CustomerAppEntry> {
//   @override
//   Widget build(BuildContext context) {
//     var registerButton2 = registerButton;
//     return
//   }
// }
