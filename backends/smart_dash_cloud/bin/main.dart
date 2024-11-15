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

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption(
      argPort,
      abbr: 'p',
      defaultsTo: Platform.environment['PORT'] ?? '8080',
    )
    ..addOption(argDbPath, abbr: 'd', defaultsTo: '.data');

  ArgResults argResults = parser.parse(args);

  // TODO: Get logging level from args
  _initLogger(Level.FINE);

  // TODO: Get data path from args
  final dbPath = argResults[argDbPath] as String;
  Directory(dbPath).createSync();

  final ip = InternetAddress.anyIPv4;

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

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(argResults[argPort] as String);
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}

void _initLogger(Level level) {
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
}
