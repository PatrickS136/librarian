import 'package:flutter/material.dart';
import 'package:librarian/constants.dart';

final String browseId = "/browseBooks";

class BrowseBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: browseBooks(context),
    );
  }
}
