import 'package:flutter/material.dart';

class WallScreen extends StatelessWidget {
  const WallScreen({super.key});

  static const label = 'Wall';
  static const path = '/wall';
  static const icon = Icons.feed;

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Wall'));
  }
}
