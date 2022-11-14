import 'package:app/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FordemApp());
}

class FordemApp extends StatelessWidget {
  const FordemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ForDem',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World'),
          centerTitle: true,
        ),
        body: const BottomBar(),
      ),
    );
  }
}
