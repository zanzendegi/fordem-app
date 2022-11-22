import 'package:app/pages/mnemonic/widgets/mnemonic_builder_widget.dart';
import 'package:app/pages/mnemonic/widgets/mnemonic_verifier_widget.dart';
import 'package:flutter/material.dart';

class MnemonicScreen extends StatefulWidget {
  const MnemonicScreen({super.key});

  @override
  State<MnemonicScreen> createState() => _MnemonicScreenState();
}

class _MnemonicScreenState extends State<MnemonicScreen> {
  String _mnemonicPhrase = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mnemonicPhrase.isNotEmpty
          ? MnemonicVerifier(mnemonic: _mnemonicPhrase)
          : MnemonicBuilder(
              verifyMnemonic: (String mnemonic) =>
                  setState(() => _mnemonicPhrase = mnemonic),
            ),
    );
  }
}
