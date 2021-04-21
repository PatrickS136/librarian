import 'package:flutter/material.dart';
import 'package:librarian/constants.dart';
import 'package:librarian/components/reusableButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:librarian/screens/contact.dart';

final userId = "/user";

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
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
                  width: 100,
                ),
                Text(
                  "Welcome",
                  style: kAppText,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            ReusableButton(
              text: "My books",
              onPressed: null,
            ),
            ReusableButton(
              text: "Borrow a book",
              onPressed: null,
            ),
            ReusableButton(
              text: "Search Library",
              onPressed: null,
            ),
            ReusableButton(
              text: "Invoices",
              onPressed: null,
            ),
            ReusableButton(
              text: "Contact us",
              onPressed: () {
                Navigator.pushNamed(context, contactId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
