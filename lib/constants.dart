import 'package:flutter/material.dart';

const Color cream = Color.fromRGBO(240, 227, 202, 1);
const Color orange = Color.fromRGBO(255, 131, 3, 1);
const Color brown = Color.fromRGBO(163, 87, 9, 1);
const Color black = Color.fromRGBO(27, 26, 23, 1);

const kWelcomeScreen = TextStyle(
  fontSize: 60,
  fontWeight: FontWeight.bold,
  color: brown,
);

const kButtonText = TextStyle(
  color: cream,
  fontSize: 20,
  letterSpacing: 4,
  // fontFamily: "Oswald",
  fontWeight: FontWeight.w700,
);

const kLargeText = TextStyle(
  fontSize: 60,
  fontWeight: FontWeight.w800,
  letterSpacing: 4,
  // fontFamily: "Oswald",
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(28.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: orange, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(28.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(28.0)),
  ),
);
