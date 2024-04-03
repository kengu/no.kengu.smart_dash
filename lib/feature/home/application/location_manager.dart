import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/home/application/location_service.dart';
import 'package:smart_dash/feature/home/domain/location.dart';
import 'package:smart_dash/integration/domain/integration.dart';

part 'location_manager.g.dart';

class LocationManager {
  static const ttl = Duration(minutes: 5);

  LocationManager(this.ref);

  final Ref ref;

  final Map<String, LocationService> _services = {};

  /// Check if [LocationService] for given [ServiceConfig.key] exists
  bool exists(String key) => _services.containsKey(key);

  /// [Location] should call this to register
  void register(LocationService service) {
    assert(_services[service.key] == null,
        'Location service integration [${service.key}] exists already');
    _services[service.key] = service;
    debugPrint('$LocationManager: '
        '${service.runtimeType}[key:${service.key}] registered');
  }

  /// Get [Location] for given [IntegrationFields.key]
  T getService<T extends LocationService>(String key) {
    assert(
      exists(key),
      'LocationService $key not found. '
      'Have you remembered to register it with the LocationManager?',
    );
    return _services[key] as T;
  }

  Future<List<Location>> reverseSearch({
    required double lat,
    required double lon,
    Duration? ttl = ttl,
  }) async {
    final locations = <Location>[];
    for (final service in _services.values) {
      final result = await service.reverseSearch(
        lat: lat,
        lon: lon,
        ttl: ttl,
      );
      if (result.isPresent) {
        locations.add(result.value);
      }
    }
    return locations;
  }

  Stream<Location> reverseSearchAsStream({
    required double lat,
    required double lon,
    String? service,
    Duration ttl = ttl,
  }) async* {
    for (final service in _services.values) {
      final result = await service.reverseSearch(
        lat: lat,
        lon: lon,
        ttl: ttl,
      );
      if (result.isPresent) {
        yield result.value;
      }
    }
  }

  Future<List<Location>> searchByName({
    required String query,
    Duration? ttl = ttl,
  }) async {
    final locations = <Location>[];
    for (final service in _services.values) {
      final result = await service.searchByName(
        query: query,
        ttl: ttl,
      );
      locations.addAll(result);
    }
    return locations;
  }

  Stream<Location> searchByNameAsStream({
    required String query,
    String? service,
    Duration ttl = ttl,
  }) async* {
    for (final service in _services.values) {
      final result = await service.searchByName(
        query: query,
        ttl: ttl,
      );
      for (final it in result) {
        yield it;
      }
    }
  }
}

@Riverpod(keepAlive: true)
LocationManager locationManager(LocationManagerRef ref) => LocationManager(ref);
