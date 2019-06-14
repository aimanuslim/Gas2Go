import 'package:flutter/material.dart';
import 'package:gas2go/commonelements.dart';

import 'texts.dart';

// screen 1: logo not ready //



// screen 5b: dealer sign in //

class DealerSignInPage extends StatefulWidget {
  @override
  DealerSignInState createState() => DealerSignInState();
}

class DealerSignInState extends State<DealerSignInPage> {
  @override
  Widget build(BuildContext context) {
    return SignInScaffold(
      alternateSignInText: "Sign in as customer",
      scaffoldAppBarTitle: "Dealer Sign In",
    );
  }
}

class SignInScaffold extends StatelessWidget {
  const SignInScaffold({
    Key key,
    this.scaffoldAppBarTitle,
    this.alternateSignInText,
  }) : super(key: key);

  final String scaffoldAppBarTitle;
  final String alternateSignInText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(this.scaffoldAppBarTitle),
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
                      child: linkText("Forgot Password?", () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()));
                      }))
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: linkText(this.alternateSignInText, null)),
                  new CommonProceedButton(
                    text: "Sign In",
                  ),
                ],
              )
              //   )
              // ])
            ]));
  }
}

// screen 8: forgot password //

class ForgotPasswordPage extends StatefulWidget {
  @override
  ForgotPasswordState createState() {
    return ForgotPasswordState();
  }
}

class ForgotPasswordState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: focusText(
                "Please enter your email address and we'll send a link for you to reset your password."),
          ),
          createFormField("Email address", (value) {
            if (!value.isEmpty &&
                !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
              return 'Please enter a valid email address.';
            }
          }, false, null)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        // onPressed: _changeText,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    );
  }
}
