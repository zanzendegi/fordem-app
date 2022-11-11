import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  static const label = "profile";
  static const path = '/profile';
  static const icon = Icon(Icons.person);
  
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Profile");
  }
}