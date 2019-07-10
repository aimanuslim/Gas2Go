// Customer - register screen 1
// add routes
import 'package:flutter/material.dart';

import 'customer_screens.dart';

class CustomerRegisterPartOne extends StatefulWidget {
  static const String id = "customer_registration_one";
  @override
  _CustomerRegisterPartOneState createState() =>
      _CustomerRegisterPartOneState();
}

class _CustomerRegisterPartOneState extends State<CustomerRegisterPartOne> {
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
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffFFA630))),
        labelText: 'Phone number',
        prefixText: '+60'),
  );

  final alreadyRegistered = Text(
    "Have an account?",
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
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Color(0xffFFFFFF)),
                    border: OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffFFA630))),
                    labelText: 'Full name',
                  ),
                ),
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
                        child: Container(
                          // width: MediaQuery.of(context).size.width,
                          child: new RaisedButton(
                            child: Text("Next",
                                style: TextStyle(color: Color(0xff222222))),
                            color: Color(0xffFFA630),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            elevation: 10,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                          new CustomerRegisterPartTwo()));
                            },
                          ),
                        ),
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
  static String id = "customer_registration_two";
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
                Container(
                  // width: MediaQuery.of(context).size.width,
                  child: new RaisedButton(
                    child: Text("Complete registration",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
