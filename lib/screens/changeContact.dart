import 'package:flutter/material.dart';
import 'package:librarian/components/getContact.dart';
import 'package:librarian/constants.dart';
import 'package:librarian/components/reusableButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final String changeContactId = "/changeContact";

class ChangeContact extends StatefulWidget {
  @override
  _ChangeContactState createState() => _ChangeContactState();
}

class _ChangeContactState extends State<ChangeContact> {
  // final _firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('contact');
  String address;
  String name;
  String email;
  String phone;

  Future<void> updateUser() {
    return users
        .doc('contact')
        .update({
          'location_city': address,
          'email': email,
          'phone': phone,
          'person': name,
        })
        .then((value) => print("Updated"))
        .catchError(
          (error) => print("Failed to update: $error"),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: Container(
        padding: EdgeInsets.all(40),
        child: ListView(
          children: [
            Text(
              "Change Contact Details",
              style: kAppText,
            ),
            SizedBox(
              height: 30,
            ),
            GetContact(),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'New email'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                phone = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'New phone number'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                address = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'New address'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                name = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'New name'),
            ),
            SizedBox(
              height: 20,
            ),
            ReusableButton(
              onPressed: updateUser,
              text: "Update",
            ),
          ],
        ),
      ),
    );
  }
}
