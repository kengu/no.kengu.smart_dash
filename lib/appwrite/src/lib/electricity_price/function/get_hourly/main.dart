import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:smart_dash_backend/util/function.dart';
import 'package:smart_dash_backend/util/logging.dart';

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
  final logger = init('get_hourly', Level.INFO);

  try {
    if (!assertFunctionVars(req, res)) {
      return;
    }

    final payload = tryParse(req);
    if (payload == null) {
      return res.send(
        "Payload is missing",
        status: 400,
      );
    }

    final client = Client()
        .setEndpoint(req.variables[envFunctionEndpoint])
        .setProject(req.variables[envFunctionProjectId])
        .setKey(req.variables[envFunctionApiKey])
        .setSelfSigned(status: true);

    final database = Databases(client);
    final result = await database.listDocuments(
        databaseId: 'accounting',
        collectionId: 'electricity_price',
        queries: [
          Query.equal('area', payload['area']),
          Query.greaterThanEqual(
            'begin',
            DateTime.parse(payload['begin']).toIso8601String(),
          ),
          Query.lessThanEqual(
            'end',
            DateTime.parse(payload['end']).toIso8601String(),
          ),
        ]);

    return toOkData<Map<String, dynamic>, Document>(
      res,
      result.documents,
      (e) => e.data,
    );
  } on FormatException catch (e) {
    return res.send(
      "Payload format error: ${e.toString()}",
      status: 400,
    );
  } catch (error, stackTrace) {
    logger.severe(
      'Unexpected server error',
      error,
      stackTrace,
    );
    return toError(res, error, stackTrace);
  }
}
