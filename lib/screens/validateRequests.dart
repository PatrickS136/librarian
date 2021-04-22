import 'package:flutter/material.dart';
import 'package:librarian/constants.dart';
import 'package:librarian/components/reusableButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final String requestsId = "/requests";

class ValidateRequests extends StatefulWidget {
  @override
  _ValidateRequestsState createState() => _ValidateRequestsState();
}

class _ValidateRequestsState extends State<ValidateRequests> {
  String title, email;
  final _firestore = FirebaseFirestore.instance;

  dynamic addBookRequest() async {
    dynamic user = _firestore.collection('users').doc(email);
    dynamic availableBooks =
        await _firestore.collection("books").doc(title).get();
    print(availableBooks.data());

    user.update(
      {
        "books": {
          "title": availableBooks.data()["title"],
          "author": availableBooks.data()["author"],
          "description": availableBooks.data()["description"],
          "category": availableBooks.data()["category"],
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
                "Book request validation",
                style: kAppText,
              ),
              SizedBox(
                height: 100,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  title = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter book title'),
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
                onPressed: addBookRequest,
                text: "Validate request",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
