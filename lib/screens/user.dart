import 'package:flutter/material.dart';
import 'package:librarian/components/myBooks.dart';
import 'package:librarian/constants.dart';
import 'package:librarian/components/reusableButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:librarian/screens/browseBooks.dart';
import 'package:librarian/screens/contact.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final userRegisterId = "/userRegister";
final userLoginId = "/userLogin";

class User extends StatefulWidget {
  final bool newUser;
  User({this.newUser});
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  final _auth = FirebaseAuth.instance;
  var loggedInUser;
  int invoices;
  var books;
  // final _firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> addUser(String email) {
    return users
        .doc(email)
        .set({
          'email': email,
          'invoice': 0,
          'books': [],
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void getCurrentUser() {
    try {
      final thisUser = _auth.currentUser;
      if (thisUser != null) {
        loggedInUser = thisUser;
        if (widget.newUser == true) {
          addUser(thisUser.email);
        }
        FirebaseFirestore.instance
            .collection('users')
            .doc(thisUser.email)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            print('Document data: ${documentSnapshot.data()}');
            books = documentSnapshot.data()["books"];
            invoices = documentSnapshot.data()["invoice"];
          } else {
            print('Document does not exist on the database');
          }
        });
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
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  myBooksId,
                  arguments:
                      MyBookArgs(email: _auth.currentUser.email, books: books),
                );
              },
            ),
            ReusableButton(
              text: "Search Library",
              onPressed: () {
                Navigator.pushNamed(context, browseId);
              },
            ),
            ReusableButton(
              text: "Invoices",
              onPressed: () {
                showInvoices(context, invoices);
              },
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
