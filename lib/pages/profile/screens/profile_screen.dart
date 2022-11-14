import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const label = 'profile';
  static const path = '/profile';
  static const icon = Icon(Icons.person);

  @override
  Widget build(BuildContext context) {
    return const Text('Profile');
  }
}
