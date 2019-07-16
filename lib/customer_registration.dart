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

  final emailInput = TextFormField(
    validator: _validateEmail,
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
    ),
  );

  static String _validateEmail(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter email address";
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the email is valid
      return null;
    }

    // The pattern of the email didn't match the regex above.
    return 'Please enter a valid email';
  }

  final passwordInput = TextFormField(
    validator: _validatePassword,
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

  static String _validatePassword(String value) {
    String patttern = r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Password is required";
    } else if (value.length < 8) {
      return "Password must have a minimum of 8 characters";
    } else if (!regExp.hasMatch(value)) {
      return "Please set a strong password, containing at least one uppercase letter,\none lowercase letter and one number. ";
    }
    return null;
  }

  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  Future<void> registerNewUser() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      setState(() {
        showSpinner = true;
      });
      formState.save();
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        newUser.sendEmailVerification();
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
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff323E6E),
      appBar: AppBar(
          title: Text("Register"),
          backgroundColor: Color(0xff323E6E),
          leading: IconButton(
            tooltip: "Previous page",
            icon: Icon(Icons.arrow_back, color: Theme.of(context).buttonColor),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: emailInput,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: passwordInput,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
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
