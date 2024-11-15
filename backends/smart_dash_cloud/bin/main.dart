import 'dart:io';

import 'package:args/args.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_account/smart_dash_account_backend.dart';

const argPort = 'port';
const argDbPath = 'db-path';
const argLogLevel = 'log-level';

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption(
      argPort,
      abbr: 'p',
      // For running in containers, we respect
      // the PORT environment variable.
      defaultsTo: Platform.environment['PORT'] ?? '8080',
    )
    ..addOption(argDbPath, abbr: 'd', defaultsTo: '.db')
    ..addOption(argLogLevel, abbr: 'l', defaultsTo: 'INFO');

  // Get properties
  ArgResults argResults = parser.parse(args);

  final logger = _initLogger(argResults[argLogLevel] as String);

  final dbPath = argResults[argDbPath] as String;
  final dbDir = Directory(dbPath)..createSync();
  logger.info('Database path is ${dbDir.absolute.path}');

  final ip = InternetAddress.anyIPv4;
  final port = int.parse(argResults[argPort] as String);

  final container = ProviderContainer();

  final accounts = AccountController(
    container.read(
      backendAccountRepositoryProvider(dbPath),
    ),
  );

  final router = Router();
  router.mount('/', accounts.router.call);

  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(router.call);

  final server = await serve(handler, ip, port);
  logger.info('Server listening on port ${server.port}');
}

Logger _initLogger(String name) {
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
  final logger = Logger('Cloud');
  logger.info('Log level set to ${level.name}');
  return logger;
}
