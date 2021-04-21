import 'package:flutter/material.dart';
import 'package:librarian/components/reusableButton.dart';
import 'package:librarian/constants.dart';
import 'package:librarian/screens/user.dart';

final String registerId = "/register";

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  "Join us!",
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
                text: "Register",
                onPressed: () {
                  Navigator.pushNamed(context, userId);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
