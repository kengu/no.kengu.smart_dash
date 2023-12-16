import 'dart:convert';

const envFunctionProjectId = 'APPWRITE_FUNCTION_PROJECT_ID';
const envFunctionEndpoint = 'APPWRITE_FUNCTION_ENDPOINT';
const envFunctionApiKey = 'APPWRITE_FUNCTION_API_KEY';

const List<String> envFunctionVars = [envFunctionEndpoint, envFunctionApiKey];

bool assertFunctionVars(final req, final res,
    [List<String> keys = envFunctionVars]) {
  final valid = assertEnvVars(req, keys);
  final invalid = keys.toList()..removeWhere((key) => valid.contains(key));
  final isInvalid = invalid.isNotEmpty;
  if (isInvalid) {
    res.send(
      'Function environment variables $invalid are not set.',
      status: 500,
    );
  }
  return !isInvalid;
}

List<String> assertEnvVars(final req, List<String> vars) =>
    req.variables?.isNotEmpty == true
        ? vars.where((key) => req.variables[key] != null).toList()
        : <String>[];

Map<String, dynamic>? tryParse(final req) =>
    req.payload?.isNotEmpty == true ? jsonDecode(req.payload.toString()) : null;

T toArg<T, V>(Map<String, dynamic>? payload, String name, T defaultValue,
    [T Function(V)? map]) {
  final value = payload?[name];
  if (value != null) {
    if (map != null) {
      return map(value as V);
    }
    return value as T;
  }
  return defaultValue;
}

void toOkData<T, V>(final res, Iterable<V> created, T Function(V value) map) {
  res.json({
    'total': created.length,
    'data': created.map(map).toList(),
  });
}

void toError(final res, Object error, [StackTrace? stackTrace]) {
  res.send(
    "Unexpected server error: ${error.toString()}",
    status: 500,
  );
}
