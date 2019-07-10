// Customer - register screen 1
// add routes
import 'package:flutter/material.dart';
import 'customer_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomerRegistration extends StatefulWidget {
  static const String id = "customer_registration_one";
  @override
  _CustomerRegistrationState createState() => _CustomerRegistrationState();
}

class _CustomerRegistrationState extends State<CustomerRegistration> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static String email;
  static String password;

  // final nameInput = TextField(
  //   keyboardType: TextInputType.text,
  //   decoration: InputDecoration(
  //     labelStyle: TextStyle(color: Color(0xffFFFFFF)),
  //     border: OutlineInputBorder(),
  //     enabledBorder: const OutlineInputBorder(
  //       borderSide: const BorderSide(color: Colors.grey),
  //     ),
  //     focusedBorder:
  //         OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
  //     labelText: 'Full name',
  //   ),
  // );

  final emailInput = TextField(
    onChanged: (value) {
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

  final passwordInput = TextField(
    onChanged: (value) {
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
      helperText: 'Password must contain at least 6 characters',
      // suffixIcon: Icon(FontAwesomeIcons.eye),
    ),
  );

  // final confirmPassword = TextField(
  //   obscureText: true,
  //   decoration: InputDecoration(
  //     labelStyle: TextStyle(color: Color(0xffFFFFFF)),
  //     border: OutlineInputBorder(),
  //     enabledBorder: const OutlineInputBorder(
  //       borderSide: const BorderSide(color: Colors.grey),
  //     ),
  //     focusedBorder:
  //         OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
  //     labelText: 'Confirm password',
  //   ),
  // );

  // final phoneNumber = TextField(
  //   keyboardType: TextInputType.phone,
  //   decoration: InputDecoration(
  //       labelStyle: TextStyle(color: Color(0xffFFFFFF)),
  //       border: OutlineInputBorder(),
  //       enabledBorder: const OutlineInputBorder(
  //         borderSide: const BorderSide(color: Colors.grey),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: Color(0xffFFA630))),
  //       labelText: 'Phone number',
  //       prefixText: '+60'),
  // );

  // final addressIntro = Text(
  //   "Please key in your address for us to deliver the goods to you.",
  //   style: TextStyle(color: Color(0xffFFFFFF), fontSize: 15.0),
  // );

  // final addressLineOne = TextField(
  //   keyboardType: TextInputType.text,
  //   decoration: InputDecoration(
  //     labelStyle: TextStyle(color: Color(0xffFFFFFF)),
  //     border: OutlineInputBorder(),
  //     enabledBorder: const OutlineInputBorder(
  //       borderSide: const BorderSide(color: Colors.grey),
  //     ),
  //     focusedBorder:
  //         OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
  //     labelText: 'Address line 1',
  //   ),
  // );

  // final addressLineTwo = TextField(
  //   keyboardType: TextInputType.text,
  //   decoration: InputDecoration(
  //     labelStyle: TextStyle(color: Color(0xffFFFFFF)),
  //     border: OutlineInputBorder(),
  //     enabledBorder: const OutlineInputBorder(
  //       borderSide: const BorderSide(color: Colors.grey),
  //     ),
  //     focusedBorder:
  //         OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
  //     labelText: 'Address line 2',
  //   ),
  // );

  // final addressPostcode = TextField(
  //   keyboardType: TextInputType.number,
  //   decoration: InputDecoration(
  //     labelStyle: TextStyle(color: Color(0xffFFFFFF)),
  //     border: OutlineInputBorder(),
  //     enabledBorder: const OutlineInputBorder(
  //       borderSide: const BorderSide(color: Colors.grey),
  //     ),
  //     focusedBorder:
  //         OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
  //     labelText: 'Postcode',
  //   ),
  // );

  // final addressCity = TextField(
  //   keyboardType: TextInputType.text,
  //   decoration: InputDecoration(
  //     labelStyle: TextStyle(color: Color(0xffFFFFFF)),
  //     border: OutlineInputBorder(),
  //     enabledBorder: const OutlineInputBorder(
  //       borderSide: const BorderSide(color: Colors.grey),
  //     ),
  //     focusedBorder:
  //         OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
  //     labelText: 'City',
  //   ),
  // );

  // final addressState = TextField(
  //   keyboardType: TextInputType.text,
  //   decoration: InputDecoration(
  //     labelStyle: TextStyle(color: Color(0xffFFFFFF)),
  //     border: OutlineInputBorder(),
  //     enabledBorder: const OutlineInputBorder(
  //       borderSide: const BorderSide(color: Colors.grey),
  //     ),
  //     focusedBorder:
  //         OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
  //     labelText: 'State',
  //   ),
  // );

  final _formKey = GlobalKey<FormState>();

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
        body: Form(
          key: _formKey,
          child: Container(
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.only(
                //       top: 50.0, right: 20.0, bottom: 30.0, left: 20.0),
                //   child: nameInput,
                // ),
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
                // Padding(
                //   padding: const EdgeInsets.only(
                //       right: 20.0, bottom: 30.0, left: 20.0),
                //   child: confirmPassword,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       right: 20.0, bottom: 50.0, left: 20.0),
                //   child: phoneNumber,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //   child: addressIntro,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       top: 30.0, right: 20.0, bottom: 30.0, left: 20.0),
                //   child: addressLineOne,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       right: 20.0, bottom: 30.0, left: 20.0),
                //   child: addressLineTwo,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       right: 20.0, bottom: 30.0, left: 20.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     // mainAxisSize: MainAxisSize.max,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: <Widget>[
                //       Expanded(
                //         child: Padding(
                //           padding: const EdgeInsets.only(right: 30.0),
                //           child: addressPostcode,
                //         ),
                //         flex: 1,
                //       ),
                //       Expanded(
                //         child: addressCity,
                //         flex: 1,
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       right: 20.0, bottom: 50.0, left: 20.0),
                //   child: addressState,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20.0, bottom: 50.0, left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Container(
                            // width: MediaQuery.of(context).size.width,
                            child: new RaisedButton(
                              child: Text("Complete Registration",
                                  style: TextStyle(color: Color(0xff222222))),
                              color: Color(0xffFFA630),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              elevation: 10,
                              onPressed: () async {
                                try {
                                  final newUser = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  if (newUser != null) {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                new HomeNav()));
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              }
                              // try {
                              //   final newUser =
                              //       _auth.createUserWithEmailAndPassword(
                              //           email: email, password: password);
                              //   if (newUser != null) {
                              //     Navigator.push(
                              //         context,
                              //         new MaterialPageRoute(
                              //             builder: (context) =>
                              //                 new HomeNav()));
                              //   }
                              // } catch (e) {
                              //   print(e);
                              // }
                              ,
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
    );
  }
}

// class CustomerRegisterPartTwo extends StatefulWidget {
//   static String id = "customer_registration_two";
//   @override
//   _CustomerRegisterPartTwoState createState() =>
//       _CustomerRegisterPartTwoState();
// }

// class _CustomerRegisterPartTwoState extends State<CustomerRegisterPartTwo> {
//   final addressIntro = Text(
//     "Please key in your address for us to deliver the goods to you. You can manage your addresses in profile settings.",
//     style: TextStyle(color: Color(0xffFFFFFF), fontSize: 15.0),
//   );

//   // final mapPinIcon = Row(
//   //   children: <Widget>[
//   //     Icon(FontAwesomeIcons.mapPin),
//   //     Text("Get my current location")
//   //   ],
//   // );

//   final userInitialAddress = TextField(
//     keyboardType: TextInputType.multiline,
//     minLines: 5,
//     maxLines: null,
//     decoration: InputDecoration(
//       labelStyle: TextStyle(color: Color(0xffFFFFFF)),
//       border: OutlineInputBorder(),
//       enabledBorder: const OutlineInputBorder(
//         borderSide: const BorderSide(color: Colors.grey),
//       ),
//       focusedBorder:
//           OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFA630))),
//       labelText: 'Delivery address',
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       child: Scaffold(
//         resizeToAvoidBottomPadding: false,
//         backgroundColor: Color(0xff323E6E),
//         appBar: AppBar(
//             title: Text("Register - Address"),
//             backgroundColor: Color(0xff323E6E),
//             leading: IconButton(
//               tooltip: "Previous page",
//               icon:
//                   Icon(Icons.arrow_back, color: Theme.of(context).buttonColor),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             )),
//         body: Padding(
//           padding: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
//           child: Container(
//             child: ListView(
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               // mainAxisSize: MainAxisSize.max,
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 addressIntro,
//                 SizedBox(
//                   height: 50.0,
//                 ),
//                 // mapPinIcon,
//                 userInitialAddress,
//                 SizedBox(
//                   height: 50.0,
//                 ),
//                 // saveAddressBox,
//                 Container(
//                   // width: MediaQuery.of(context).size.width,
//                   child: new RaisedButton(
//                     child: Text("Complete registration",
//                         style: TextStyle(color: Color(0xff222222))),
//                     color: Color(0xffFFA630),
//                     shape: new RoundedRectangleBorder(
//                         borderRadius: new BorderRadius.circular(30.0)),
//                     elevation: 10,
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           new MaterialPageRoute(
//                               builder: (context) => new HomeNav()));
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
