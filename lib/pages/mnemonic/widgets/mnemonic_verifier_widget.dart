import 'package:app/utils/prefs.dart';
import 'package:flutter/material.dart';

class MnemonicVerifier extends StatefulWidget {
  const MnemonicVerifier({super.key, required this.mnemonic});
  final String mnemonic;

  @override
  State<MnemonicVerifier> createState() => _MnemonicVerifierState();
}

class _MnemonicVerifierState extends State<MnemonicVerifier> {
  final TextEditingController _controller = TextEditingController();
  bool validMnemonic = false;

  void writeMnemonicToPreferences(String mnemonic) async {
    await Prefs.setString('mnemonic_phrase', mnemonic);
  }

  void verifyNemonic(String phrases) {
    if (phrases == widget.mnemonic) {
      setState(() {
        validMnemonic = true;
      });
    } else {
      setState(() {
        validMnemonic = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                  'Verify your phrases',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    '''Please pick your phrases in order''',
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: TextField(
                    controller: _controller,
                    cursorColor: Colors.black,
                    minLines: 3,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 3.0),
                      ),
                    ),
                    onChanged: (value) => verifyNemonic(value),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () => validMnemonic
                  ? writeMnemonicToPreferences(widget.mnemonic)
                  : writeMnemonicToPreferences(widget.mnemonic),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  validMnemonic ? Colors.black : Colors.grey,
                ),
              ),
              child: const Text(
                'Verify',
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
