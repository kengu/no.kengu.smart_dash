// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:html/parser.dart' as parser;
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:sentry/sentry.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:smart_dash_snow/src/data/snow_client.dart';

class NySnyClient extends SnowClient {
  NySnyClient(this.credentials)
      : api = Dio(
          BaseOptions(
            headers: {},
            baseUrl: 'https://nysny.no/',
          ),
        )
          // Process json in the background
          ..transformer = BackgroundTransformer();

  final Dio api;

  final NySnyCredentials credentials;

  final _log = Logger('$NySnyClient');

  static final df = DateFormat("d. MMMM HH:mm", 'nb_NO');

  static final mf = DateFormat("d. MMMM", 'nb_NO');

  @override
  Future<Optional<SnowState>> getState(String location) async {
    // Direct lookup of location not supported by NySny
    final states = await getStates();
    if (states.isPresent) {
      return states.value.firstWhereOptional(
        (e) => e.location == location,
      );
    }
    return Optional.empty();
  }

  @override
  Future<Optional<List<SnowState>>> getStates() {
    return guard(() async {
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
                _log.warning(
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

          _log.fine(
            'Fetched snow state: ${tableResponse.realUri}',
          );

          return Optional.ofNullable(
            await _map(
              states?.where((e) => e['Snødybde'] != 'Ikke kjøpt'),
            ),
          );
        }

        _log.warning(
          'Failed to load snow state from table: '
          '[${tableResponse.statusCode}] ${tableResponse.realUri}',
        );
      } else {
        _log.warning('Snow state login failed: '
            '[${loginResponse.statusCode}] ${loginResponse.realUri}');
      }
      return const Optional.empty();
    }, error: check_client_error);
  }

  @override
  void close() => api.close();

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
              nextUpdate: _toNextUpdate(now, data),
            ),
          )
          .toList());
    });
  }

  DateTime _toNextUpdate(DateTime now, JsonObject data) {
    final next = df
        .parse(
          '${mf.format(now)} ${data['Neste lesing']}',
        )
        .copyWith(year: now.year);
    if (next.difference(now).isNegative) {
      return next.add(const Duration(days: 1));
    }
    return next;
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
    } catch (e, stackTrace) {
      Sentry.captureException(
        e,
        stackTrace: stackTrace,
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
