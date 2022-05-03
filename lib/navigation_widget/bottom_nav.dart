import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:instagram_flutter/containers/notification.dart';
import 'package:instagram_flutter/containers/screens/profiles/profile.dart';
import 'package:instagram_flutter/containers/reels.dart';
import 'package:instagram_flutter/containers/screens/homes/home.dart';
import 'package:instagram_flutter/containers/search.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    ReelPage(),
    NotificationPage(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.home),
            label: '',
            icon: Icon(EvaIcons.homeOutline),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.search),
            label: '',
            icon: Icon(EvaIcons.searchOutline),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.film),
            label: '',
            icon: Icon(EvaIcons.filmOutline),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.heart),
            label: '',
            icon: Icon(EvaIcons.heartOutline),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.person),
            label: '',
            icon: Icon(EvaIcons.personOutline),
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor: const Color.fromARGB(197, 189, 189, 189),
        onTap: _onItemTapped,
      ),
    );
  }
}
