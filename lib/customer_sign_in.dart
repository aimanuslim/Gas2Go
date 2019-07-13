import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gas2go/customer_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gas2go/intro.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart';

// Customer - sign in screen
class CustomerSignIn extends StatefulWidget {
  static const String id = "customer_sign_in";
  @override
  _CustomerSignInState createState() => _CustomerSignInState();
}

class _CustomerSignInState extends State<CustomerSignIn> {
  final _auth = FirebaseAuth.instance;
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
    ),
  );

  final passwordInput = TextFormField(
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

  Future<void> signInExistingUser() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      setState(() {
        showSpinner = true;
      });
      formState.save();
      try {
        final user = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (user != null) {
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
                      child: GestureDetector(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, bottom: 50.0, left: 20.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: new RaisedButton(
                                child: Text("Sign In",
                                    style: TextStyle(color: Color(0xff222222))),
                                color: Color(0xffFFA630),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                elevation: 10,
                                onPressed: signInExistingUser,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static String email;

  final bodyIntro = Text(
    "Please enter your email address, and we’ll send a link for you to reset your password",
    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 15.0),
  );

  final getEmail = TextFormField(
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
    ),
  );

  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  void resetPassword() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      setState(() {
        showSpinner = true;
      });
      formState.save();
      try {
        // await _auth.sendPasswordResetConfirmation(email: email);
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new PasswordResetConfirmation()));
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
                      child: bodyIntro,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: getEmail,
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
                                  child: new RaisedButton(
                                    child: Text("Reset password",
                                        style: TextStyle(
                                            color: Color(0xff222222))),
                                    color: Color(0xffFFA630),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    elevation: 10,
                                    onPressed: resetPassword,
                                  ),
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
        ),
      ),
    );
  }
}

class PasswordResetConfirmation extends StatefulWidget {
  @override
  _PasswordResetConfirmationState createState() =>
      _PasswordResetConfirmationState();
}

class _PasswordResetConfirmationState extends State<PasswordResetConfirmation> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xff323E6E),
        body: Container(
          alignment: AlignmentDirectional(0.0, 0.0),
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    size: 50.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    "Please check your email to reset the password for your account. After you have done so, return to this app to sign in.",
                    style: TextStyle(fontSize: 17.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Text(
                    "If you run into any issues, do get in touch with us through these official channels",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xffCCCCCC),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      facebookContact,
                      twitterContact,
                      instagramContact,
                      emailUs,
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: RaisedButton(
                    textColor: Color(0xffFFA630),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100.0, vertical: 8.0),
                    color: Color(0xff323E6E),
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 14.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new CustomerIntro()));
                    },
                    shape: new RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xffFFA630)),
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final facebookContact = Container(
  child: GestureDetector(
    onTap: () async {
      const facebookURL = "https://facebook.com";
      if (await canLaunch(facebookURL)) {
        await launch(facebookURL);
      } else {
        throw 'Could not launch $facebookURL';
      }
    },
    child: Icon(
      FontAwesomeIcons.facebookSquare,
      color: Color(0xffFFA630),
    ),
  ),
);

final twitterContact = Container(
  child: GestureDetector(
    onTap: () async {
      const twitterURL = "https://facebook.com";
      if (await canLaunch(twitterURL)) {
        await launch(twitterURL);
      } else {
        throw 'Could not launch $twitterURL';
      }
    },
    child: Icon(
      FontAwesomeIcons.twitter,
      color: Color(0xffFFA630),
    ),
  ),
);

final instagramContact = Container(
  child: GestureDetector(
    onTap: () async {
      const instagramURL = "https://facebook.com";
      if (await canLaunch(instagramURL)) {
        await launch(instagramURL);
      } else {
        throw 'Could not launch $instagramURL';
      }
    },
    child: Icon(
      FontAwesomeIcons.instagram,
      color: Color(0xffFFA630),
    ),
  ),
);

final emailUs = Container(
  child: GestureDetector(
    onTap: () async {
      const emailTo = 'mailto:<email address>?subject=<subject>&body=<body>';
      if (await canLaunch(emailTo)) {
        await launch(emailTo);
      } else {
        throw 'Could not send email to $emailTo';
      }
    },
    child: Icon(
      FontAwesomeIcons.envelopeOpen,
      color: Color(0xffFFA630),
    ),
  ),
);
