import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:html/parser.dart' as parser;
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/snow/domain/snow_state.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/util/guard.dart';

class NySnyClient {
  NySnyClient(
    this.api,
    this.credentials,
  );

  final Dio api;

  final NySnyCredentials credentials;

  static final df = DateFormat("d. MMM HH:mm", 'nb_NO');
  static final mf = DateFormat("d. MMM", 'nb_NO');

  Future<Optional<List<SnowState>>> getStates() async {
    try {
      // Step 1: Log in
      final loginResponse = await api.post(
        '/main.php',
        options: Options(
            headers: <String, String>{
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status == 302;
            }),
        data: {
          'epost': credentials.email,
          'password': credentials.password,
        },
      );

      // Check if login is successful based on loginResponse
      if (loginResponse.statusCode == 302) {
        // Step 2: Access the page with the table
        final cookie = loginResponse.headers['set-cookie']!;
        final tableResponse = await api.get(
          '/table.php',
          options: Options(
            headers: {'Cookie': cookie},
          ),
        );

        if (tableResponse.statusCode == 200) {
          // Step 3: Scrape the table
          final document = parser.parse(tableResponse.data);
          final table = document.querySelector('table');
          final rows = table?.querySelectorAll('tr');

          final columnNames = rows?.first
              .querySelectorAll('th')
              .map((th) => th.text.trim())
              .toList();

          final states = rows?.skip(1).map((row) {
            final cells = row.querySelectorAll('td');
            final json = <String, dynamic>{};
            for (var i = 0; i < cells.length; i++) {
              json[columnNames?[i] ?? 'Column$i'] = cells[i].text.trim();
            }
            return json;
          }).toList();

          return Optional.ofNullable(
            await _map(
              states?.where((e) => e['Snødybde'] != 'Ikke kjøpt'),
            ),
          );
        } else {
          debugPrint(
            'Failed to load the table page: ${tableResponse.statusCode}',
          );
        }
      } else {
        debugPrint('Login failed: ${loginResponse.statusCode}');
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
    }
    return const Optional.empty();
  }

  Future<List<SnowState>?> _map(Iterable<JsonObject>? states) {
    // Wrap in guard to catch nysny.no field
    // name changes and report it to sentry
    return guard(() {
      final now = DateTime.now();
      return Future.value(states
          ?.map(
            (data) => SnowState(
              location: data['Sted'] as String,
              depth: _parse(
                data,
                field: 'Snødybde',
                split: ' cm',
                parse: int.parse,
                defaultValue: 0,
              ),
              elevation: _parse(
                data,
                field: 'moh',
                parse: int.parse,
                defaultValue: 0,
              ),
              equivalent: _parse(
                data,
                field: 'kg pr m2',
                split: ' kg/m2',
                parse: int.parse,
                defaultValue: 0,
              ),
              temperature: _parse(
                data,
                field: 'Luft',
                split: '°C',
                match: ',',
                replace: '.',
                parse: double.parse,
                defaultValue: 0,
              ),
              lastUpdated: _parse(
                data,
                field: 'Tid',
                parse: df.parse,
                defaultValue: DateTime.fromMillisecondsSinceEpoch(
                  0,
                ),
              ).copyWith(year: now.year),
              nextUpdate: df
                  .parse(
                    '${mf.format(now)} ${data['Neste lesing']}',
                  )
                  .copyWith(year: now.year),
            ),
          )
          .toList());
    });
  }

  T _parse<T>(
    JsonObject data, {
    required String field,
    required T defaultValue,
    required T Function(String value) parse,
    String? split,
    String? match,
    String? replace,
  }) {
    final value = data[field] as String;
    final first = split == null ? value : value.split(split)[0];
    final item = match == null
        ? first
        : first.replaceAll(
            match,
            replace!,
          );

    try {
      return parse(item);
    } catch (e) {
      return defaultValue;
    }
  }
}

class NySnyCredentials {
  NySnyCredentials({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}
