//
//  Generated code. Do not modify.
//  source: addition.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'addition.pb.dart' as $0;

export 'addition.pb.dart';

@$pb.GrpcServiceName('Addition')
class AdditionClient extends $grpc.Client {
  static final _$add = $grpc.ClientMethod<$0.AdditionRequest, $0.AdditionResponse>(
      '/Addition/Add',
      ($0.AdditionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AdditionResponse.fromBuffer(value));

  AdditionClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.AdditionResponse> add($0.AdditionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$add, request, options: options);
  }
}

@$pb.GrpcServiceName('Addition')
abstract class AdditionServiceBase extends $grpc.Service {
  $core.String get $name => 'Addition';

  AdditionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AdditionRequest, $0.AdditionResponse>(
        'Add',
        add_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AdditionRequest.fromBuffer(value),
        ($0.AdditionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AdditionResponse> add_Pre($grpc.ServiceCall call, $async.Future<$0.AdditionRequest> request) async {
    return add(call, await request);
  }

  $async.Future<$0.AdditionResponse> add($grpc.ServiceCall call, $0.AdditionRequest request);
}
