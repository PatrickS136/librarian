import 'package:flutter/material.dart';
import 'package:librarian/constants.dart';

class ReusableButton extends StatelessWidget {
  ReusableButton({this.text, this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: Material(
        elevation: 5.0,
        color: brown,
        borderRadius: BorderRadius.circular(20.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 450.0,
          height: 50.0,
          child: Text(
            text,
            style: kButtonText,
          ),
        ),
      ),
    );
  }
}
