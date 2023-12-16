import 'dart:async';

import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dio/dio.dart';
import 'package:smart_dash_backend/device_driver/application/device_driver_manager.dart';
import 'package:smart_dash_backend/device_driver/data/device_repository.dart';
import 'package:smart_dash_backend/device_driver/domain/service_credentials.dart';
import 'package:smart_dash_backend/device_driver/sikom/application/sikom_driver.dart';
import 'package:smart_dash_backend/device_driver/sikom/data/sikom_client.dart';
import 'package:smart_dash_backend/device_driver/sikom/sikom.dart';
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

const envFunctionUpdatePeriod = 'APPWRITE_FUNCTION_UPDATE_PERIOD';

Future<void> start(final req, final res) async {
  final tic = DateTime.now();
  final logger = init('update_drivers', Level.INFO);
  logger.info('Initializing update loop');

  try {
    if (!assertFunctionVars(req, res, [
      ...envFunctionVars,
      envFunctionUpdatePeriod,
    ])) {
      return;
    }

    var loops = 0;
    final ids = <String>{};
    final period = Duration(
      seconds: toArg(req.variables, envFunctionUpdatePeriod, 5,
          (e) => int.parse(e.toString())),
    );

    final client = Client()
        .setEndpoint(req.variables[envFunctionEndpoint])
        .setProject(req.variables[envFunctionProjectId])
        .setKey(req.variables[envFunctionApiKey])
        .setSelfSigned(status: true);
    final repo = DeviceRepository(client);
    final manager = DeviceDriverManager()
      ..register(SikomDriver(
          SikomClient(
            Dio(BaseOptions(baseUrl: 'https://api.connome.com/api')),
            ServiceCredentials.fromService(Sikom.key),
          ),
          repo));

    await manager.init();

    // Start update loop with an update
    logger.info('Update loop started');
    ids.addAll(await _update(manager));
    logger.info('Update loop executed: ${++loops}');

    // Schedule more updates
    final completer = Completer<void>();
    Timer.periodic(period, (timer) async {
      if (DateTime.now().difference(tic).inSeconds > 60) {
        timer.cancel();
        completer.complete();
        return;
      }
      ids.addAll(await _update(manager));
      logger.info('Update loop executed: ${++loops}');
    });

    await completer.future;

    logger.info('Update loop completed');

    return res.json({
      'loops': loops,
      'changed': ids.length,
    });
  } catch (error, stackTrace) {
    logger.severe(
      'Unexpected server error',
      error,
      stackTrace,
    );
    return toError(res, error, stackTrace);
  }
}

Future<Set<String>> _update(DeviceDriverManager manager) async {
  final updates = await manager.update();
  return updates.map((e) => '${e.key}:${e.id}').toSet();
}
