import 'package:flutter/material.dart';


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
    if(str == null) {
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

  final passwordController =TextEditingController();

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
      body: SingleChildScrollView(child: 
      Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            createFormField("Full Name", (value) {
              
            },
          false,
            null),
            createFormField("New IC Number", (value) {
              if (!value.isEmpty && !_isNumeric(value)) {
                return 'Please enter digits only.';
              }
            },
          false,
            null),
            createFormField("Email address", (value) {
              if (!value.isEmpty && !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                return 'Please enter a valid email address.';
              }
            },
          false,
            null),
            createFormField("Password", (value) {
              if (!value.isEmpty && value.length < 8) {
                return 'Your password must be at least 8 characters';
              }
            },
            true,
            passwordController),
            createFormField("Confirm password", (value) {
              String enteredPassword =passwordController.text;
              if(!value.isEmpty && enteredPassword != value) {
                return "Passwords should match!";
              }
            },
            true,
            null),
            createFormField("Phone Number", (value) {
              if (!value.isEmpty && (!_isNumeric(value) || value.length != 10)) {
                return "Please enter a valid phone number.";
              }
            }, 
            false, 
            null)

          ],
        ),
        
      )
      )
      );
  
  }
}

Widget createFormField(String placeholder, Function validation, bool isPassword, TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.all(15),
    child: TextFormField(
        validator: validation,
        decoration: InputDecoration(
          labelText: placeholder
        ),
        obscureText: isPassword,
        controller: controller,
        maxLines: null,
      autovalidate: true,
      )
  );
  
  
  
}