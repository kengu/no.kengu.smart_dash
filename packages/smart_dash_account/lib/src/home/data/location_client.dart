// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

abstract class LocationClient {
  Future<Optional<Location>> reverseSearch(
      {required double lon, required double lat});

  Future<List<Location>> searchByName({required String query});
}

abstract class LocationClientBase {
  LocationClientBase(this.service, this.ref, this.api);
  final Dio api;
  final Ref ref;
  final String service;

  final _log = Logger('$LocationClientBase');

  Location toLocation(JsonObject data);

  String getReverseSearchPath(double lat, double lon);

  String getSearchByNamePath(String query);

  Future<Optional<Location>> reverseSearch(
      {required double lon, required double lat}) async {
    return guard(() async {
      final path = getReverseSearchPath(lat, lon);
      final response = await api.get(
        path,
        options: Options(
          validateStatus: (status) {
            final success = status != null && status < 400;
            if (!success) {
              _log.warning(
                'Fetching reverse location search from [$service] failed: [$status] $path',
              );
            }
            return success;
          },
        ),
      );
      _log.fine(
        'Fetched reverse location search from [$service]: ${response.realUri}',
      );

      return Optional.of(
        toLocation(response.data as JsonObject),
      );
    });
  }

  Future<List<Location>> searchByName({required String query}) async {
    return guard(() async {
      final path = getSearchByNamePath(query);
      final response = await api.get(
        path,
        options: Options(
          validateStatus: (status) {
            final success = status != null && status < 400;
            if (!success) {
              _log.warning(
                'Fetching search location by name from [$service] failed: [$status] $path',
              );
            }
            return success;
          },
        ),
      );
      _log.fine(
        'Fetched search location by name from [$service]: ${response.realUri}',
      );
      final items = response.data as List<JsonObject>;
      return items.map(toLocation).toList();
    });
  }
}
