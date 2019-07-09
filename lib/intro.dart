import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:gas2go/texts.dart';
import 'commonelements.dart';

// Onboarding screens
class CustomerOnboarding extends StatefulWidget {
  @override
  _CustomerOnboardingState createState() => _CustomerOnboardingState();
}

class _CustomerOnboardingState extends State<CustomerOnboarding> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        maxLineTitle: 200,
        widthImage: 300,
        heightImage: 300,
        title: "EZ-ly order cooking gas",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        pathImage: "assets/onboarding_1_order.png",
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
    slides.add(
      Slide(
        maxLineTitle: 200,
        widthImage: 300,
        heightImage: 300,
        title: "Our suppliers will deliver the goods",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        pathImage: "assets/onboarding_2_delivery.png",
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
    slides.add(
      Slide(
        maxLineTitle: 200,
        widthImage: 300,
        heightImage: 300,
        title: "Invite friends and earn cashbacks",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. - (this feature is coming soon)",
        pathImage: "assets/onboarding_3_cashbacks.png",
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }

  void onDonePress() {
    // Do what you want
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}

class CustomerAppEntry extends StatefulWidget {
  @override
  _CustomerAppEntryState createState() => _CustomerAppEntryState();
}

class _CustomerAppEntryState extends State<CustomerAppEntry> {
  @override
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
    return Scaffold(
      backgroundColor: Color(0xff323E6E),
      body: Container(
          child: new Column(
        children: <Widget>[brandLogo, registerButton, signInButton],
      )),
    );
  }
}

class CustomerSignIn extends StatefulWidget {
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

  final forgotPasswordLink = Text(
    "Forgot password?",
    style: TextStyle(
        fontSize: 15.0, fontWeight: FontWeight.bold, color: Color(0xffE6E6E6)),
  );

  final signInAsDealer = Text(
    "Sign in as dealer",
    style: TextStyle(
        fontSize: 15.0, fontWeight: FontWeight.bold, color: Color(0xffFFA630)),
  );

  final signInButton = Container(
    // width: MediaQuery.of(context).size.width,
    child: new RaisedButton(
      child: Text("Sign In", style: TextStyle(color: Color(0xff222222))),
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
                forgotPasswordLink,
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
                        child: signInButton,
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

// Customer - register screen 1
// add routes
class CustomerRegisterPartOne extends StatefulWidget {
  @override
  _CustomerRegisterPartOneState createState() =>
      _CustomerRegisterPartOneState();
}

class _CustomerRegisterPartOneState extends State<CustomerRegisterPartOne> {
  final fullName = TextField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      labelStyle: TextStyle(color: Color(0xffFFFFFF)),
      border: OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
      labelText: 'Full name',
    ),
  );

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

  final confirmPassword = TextField(
    obscureText: true,
    decoration: InputDecoration(
      labelStyle: TextStyle(color: Color(0xffFFFFFF)),
      border: OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
      labelText: 'Confirm password',
    ),
  );

  final phoneNumber = TextField(
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
      labelStyle: TextStyle(color: Color(0xffFFFFFF)),
      border: OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
      labelText: 'Phone number',
    ),
  );

  final alreadyRegistered = Text(
    "Have an account?",
    style: TextStyle(
        fontSize: 15.0, fontWeight: FontWeight.bold, color: Color(0xffFFA630)),
  );

  final registerButton = Container(
    // width: MediaQuery.of(context).size.width,
    child: new RaisedButton(
      child: Text("Register", style: TextStyle(color: Color(0xff222222))),
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
            title: Text("Register - Account"),
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
                fullName,
                SizedBox(
                  height: 50.0,
                ),
                emailInput,
                SizedBox(
                  height: 50.0,
                ),
                passwordInput,
                SizedBox(
                  height: 50.0,
                ),
                confirmPassword,
                SizedBox(
                  height: 50.0,
                ),
                phoneNumber,
                SizedBox(
                  height: 50.0,
                ),
                Align(alignment: Alignment.center, child: alreadyRegistered),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: registerButton,
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

class CustomerRegisterPartTwo extends StatefulWidget {
  @override
  _CustomerRegisterPartTwoState createState() =>
      _CustomerRegisterPartTwoState();
}

class _CustomerRegisterPartTwoState extends State<CustomerRegisterPartTwo> {
  final addressIntro = Text(
    "Please key in your address for us to deliver the goods to you. You can manage your addresses in profile settings.",
    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 15.0),
  );

  // final mapPinIcon = Row(
  //   children: <Widget>[
  //     Icon(FontAwesomeIcons.mapPin),
  //     Text("Get my current location")
  //   ],
  // );

  final userInitialAddress = TextField(
    keyboardType: TextInputType.multiline,
    minLines: 5,
    maxLines: null,
    decoration: InputDecoration(
      labelStyle: TextStyle(color: Color(0xffFFFFFF)),
      border: OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
      labelText: 'Delivery address',
    ),
  );

  final completeRegistrationButton = Container(
    // width: MediaQuery.of(context).size.width,
    child: new RaisedButton(
      child: Text("Complete registration",
          style: TextStyle(color: Color(0xff222222))),
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
            title: Text("Register - Address"),
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
                addressIntro,
                SizedBox(
                  height: 50.0,
                ),
                // mapPinIcon,
                userInitialAddress,
                SizedBox(
                  height: 50.0,
                ),
                // saveAddressBox,
                completeRegistrationButton,
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
