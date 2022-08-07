import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  late FirebaseMessaging messaging;
  int currentIndex = 0;
  final screen = [
    const Home(),
    const History(),
    const NotificationPage(),
    const MyAccount()
  ];

  @override
  Widget build(BuildContext context) {
    check();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
      showNoti(event.notification!.title,event.notification!.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
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
      ),
    );
  }

  void check() {
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

  Future<void> notiSetup() async{
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid
        );

   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNoti(String? title, String? body) async{
    notiSetup();
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        '01',
        "simple",
        priority: Priority.high,
        importance: Importance.max,
        ticker: 'ticker'
    );

    const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
    );

   await flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
    
  }
}
