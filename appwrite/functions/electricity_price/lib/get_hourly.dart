import 'dart:convert';

import 'package:dart_appwrite/dart_appwrite.dart';

/*
  'req' variable has:
    'headers' - object with request headers
    'payload' - request body data as a string
    'variables' - object with function variables

  'res' variable has:
    'send(text, status: status)' - function to return text response. Status code defaults to 200
    'json(obj, status: status)' - function to return JSON response. Status code defaults to 200
  
  If an error is thrown, a response with code 500 will be returned.
*/

Future<void> start(final req, final res) async {
  try {
    if (!_assertVars(req)) {
      return res.send(
        'Environment variables are not set. Function cannot use Appwrite SDK.',
        status: 500,
      );
    }

    final payload = _tryParse(req);
    if (payload == null) {
      return res.send(
        "Payload is missing",
        status: 400,
      );
    }

    final client = Client()
        .setEndpoint(req.variables['APPWRITE_FUNCTION_ENDPOINT'])
        .setProject(req.variables['APPWRITE_FUNCTION_PROJECT_ID'])
        .setKey(req.variables['APPWRITE_FUNCTION_API_KEY'])
        .setSelfSigned(status: true);

    final database = Databases(client);
    final result = await database.listDocuments(
        databaseId: 'accounting',
        collectionId: 'electricity_price',
        queries: [
          Query.equal('area', payload['area']),
          Query.greaterThanEqual(
            'ts0',
            DateTime.parse(payload['ts0']).toIso8601String(),
          ),
          Query.lessThanEqual(
            'ts1',
            DateTime.parse(payload['ts1']).toIso8601String(),
          ),
        ]);

    return res.json({
      'total': result.total,
      'prices': result.documents.map((e) => e.data).toList(),
    });
  } on FormatException catch (e) {
    return res.send(
      "Payload format error: ${e.toString()}",
      status: 400,
    );
  } catch (e) {
    return res.send(
      "Unexpected server error: ${e.toString()}",
      status: 500,
    );
  }
}

bool _assertVars(final req) =>
    req.variables['APPWRITE_FUNCTION_ENDPOINT'] != null &&
    req.variables['APPWRITE_FUNCTION_API_KEY'] != null;

Map<String, dynamic>? _tryParse(final req) =>
    req.payload?.isNotEmpty == true ? jsonDecode(req.payload.toString()) : null;
