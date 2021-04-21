import 'package:flutter/material.dart';
import 'package:librarian/components/reusableButton.dart';
import 'package:librarian/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:librarian/screens/changeContact.dart';

final String adminId = "/admin";

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final _auth = FirebaseAuth.instance;

  var loggedInUser;

  void getCurrentUser() {
    try {
      final thisUser = _auth.currentUser;
      if (thisUser != null) {
        loggedInUser = thisUser;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 50,
        ),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _auth.signOut();
                    print("Logging out");
                    Navigator.pop(context);
                    // print("Testing");
                  },
                ),
                SizedBox(
                  width: 130,
                ),
                Text(
                  "Admin",
                  style: kAppText,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            ReusableButton(
              text: "Manage books",
              onPressed: null,
            ),
            ReusableButton(
              text: "Validate requests",
              onPressed: null,
            ),
            ReusableButton(
              text: "Validate returns",
              onPressed: null,
            ),
            ReusableButton(
              text: "Fine calculations",
              onPressed: null,
            ),
            ReusableButton(
              text: "Manage contact",
              onPressed: () {
                Navigator.pushNamed(context, changeContactId);
              },
            ),
            ReusableButton(
              text: "Find User",
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
