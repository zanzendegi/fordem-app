import 'package:flutter/material.dart';
// Screens
import 'package:app/pages/home/screens/home_screen.dart';
import 'package:app/pages/profile/screens/profile_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  int bottomBarWidth = 42;
  int bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        iconSize: 28,
        onTap: updatePage,
        items: const [
          BottomNavigationBarItem(
              icon: HomeScreen.icon, label: HomeScreen.label),
          BottomNavigationBarItem(
              icon: ProfileScreen.icon, label: ProfileScreen.label)
        ],
      ),
    );
  }
}
