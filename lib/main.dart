import 'package:app/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/home/screens/home_screen.dart';
import 'package:app/pages/mnemonic/screens/mnemonic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final mnemonic = await Prefs.getString('mnemonic_phrase');

  runApp(MyApp(mnemonic: mnemonic));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.mnemonic});
  final String? mnemonic;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'ForDem',
        theme: ThemeData(useMaterial3: true),
        home: (mnemonic != null && mnemonic!.isNotEmpty)
            ? const HomeScreen()
            : const MnemonicScreen(),
      );
}
