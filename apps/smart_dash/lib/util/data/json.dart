import 'dart:convert';

import 'package:flutter/foundation.dart';

/// Definition of json object data type
typedef JsonObject = Map<String, Object?>;

/// Compute spawns an isolate, runs a callback on
/// that isolate, and returns a Future with the
/// decoded result as given [DataType]
Future<DataType> parseJsonInBackground<DataType>(
  String encodedJson,
  DataType Function(dynamic json) fromJson,
) {
  return compute(
    (String encodedJson) => fromJson(
      jsonDecode(encodedJson),
    ),
    encodedJson,
  );
}
