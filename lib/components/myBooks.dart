import 'package:flutter/material.dart';
import 'package:librarian/constants.dart';

final String myBooksId = "/myBooks";

class MyBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyBookArgs args =
        ModalRoute.of(context).settings.arguments as MyBookArgs;
    return Scaffold(
      backgroundColor: cream,
      body: myBooks(context, args.email, args.books),
    );
  }
}
