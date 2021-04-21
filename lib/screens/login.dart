import 'package:flutter/material.dart';
import 'package:librarian/components/reusableButton.dart';
import 'package:librarian/constants.dart';
import 'package:librarian/screens/admin.dart';
import 'package:librarian/screens/user.dart';

final String loginId = "/login";

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String password;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Welcome Back!",
                  style: kLargeText,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 50,
              ),
              ReusableButton(
                text: "Log in",
                onPressed: () {
                  if (email == "admin@admin.com" && password == "12345") {
                    Navigator.pushNamed(context, adminId);
                  } else {
                    Navigator.pushNamed(context, userId);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
