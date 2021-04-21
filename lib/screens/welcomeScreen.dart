import 'package:flutter/material.dart';
import 'package:librarian/constants.dart';
import 'package:librarian/components/reusableButton.dart';
import 'package:librarian/screens/login.dart';
import 'package:librarian/screens/register.dart';

final String welcomeId = "/welcome";

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Icon(
                Icons.book,
                size: 100,
                color: brown,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Librarian",
                style: kWelcomeScreen,
              ),
              SizedBox(
                height: 50,
              ),
              ReusableButton(
                text: "Log in",
                onPressed: () {
                  Navigator.pushNamed(context, loginId);
                },
              ),
              ReusableButton(
                text: "Register",
                onPressed: () {
                  Navigator.pushNamed(context, registerId);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
