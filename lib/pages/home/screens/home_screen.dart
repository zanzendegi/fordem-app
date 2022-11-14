import 'package:app/cryptography/keypair.dart';
import 'package:app/grpc/grpc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const label = 'Home';
  static const path = '/home';
  static const icon = Icon(Icons.home);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Hello World'),
      onPressed: () async {
        // Create a request.
        const mnemonic =
            'pudding long decline call forward space meat huge merry announce license coconut';

        final keyPair = KeyPair.fromMnemonic(mnemonic);

        final api = wall(keyPair);

        final result = await api.createPost('Hello');

        print(result.id);
      },
    );
  }
}
