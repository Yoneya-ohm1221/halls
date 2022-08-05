import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:halls/ui/account.dart';
import 'package:halls/ui/history.dart';

import '../home.dart';
import '../notification.dart';

class MainNav extends StatefulWidget {
  const MainNav({Key? key}) : super(key: key);

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int currentIndex=0;
  final screen =[
    const Home(),
    const History(),
    const NotificationPage(),
    const MyAccount()
  ];
  @override
  Widget build(BuildContext context) {
    check();
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        fixedColor: Colors.deepOrange,
        unselectedItemColor: Colors.black38,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Account',
          )
        ],
      ) ,
    );
  }

   void check(){
     final commentsRef = FirebaseDatabase.instance.ref("my_data");
     commentsRef.onChildAdded.listen((event) {
       print("testadded");
     });
     commentsRef.onChildChanged.listen((event) {
       print("testchanged");
     });
     commentsRef.onChildRemoved.listen((event) {
       print("testremoved");
     });
   }
}
