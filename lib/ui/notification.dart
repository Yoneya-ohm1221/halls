import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Center(
        child: (
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {rtdb(); },
              child: const Text('TextButton'),

            )
        ),
      ),
    );
  }

   void rtdb() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("my_data");
    await ref.push().set({
      "name": "John",
      "age": 18,
      "address": {
        "line1": "100 Mountain View"
      }
    });
  }
}
