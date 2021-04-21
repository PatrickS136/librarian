import 'package:flutter/material.dart';
import 'package:librarian/screens/admin.dart';
import 'package:librarian/screens/contact.dart';
import 'package:librarian/screens/register.dart';
import 'package:librarian/screens/user.dart';
import 'package:librarian/screens/welcomeScreen.dart';
import 'package:librarian/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Librarian',
          initialRoute: welcomeId,
          routes: {
            welcomeId: (context) => WelcomeScreen(),
            loginId: (context) => Login(),
            registerId: (context) => Register(),
            adminId: (context) => Admin(),
            userId: (context) => User(),
            contactId: (context) => Contact(),
          },
        );
      },
    );
  }
}
