import 'dart:async';

import 'package:flutter/material.dart';
import 'customer_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

// Customer - register screen
class CustomerRegistration extends StatefulWidget {
  static const String id = "customer_registration_one";
  @override
  _CustomerRegistrationState createState() => _CustomerRegistrationState();
}

class _CustomerRegistrationState extends State<CustomerRegistration> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static String email;
  static String password;

  @override
  void initState() {
    RaisedButton(
      onPressed: null,
    );
    super.initState();
  }

  final emailInput = TextFormField(
    validator: (value) => !value.contains('@') ? 'Not a valid email.' : null,
    onSaved: (value) {
      email = value;
    },
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
      // errorText: 'Your email must contain a "@" and a "."',
    ),
  );

  final passwordInput = TextFormField(
    validator: (value) =>
        value.length < 6 ? 'Password must contain at least 6 characters' : null,
    onSaved: (value) {
      password = value;
    },
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

  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  Future<void> registerNewUser() async {
    final formState = _formKey.currentState;
    setState(() {
      showSpinner = true;
    });
    if (formState.validate()) {
      formState.save();
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        if (newUser != null) {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new HomeNav()));
        }
        setState(() {
          showSpinner = false;
        });
      } catch (e) {
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xff323E6E),
        appBar: AppBar(
            title: Text("Register"),
            backgroundColor: Color(0xff323E6E),
            leading: IconButton(
              tooltip: "Previous page",
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).buttonColor),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, bottom: 30.0, left: 20.0),
                    child: emailInput,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, bottom: 30.0, left: 20.0),
                    child: passwordInput,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, bottom: 50.0, left: 20.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: new RaisedButton(
                              child: Text("Complete Registration",
                                  style: TextStyle(color: Color(0xff222222))),
                              color: Color(0xffFFA630),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              elevation: 10,
                              onPressed: registerNewUser,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
