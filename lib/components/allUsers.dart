import 'package:flutter/material.dart';
import 'package:librarian/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final String allUsersId = "/allUsers";

class AllUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      backgroundColor: cream,
      body: Container(
        padding: EdgeInsets.all(20),
        child: StreamBuilder<QuerySnapshot>(
          stream: users.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                List<String> borrowedBooks = [];

                for (var i in document.data()['books']) {
                  borrowedBooks.add(i["title"]);
                }
                return ListTile(
                  title: Text(
                      "${document.data()['email']}, currently borrowing ${document.data()['books'].length}"),
                  subtitle: Text("$borrowedBooks"),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
