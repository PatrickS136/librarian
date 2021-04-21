import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:librarian/constants.dart';

class GetContact extends StatelessWidget {
  final iconMap = {
    "phone": Icon(Icons.phone),
    "email": Icon(Icons.email),
    "location_city": Icon(Icons.location_city),
    "person": Icon(Icons.person),
  };
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('contact').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Widget> messageWidgets = [];
          dynamic contactData = snapshot.data.docs[0].data();
          contactData.forEach(
            (k, v) => messageWidgets.add(
              Column(
                children: [
                  Row(
                    children: [
                      iconMap[k],
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          "$v",
                          style: kContactDetails,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          );
          return Column(
            children: messageWidgets,
            crossAxisAlignment: CrossAxisAlignment.start,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
      },
    );
  }
}
