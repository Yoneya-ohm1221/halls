import 'package:flutter/material.dart';
import 'package:halls/ui/account.dart';
import 'package:halls/ui/history.dart';

import '../home.dart';

class MainNav extends StatefulWidget {
  const MainNav({Key? key}) : super(key: key);

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int currenIndex=0;
  final screen =[
    const Home(),
    const History(),
    const MyAccount()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currenIndex,
        onTap: (index) => setState(() {
          currenIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history),
            label: 'History',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),
            label: 'Account',
            backgroundColor: Colors.amber,
          )
        ],
      ) ,
    );
  }
}
