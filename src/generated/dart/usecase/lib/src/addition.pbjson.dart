//
//  Generated code. Do not modify.
//  source: addition.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use additionRequestDescriptor instead')
const AdditionRequest$json = {
  '1': 'AdditionRequest',
  '2': [
    {'1': 'a', '3': 1, '4': 1, '5': 5, '10': 'a'},
    {'1': 'b', '3': 2, '4': 1, '5': 5, '10': 'b'},
  ],
};

/// Descriptor for `AdditionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List additionRequestDescriptor = $convert.base64Decode(
    'Cg9BZGRpdGlvblJlcXVlc3QSDAoBYRgBIAEoBVIBYRIMCgFiGAIgASgFUgFi');

@$core.Deprecated('Use additionResponseDescriptor instead')
const AdditionResponse$json = {
  '1': 'AdditionResponse',
  '2': [
    {'1': 'result', '3': 1, '4': 1, '5': 5, '10': 'result'},
  ],
};

/// Descriptor for `AdditionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List additionResponseDescriptor = $convert.base64Decode(
    'ChBBZGRpdGlvblJlc3BvbnNlEhYKBnJlc3VsdBgBIAEoBVIGcmVzdWx0');

