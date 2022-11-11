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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("Hello World")],
            ),
          ),
        ),
        body: const BottomBar(),
      ),
    );
  }
}
