import 'package:flutter/material.dart';
import 'package:bip39/bip39.dart' as bip39;

class MnemonicBuilder extends StatefulWidget {
  const MnemonicBuilder({super.key, required this.verifyMnemonic});
  final Function verifyMnemonic;

  @override
  State<MnemonicBuilder> createState() => _MnemonicBuilderState();
}

class _MnemonicBuilderState extends State<MnemonicBuilder> {
  // Generate Mnemonic phrases
  final String generatedMnemonic = bip39.generateMnemonic();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: [
                const Text(
                  'Welcome to FurDem',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    '''Please remember the phrases below and write it\nsomewhere to able recover your acc in future''',
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: generatedMnemonic
                        .split(' ')
                        .map(
                          (mnemonicPhrase) => Chip(
                            label: Text(mnemonicPhrase),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () => widget.verifyMnemonic(generatedMnemonic),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.black,
                ),
              ),
              child: const Text(
                'Continue to verify',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
