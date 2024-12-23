import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  final port = '8080';
  final host = 'http://0.0.0.0:$port';
  late Process p;

  setUpAll(() async {
    p = await Process.start(
      'dart',
      ['run', 'bin/main.dart', '-l FINE'],
      environment: {'PORT': port},
    );
    // Listen to stdout and wait for the target output.
    final completer = Completer<void>();
    p.stdout.transform(utf8.decoder).transform(LineSplitter()).listen((line) {
      print('stdout: $line'); // Optional: Log stdout for debugging.
      if (line.endsWith('Server listening on port $port')) {
        completer.complete();
      }
    });

    await completer.future;
  });

  tearDownAll(() => p.kill());

  test('Root is not defined', () async {
    final response = await get(Uri.parse('$host/'));
    expect(response.statusCode, 404);
    expect(response.body, 'Route not found');
  });

  test('Returns account', () async {
    final response = await get(Uri.parse('$host/account'));
    expect(response.statusCode, 200);
    final json = jsonDecode(response.body);
    expect(json, equals(isA<List>()));
  });
}
