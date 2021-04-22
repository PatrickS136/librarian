import 'package:flutter/material.dart';
import 'package:librarian/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:librarian/components/reusableButton.dart';

final String returnId = "/returnId";

class ValidateReturns extends StatefulWidget {
  @override
  _ValidateReturnsState createState() => _ValidateReturnsState();
}

class _ValidateReturnsState extends State<ValidateReturns> {
  String email;
  final _firestore = FirebaseFirestore.instance;

  dynamic returnBook() {
    dynamic user = _firestore.collection('users').doc(email);

    user.update(
      {
        "books": {
          "title": "",
          "author": "",
          "description": "",
          "category": "",
        }
      },
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Book return validation",
                style: kAppText,
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter customer email',
                ),
              ),
              ReusableButton(
                onPressed: returnBook,
                text: "Validate return",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
