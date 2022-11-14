///
//  Generated code. Do not modify.
//  source: wall.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'wall.pb.dart' as $0;
export 'wall.pb.dart';

class WallClient extends $grpc.Client {
  static final _$createPost =
      $grpc.ClientMethod<$0.CreatePostRequest, $0.CreatePostResponse>(
          '/Wall/CreatePost',
          ($0.CreatePostRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreatePostResponse.fromBuffer(value));

  WallClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreatePostResponse> createPost(
      $0.CreatePostRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPost, request, options: options);
  }
}

abstract class WallServiceBase extends $grpc.Service {
  $core.String get $name => 'Wall';

  WallServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreatePostRequest, $0.CreatePostResponse>(
        'CreatePost',
        createPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreatePostRequest.fromBuffer(value),
        ($0.CreatePostResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreatePostResponse> createPost_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreatePostRequest> request) async {
    return createPost(call, await request);
  }

  $async.Future<$0.CreatePostResponse> createPost(
      $grpc.ServiceCall call, $0.CreatePostRequest request);
}
