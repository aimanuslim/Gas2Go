import 'package:flutter/material.dart';
import 'package:gas2go/commonelements.dart';
import 'package:gas2go/texts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

// void main() => runApp(MyApp());

// Screens 2, 3, 4
class Onboarding extends StatefulWidget {
  @override
  OnboardingState createState() {
    return new OnboardingState();
  }
}

class OnboardingState extends State<Onboarding> {
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
        backgroundColor: Color(0xff323E6E),
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
        backgroundColor: Color(0xff323E6E),
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
        backgroundColor: Color(0xff323E6E),
      ),
    );
  }

  void onDonePress() {
    // TODO: go to next screen
  }

  void onSkipPress() {
    // TODO: go to next screen
    // CURRENTLY NOT WORKING
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
        slides: this.slides,
        onDonePress: this.onDonePress,
        onSkipPress: this.onSkipPress,
        colorDot: Colors.black87,
        colorActiveDot: Colors.white);
  }
}

// Screen 5a
class CustomerSignInPage extends StatefulWidget {
  @override
  CustomerSignInState createState() {
    return CustomerSignInState();
  }
}

final _formKey = GlobalKey<FormState>();

class CustomerSignInState extends State<CustomerSignInPage> {
  @override
  Widget build(BuildContext context) {
    return new SignInScaffold(
      alternateSignInText: "Sign in as dealer",
      scaffoldAppBarTitle: "Sign in",
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

// Screen 6
class CustomerRegisterPage extends StatefulWidget {
  @override
  CustomerRegisterState createState() {
    return CustomerRegisterState();
  }
}

class CustomerRegisterState extends State<CustomerRegisterPage> {
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

  // TODO: validation not too immediately
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
                if (!value.isEmpty && !isNumeric(value)) {
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
                    (!isNumeric(value) || value.length != 10)) {
                  return "Please enter a valid phone number.";
                }
              }, false, null)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        // onPressed: _changeText,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomerRegisterAddressPage()));
        },
      ),
    );
  }
}

//need screen 7a and 7b

// screen 8
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
        foregroundColor: Colors.white, onPressed: () {},
      ),
    );
  }
}
