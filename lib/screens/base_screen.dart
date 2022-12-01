import 'package:Pedagodino/constants/color.dart';
import 'package:Pedagodino/screens/home_screen.dart';
import 'package:Pedagodino/screens/settings_screen.dart';
import 'package:Pedagodino/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../models/globals.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  BaseScreenState createState() => BaseScreenState();
}

class BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    homeScreen(),
    profileScreen(),
    settingsScreen()
  ];

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
          backgroundColor: Color.fromRGBO(245, 245, 245, 0.5),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: "Início",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.account_circle),
              icon: Icon(Icons.account_circle_outlined),
              label: "Perfil",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: "Configurações",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
