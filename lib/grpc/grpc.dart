export 'package:grpc/grpc.dart';

import 'dart:async';

import 'package:app/cryptography/keypair.dart';
import 'package:app/grpc/ds_interceptor.dart';
import 'package:app/grpc/generated/google/protobuf/empty.pb.dart';
import 'package:app/grpc/generated/wall.pbgrpc.dart';
import 'package:app/grpc/generated/auth.pbgrpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
//import 'package:window_location_href/window_location_href.dart';

const _serverAddress = String.fromEnvironment('SERVER_ADDRESS',
    defaultValue:
        'backend.mangoriver-4d99c329.canadacentral.azurecontainerapps.io');
const _serverPort = int.fromEnvironment('SERVER_PORT', defaultValue: 443);

Wall wall(KeyPair keyPair) => Wall._(keyPair);
Auth auth(KeyPair keyPair) => Auth._(keyPair);

String _getAddress() {
  // final location = href;
  // if (location != null) {
  //   final url = Uri.tryParse(location)!;

  //   return url.host;
  // }

  return _serverAddress;
}

int _getPort() {
  // final location = href;
  // if (location != null) {
  //   final url = Uri.tryParse(location)!;

  //   return url.port;
  // }

  return _serverPort;
}

String getPath(String relative) {
  final host = _getAddress();
  final port = _getPort();

  return 'https://$host:$port/$relative';
}

CallOptions? _getCallOptions() {
  return null;
}

class Wall {
  Wall._(KeyPair keyPair)
      : _client = WallClient(
          GrpcOrGrpcWebClientChannel.toSingleEndpoint(
            host: _getAddress(),
            port: _getPort(),
            transportSecure: true,
          ),
          interceptors: [DigitalSignatureInterceptor(keyPair)],
        );

  final WallClient _client;

  Future<CreatePostResponse> createPost(String text) {
    return _client.createPost(
      CreatePostRequest(
        text: text,
      ),
      options: _getCallOptions(),
    );
  }
}

class Auth {
  Auth._(KeyPair keyPair)
      : _client = AuthenticationClient(
          GrpcOrGrpcWebClientChannel.toSingleEndpoint(
            host: _getAddress(),
            port: _getPort(),
            transportSecure: true,
          ),
          interceptors: [DigitalSignatureInterceptor(keyPair)],
        );

  final AuthenticationClient _client;

  Future<JsonWebToken> getJwt() {
    return _client.getJwt(
      Empty(),
      options: _getCallOptions(),
    );
  }
}
