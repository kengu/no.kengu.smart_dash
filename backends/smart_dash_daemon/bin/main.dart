import 'dart:io';

import 'package:args/args.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_daemon/bootstrap.dart';
import 'package:smart_dash_home/smart_dash_home.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_websocket/smart_dash_websocket.dart';

typedef Installer = IntegrationType Function(ProviderContainer ref);

void main(List<String> args) async {
  // Prepare
  final vars = _parseArgs(args);
  final log = _initLogger(vars, 'Daemon');
  final websocket = WebSocketServerMultiplexer();

  // Bootstrap integrations
  final ref = await _bootstrap();

  // Assembling the pipeline
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(websocket.middleware('ws'))
      .addHandler(_buildHandler(ref, websocket).call);

  // Launch the server
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(vars[argPort] as String);
  final server = (await serve(handler, ip, port))..autoCompress = true;

  log.info('Server listening on port ${server.port}');
}

Future<ProviderContainer> _bootstrap() async {
  final ref = ProviderContainer();
  await ref.read(bootstrapProvider.future);
  return ref;
}

Router _buildHandler(
    ProviderContainer ref, WebSocketServerMultiplexer websocket) {
  final integrations = IntegrationController(ref);
  final configs = ServiceConfigController(
    integrations.manager,
    ref.read(serviceConfigHiveRepositoryProvider),
  );
  configs.registerChannel(websocket);

  return Router()
    ..mount('/', configs.router.call)
    ..mount('/', integrations.router.call);
}

// TODO: Move to utils for backends
const argPort = 'port';
const argLogLevel = 'log-level';

ArgResults _parseArgs(List<String> args) {
  final parser = ArgParser()
    ..addOption(
      argPort,
      abbr: 'p',
      // For running in containers,
      // we respect the PORT environment variable.
      defaultsTo: Platform.environment['PORT'] ?? '8081',
    )
    ..addOption(argLogLevel, abbr: 'l', defaultsTo: 'INFO');

  return parser.parse(args);
}

// TODO: Move to utils for backends
Logger _initLogger(ArgResults args, String name) {
  final name = args[argLogLevel] as String;
  final level = Level.LEVELS.firstWhere(
    (e) => e.name.toLowerCase() == name.toLowerCase(),
    orElse: () => Level.INFO,
  );

  Logger.root.level = level;

  Logger.root.onRecord.listen((record) {
    // TODO: Store logs locally with hive
    print([
      record.time,
      record.level.name,
      record.loggerName,
      record.message,
      [
        if (record.error != null) record.error,
        if (record.stackTrace != null) record.stackTrace,
      ].join('\n'),
    ].where((e) => e.toString().isNotEmpty == true).join(': '));
  });
  final logger = Logger(name);
  logger.info('Log level set to ${level.name}');
  return logger;
}
