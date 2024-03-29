import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:html/parser.dart' as parser;
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:sentry/sentry.dart';
import 'package:smart_dash/feature/snow/data/snow_client.dart';
import 'package:smart_dash/feature/snow/domain/snow_state.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/util/guard.dart';

class NySnyClient extends SnowClient {
  NySnyClient(this.api, this.credentials);

  final Dio api;

  final NySnyCredentials credentials;

  static final df = DateFormat("d. MMMM HH:mm", 'nb_NO');
  static final mf = DateFormat("d. MMMM", 'nb_NO');

  @override
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
            validateStatus: (status) {
              final success = status != null && status < 400;
              if (!success) {
                debugPrint(
                  'Fetching NySny table failed: [$status] /table.php',
                );
              }
              return success;
            },
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

          debugPrint('Fetched snow state: ${tableResponse.realUri}');

          return Optional.ofNullable(
            await _map(
              states?.where((e) => e['Snødybde'] != 'Ikke kjøpt'),
            ),
          );
        } else {
          debugPrint(
            'Failed to load snow state from table: [${tableResponse.statusCode}] ${tableResponse.realUri}',
          );
        }
      } else {
        debugPrint(
            'Snow state login failed: [${loginResponse.statusCode}] ${loginResponse.realUri}');
      }
    } catch (e) {
      debugPrint('Fetching snow state error occurred: $e');
    }
    return const Optional.empty();
  }

  final regex = RegExp(r'\(.*?\)');

  Future<List<SnowState>?> _map(Iterable<JsonObject>? states) {
    // Wrap in guard to catch nysny.no field
    // name changes and report it to sentry
    return guard(() {
      final now = DateTime.now();
      return Future.value(states
          ?.map(
            (data) => SnowState(
              location: _parse(
                data,
                field: 'Sted',
                match: regex,
                replace: '',
                defaultValue: '-',
              ),
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
                defaultValue: now,
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
    T Function(String value)? parse,
    String? split,
    Pattern? match,
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
      return parse == null ? item as T : parse(item);
    } catch (e, _) {
      Sentry.captureException(
        e,
        stackTrace: _,
        hint: Hint.withMap({
          'clue': 'Have www.nysny.no changed data format in field $field?',
          'field': field,
          'value': value,
        }),
      );
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
