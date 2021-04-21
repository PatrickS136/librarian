import 'package:flutter/material.dart';
import 'package:librarian/constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:librarian/components/getContact.dart';

final String contactId = "/contact";

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: Column(
        children: [
          Center(
            child: Container(
              width: double.infinity,
              height: 250,
              color: brown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    size: 100,
                    color: cream,
                  ),
                  Text(
                    "Contact Us",
                    style: kAppText.copyWith(
                      color: cream,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: GetContact(),
            padding: EdgeInsets.all(50),
          ),
        ],
      ),
    );
  }
}
