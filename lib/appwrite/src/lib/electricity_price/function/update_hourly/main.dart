import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:dio/dio.dart';
import 'package:smart_dash_backend/electricity_price/data/electricity_price_client.dart';
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
  final logger = init('update_hourly', Level.INFO);

  final created = <Document>{};
  try {
    if (!assertFunctionVars(req, res)) {
      return;
    }

    final api = ElectricityPriceClient(Dio(BaseOptions(
      baseUrl: 'https://www.hvakosterstrommen.no/api/v1/prices',
    )));

    final payload = tryParse(req);
    final area = toArg(payload, 'area', 'NO2');
    final when = toArg(payload, 'when', DateTime.now(), DateTime.parse);
    final prices = await api.getPriceHourly(area, when);

    logger.info(
      'Fetched ${prices.length} prices from area $area @ $when:\n\n$prices',
    );

    final client = Client()
        .setEndpoint(req.variables[envFunctionEndpoint])
        .setProject(req.variables[envFunctionProjectId])
        .setKey(req.variables[envFunctionApiKey])
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
            'begin': price.begin.toIso8601String(),
            'end': price.end.toIso8601String(),
            'nokPerKwh': price.nokPerKwh,
            'eurPerKwh': price.eurPerKwh,
            'eurToNokRate': price.eurToNokRate,
          },
        ),
      ),
      cleanUp: created.add,
    );
    created.addAll(result);
  } on AppwriteException catch (e) {
    if (e.type != 'document_already_exists') {
      return toError(res, e);
    }
  } catch (error, stackTrace) {
    logger.severe(
      'Unexpected server error',
      error,
      stackTrace,
    );
    return toError(res, error, stackTrace);
  }
  toOkData<String, Document>(res, created, (e) => e.$id);
}
