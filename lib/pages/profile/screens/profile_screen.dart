import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const label = 'Profile';
  static const path = '/profile';
  static const icon = Icons.person;

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile'));
  }
}
