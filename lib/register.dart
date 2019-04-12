import 'package:flutter/material.dart';
import 'commonelements.dart';
import 'texts.dart';

// RegisterUserInfoPage includes
// - Full name
// - New IC Number
// - Email Address
// - Password
// - Phone number

// Screen 6
class RegisterUserInfoPage extends StatefulWidget {
  @override
  RegisterUserInfoState createState() {
    return RegisterUserInfoState();
  }
}

bool _isNumeric(String str) {
  if (str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}

class RegisterUserInfoState extends State<RegisterUserInfoPage> {
  @override
  final _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
  }

  final passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  // TODO: button submit and validation
  // TODO: need to validate only when enter is pressed not after every typing
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              createFormField("Full Name", (value) {}, false, null),
              createFormField("New IC Number", (value) {
                if (!value.isEmpty && !_isNumeric(value)) {
                  return 'Please enter digits only.';
                }
              }, false, null),
              createFormField("Email address", (value) {
                if (!value.isEmpty &&
                    !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  return 'Please enter a valid email address.';
                }
              }, false, null),
              createFormField("Password", (value) {
                if (!value.isEmpty && value.length < 8) {
                  return 'Your password must be at least 8 characters';
                }
              }, true, passwordController),
              createFormField("Confirm password", (value) {
                String enteredPassword = passwordController.text;
                if (!value.isEmpty && enteredPassword != value) {
                  return "Passwords should match!";
                }
              }, true, null),
              createFormField("Phone Number", (value) {
                if (!value.isEmpty &&
                    (!_isNumeric(value) || value.length != 10)) {
                  return "Please enter a valid phone number.";
                }
              }, false, null)
            ],
          ),
        )));
  }
}

// Screen 5a
class SignInPage extends StatefulWidget {
  @override
  SignInState createState() {
    return SignInState();
  }
}

final _formKey = GlobalKey<FormState>();

class SignInState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Sign In"),
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            )),
        body:
            // SingleChildScrollView(
            //   child: Form(
            //   key: _formKey,
            // child:
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  createFormField("Email address", (value) {
                    if (!value.isEmpty &&
                        !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Please enter a valid email address.';
                    }
                  }, false, null),
                  createFormField("Password", (value) {
                    if (!value.isEmpty && value.length < 8) {
                      return 'Your password must be at least 8 characters';
                    }
                  }, true, null),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: linkText("Forgot Password?"))
                ],
              ),
              Column(
                children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(vertical: 5), child: linkText("Sign in as dealer")),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10), child: RaisedButton(
            child: Text("Sign In", style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            elevation: 50,
            onPressed: () {
              // Perform some action
            },))
              ],)
                  //   )
                  // ])
            ]));
  }
}
