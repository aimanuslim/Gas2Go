import 'package:flutter/material.dart';
import 'package:gas2go/customer_registration.dart';
import 'package:gas2go/customer_sign_in.dart';

import 'intro.dart';
import 'onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EZ Gas',
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Color(0xff323E6E),
        primaryColor: Color(0xff45569B),
        accentColor: Color(0xffFFA630),
        cardColor: Color(0xff3D4C8A),
        bottomAppBarColor: Color(0xff3D4C8A),
        buttonColor: Color(0xffFFA630),
        textSelectionColor: Color(0xff222222),
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: CustomerOnboarding.id,
      routes: {
        CustomerOnboarding.id: (context) => CustomerOnboarding(),
        CustomerAppEntry.id: (context) => CustomerAppEntry(),
        CustomerSignIn.id: (context) => CustomerSignIn(),
        CustomerRegisterPartOne.id: (context) => CustomerRegisterPartOne(),
        CustomerRegisterPartTwo.id: (context) => CustomerRegisterPartTwo(),
        CustomerForgotPassword.id: (context) => CustomerForgotPassword(),
      },
    );
  }
}
