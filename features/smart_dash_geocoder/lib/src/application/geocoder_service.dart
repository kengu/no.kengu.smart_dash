import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_geocoder/smart_dash_geocoder.dart';
import 'package:smart_dash_geocoder/src/application/geocoder_driver.dart';
import 'package:smart_dash_geocoder/src/application/geocoder_manager.dart';
import 'package:smart_dash_geocoder/src/integration/osm/application/osm_driver.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

part 'geocoder_service.g.dart';

class GeocoderService extends DriverService<Location, LocationEvent,
    GeocoderDriver, GeocoderManager> {
  GeocoderService(Ref ref)
      : super(ref, FutureCache(prefix: '$GeocoderService'));

  @override
  GeocoderManager get manager => ref.read(geocoderManagerProvider);

  Future<List<Location>> searchByName(
    String query, [
    Duration? ttl,
  ]) async {
    return cache.getOrFetch<List<Location>>('search:$query', () async {
      return manager.searchByName(query);
    }, ttl: ttl);
  }

  Stream<Location> searchByNameAsStream(
    String query, {
    String? service,
  }) async* {
    final matched = manager.drivers.where(
      (e) => service == null || e.key == service,
    );
    for (final driver in matched) {
      final result = await driver.searchByName(query);
      for (final it in result) {
        yield it;
      }
    }
  }

  Future<List<Location>> reverseSearch(
    PointGeometry point, [
    Duration? ttl,
  ]) async {
    final key = 'reverse:${point.lat}::${point.lon}';
    return cache.getOrFetch<List<Location>>(key, () async {
      return manager.reverseSearch(point);
    }, ttl: ttl);
  }

  Stream<Location> reverseSearchAsStream(
    PointGeometry point, {
    String? service,
  }) async* {
    final matched = manager.drivers.where(
      (e) => service == null || e.key == service,
    );
    for (final driver in matched) {
      final result = await driver.reverseSearch(point);
      if (result.isPresent) {
        yield result.value;
      }
    }
  }
}

@Riverpod(keepAlive: true)
GeocoderService geocoderService(GeocoderServiceRef ref) {
  final manager = ref.read(geocoderManagerProvider);
  final configs = [ServiceConfig.fromDefinition(Osm.definition)];

  // Register SnowState integrations
  manager.register(
    Osm.key,
    (config) => OsmDriver(ref, config),
  );
  manager.build((e) => configs);

  return GeocoderService(ref);
}
