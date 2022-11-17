import 'package:app/cryptography/keypair.dart';
import 'package:app/grpc/grpc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hex/hex.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

const mnemonic =
    'pudding long decline call forward space meat huge merry announce license coconut';
final keyPair = KeyPair.fromMnemonic(mnemonic);

const publicKey =
    '048de548f57ecb2771c37bc1c2d7f63bcc02b7551dbeac4c0968d0a641d011e5c331013f0f27b370f277676ad2f3446d185c98c058ce2e1d6dc5209aaf3ceddf58';

const privateKey =
    '9b5cc4a60b53c0d9f8fd29764a428ecb33a4b15f7fd62f14f7863861d9f8a3d3';

void main() {
  test('Generate Keypair', () {
    final sk = keyPair.privateKey.value.toRadixString(16).toLowerCase();
    final pk = HEX.encode(keyPair.publicKey.value).toLowerCase();

    expect(sk, privateKey);
    expect(pk, publicKey);
  });

  test('Generate JWT', () async {
    final api = auth(keyPair);
    final result = await api.getJwt();

    final decodedToken = JwtDecoder.decode(result.value);

    expect(decodedToken['unique_name'], publicKey);
  });
}
