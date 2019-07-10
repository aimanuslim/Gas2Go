import 'package:flutter/material.dart';
import 'package:gas2go/customer_screens.dart';

class CustomerSignIn extends StatefulWidget {
  static const String id = "customer_sign_in";
  @override
  _CustomerSignInState createState() => _CustomerSignInState();
}

class _CustomerSignInState extends State<CustomerSignIn> {
  final emailInput = TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelStyle: TextStyle(color: Color(0xffFFFFFF)),
      border: OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
      labelText: 'Email address',
    ),
  );

  final passwordInput = TextField(
    obscureText: true,
    decoration: InputDecoration(
      labelStyle: TextStyle(color: Color(0xffFFFFFF)),
      border: OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
      labelText: 'Password',
    ),
  );

  final signInAsDealer = Text(
    "Sign in as dealer",
    style: TextStyle(
        fontSize: 15.0, fontWeight: FontWeight.bold, color: Color(0xffFFA630)),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xff323E6E),
        appBar: AppBar(
            title: Text("Sign in"),
            backgroundColor: Color(0xff323E6E),
            leading: IconButton(
              tooltip: "Previous page",
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).buttonColor),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                emailInput,
                SizedBox(
                  height: 50.0,
                ),
                passwordInput,
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                new CustomerForgotPassword()));
                  },
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffE6E6E6)),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                signInAsDealer,
                SizedBox(
                  height: 200.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Container(
                          // width: MediaQuery.of(context).size.width,
                          child: new RaisedButton(
                            child: Text("Sign In",
                                style: TextStyle(color: Color(0xff222222))),
                            color: Color(0xffFFA630),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            elevation: 10,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new HomeNav()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Customer - forgot password screen
// add routes
class CustomerForgotPassword extends StatefulWidget {
  static String id = "customer_forgot_password";
  @override
  _CustomerForgotPasswordState createState() => _CustomerForgotPasswordState();
}

class _CustomerForgotPasswordState extends State<CustomerForgotPassword> {
  final bodyIntro = Text(
    "Please enter your email address, and we’ll send a link for you to reset your password",
    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 15.0),
  );

  final getEmail = TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelStyle: TextStyle(color: Color(0xffFFFFFF)),
      border: OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
      labelText: 'Email address',
    ),
  );

  final bottomButton = Container(
    // width: MediaQuery.of(context).size.width,
    child: new RaisedButton(
      child: Text("Reset password", style: TextStyle(color: Color(0xff222222))),
      color: Color(0xffFFA630),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
      elevation: 10,
      onPressed: () {
        // Perform some action
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xff323E6E),
        appBar: AppBar(
            title: Text("Forgot password"),
            backgroundColor: Color(0xff323E6E),
            leading: IconButton(
              tooltip: "Previous page",
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).buttonColor),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
          child: Container(
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                bodyIntro,
                SizedBox(
                  height: 50.0,
                ),
                getEmail,
                SizedBox(
                  height: 30.0,
                ),
                Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: bottomButton,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
