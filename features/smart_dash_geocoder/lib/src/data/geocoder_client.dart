import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_geocoder/smart_dash_geocoder.dart';

abstract class GeocoderClient {
  Future<Optional<Location>> reverseSearch(PointGeometry point);

  Future<List<Location>> searchByName(String query);

  Future<void> close();
}

abstract class GeocoderClientBase {
  GeocoderClientBase(this.ref, this.service, this.api);
  final Ref ref;
  final Dio api;
  final String service;

  final _log = Logger('$GeocoderClientBase');

  Location toLocation(JsonObject data);

  String getReverseSearchPath(PointGeometry point);

  String getSearchByNamePath(String query);

  Future<Optional<Location>> reverseSearch(PointGeometry point) async {
    return guard(() async {
      final path = getReverseSearchPath(point);
      final response = await api.get(
        path,
        options: Options(
          validateStatus: (status) {
            final success = status != null && status < 400;
            if (!success) {
              _log.warning(
                'Fetching reverse location search from '
                '[$service] failed: [$status] $path',
              );
            }
            return success;
          },
        ),
      );
      _log.fine(
        'Fetched reverse location search from '
        '[$service]: ${response.realUri}',
      );

      return Optional.of(
        toLocation(response.data as JsonObject),
      );
    });
  }

  Future<List<Location>> searchByName(String query) async {
    return guard(() async {
      final path = getSearchByNamePath(query);
      final response = await api.get(
        path,
        options: Options(
          validateStatus: (status) {
            final success = status != null && status < 400;
            if (!success) {
              _log.warning(
                'Fetching search location by name '
                'from [$service] failed: [$status] $path',
              );
            }
            return success;
          },
        ),
      );
      _log.fine(
        'Fetched search location by name from '
        '[$service]: ${response.realUri}',
      );
      final items = response.data as List<JsonObject>;
      return items.map(toLocation).toList();
    });
  }
}
