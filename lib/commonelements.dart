import 'package:flutter/material.dart';

Widget getLine(
    {color: Colors.black87,
    double width: 1,
    double top: 0,
    double bottom: 0,
    double left: 0,
    double right: 0}) {
  return Padding(
      padding:
          EdgeInsets.only(top: top, bottom: bottom, right: right, left: left),
      child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: width, color: color)))));
}
