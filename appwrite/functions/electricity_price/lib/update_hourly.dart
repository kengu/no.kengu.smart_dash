import 'dart:convert';

import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:dio/dio.dart';

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
  final created = <Document>{};
  try {
    if (!_assertVars(req)) {
      return res.send(
        'Environment variables are not set. Function cannot use Appwrite SDK.',
        status: 500,
      );
    }

    final dio = Dio(BaseOptions(
      baseUrl: 'https://www.hvakosterstrommen.no/api/v1/prices',
    ));

    final payload = _tryParse(req);
    final area = _arg(payload, 'area', 'NO2');
    final when = _arg(payload, 'when', DateTime.now(), DateTime.parse);
    final path = '/${when.year}/'
        '${when.month < 9 ? '0${when.month}' : when.month}-'
        '${when.day < 9 ? '0${when.day}' : when.day}_$area.json';
    final response = await dio.get(path);

    if (response.statusCode != 200 || response.data is! List) {
      return res.send(
        "Prices not found: ${response.statusMessage}",
        status: response.statusCode,
      );
    }
    final prices = response.data as List;

    print('Fetched ${prices.length} prices:\n\n$prices');

    final client = Client()
        .setEndpoint(req.variables['APPWRITE_FUNCTION_ENDPOINT'])
        .setProject(req.variables['APPWRITE_FUNCTION_PROJECT_ID'])
        .setKey(req.variables['APPWRITE_FUNCTION_API_KEY'])
        .setSelfSigned(status: true);

    final database = Databases(client);
    final result = await Future.wait<Document>(
      prices.map(
        (price) => database.createDocument(
          databaseId: 'accounting',
          collectionId: 'electricity_price',
          documentId: ID.unique(),
          data: {
            'area': area,
            'ts0': DateTime.parse(price['time_start']).toIso8601String(),
            'ts1': DateTime.parse(price['time_end']).toIso8601String(),
            'nokPerKwh': price['NOK_per_kWh'],
            'eurPerKwh': price['EUR_per_kWh'],
            'eurToNokRate': price['EXR'],
          },
        ),
      ),
      cleanUp: created.add,
    );
    created.addAll(result);
  } on AppwriteException catch (e) {
    if (e.type != 'document_already_exists') {
      return res.send(
        "Unexpected server error: ${e.toString()}",
        status: 500,
      );
    }
  } catch (e) {
    return res.send(
      "Unexpected server error: ${e.toString()}",
      status: 500,
    );
  }
  _ok(res, created);
}

Map<String, dynamic>? _tryParse(final req) =>
    req.payload?.isNotEmpty == true ? jsonDecode(req.payload.toString()) : null;

T _arg<T, V>(Map<String, dynamic>? payload, String name, T defaultValue,
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

void _ok(final res, Set<Document> created) {
  res.json({
    'total': created.length,
    'documents': created.map((e) => e.$id).toList(),
  });
}

bool _assertVars(final req) =>
    req.variables['APPWRITE_FUNCTION_ENDPOINT'] != null &&
    req.variables['APPWRITE_FUNCTION_API_KEY'] != null;
