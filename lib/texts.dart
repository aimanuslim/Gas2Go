import 'package:flutter/material.dart';

Text headerText({string, double headerSize = 12}) {
  return Text(string,
      style: TextStyle(color: Colors.grey, fontSize: headerSize));
}

GestureDetector linkText(string, pressAction) {
  return GestureDetector(
    child: Text(
      string,
      style: TextStyle(color: Colors.blue),
    ),
    onTap: () {
      if(pressAction != null) {
        pressAction();
      }
    },        
  );
}

Text focusText(string) {
  return Text(
    string,
    style: TextStyle(fontWeight: FontWeight.bold),
  );
}

Text smallText(string) {
  return Text(
    string,
    style: TextStyle(fontSize: 10),
  );
}

Text normalText(string) {
  return Text(string,
      style: TextStyle(
          color: Colors.black //TODO: change this to white with black backgroud
          ));
}

Text nameText(string) {
  return Text(
    string,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
  );
}

Text significantText(string) {
  return Text(string,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.black26,
      ));
}
