import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  static const label = "Home";
  static const path = '/home';
  static const icon = Icon(Icons.home);
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Hello World");
  }
}