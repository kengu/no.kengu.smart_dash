import 'dart:io';

import 'package:args/args.dart';
import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_account/smart_dash_account_backend.dart';

void main(List<String> args) async {
  final vars = _parseArgs(args);

  final log = _initLogger(vars);

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(_buildRouter(log, vars).call);

  final ip = InternetAddress.anyIPv4;
  final port = int.parse(vars[argPort] as String);
  final server = await serve(handler, ip, port);
  log.info('Server listening on port ${server.port}');
}

Router _buildRouter(Logger log, ArgResults vars) {
  String dbPath = _getDbPath(vars);
  log.info('Database path is $dbPath');

  final ref = ProviderContainer();

  // Create controllers
  final accounts = AccountBackendController(ref, dbPath);

  return Router()..mount('/', accounts.router.call);
}

String _getDbPath(ArgResults argResults) {
  final dbPath = argResults[argDbPath] as String;
  final dbDir = Directory(dbPath)..createSync();
  return dbDir.absolute.path;
}

const argPort = 'port';
const argDbPath = 'db-path';
const argLogLevel = 'log-level';

ArgResults _parseArgs(List<String> args) {
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

  return parser.parse(args);
}

Logger _initLogger(ArgResults args) {
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
  final logger = Logger('Cloud');
  logger.info('Log level set to ${level.name}');
  return logger;
}
