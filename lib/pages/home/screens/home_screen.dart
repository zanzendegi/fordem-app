import 'package:app/pages/wall/screens/wall_screen.dart';
import 'package:flutter/material.dart';
// Screens
import 'package:app/pages/profile/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  int bottomBarWidth = 42;
  int bottomBarBorderWidth = 5;

  void _updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  Widget _getScreen(int page) {
    switch (page) {
      case 0:
        return const WallScreen();
      case 1:
        return const ProfileScreen();
      default:
        throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
        centerTitle: true,
      ),
      body: _getScreen(_page),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: _updatePage,
        backgroundColor: const Color(0xfffafafa),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(WallScreen.icon),
            label: WallScreen.label,
          ),
          BottomNavigationBarItem(
            icon: Icon(ProfileScreen.icon),
            label: ProfileScreen.label,
          ),
        ],
      ),
    );
  }
}
