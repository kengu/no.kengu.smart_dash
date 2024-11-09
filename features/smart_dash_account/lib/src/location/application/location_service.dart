import 'dart:async';

import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

abstract class LocationService {
  LocationService(this.key, this.ref);

  final Ref ref;

  final String key;

  final _cache = FutureCache(prefix: '$LocationService');

  final StreamController<Location> _updates = StreamController.broadcast();

  Stream<Location> get updates => _updates.stream;

  LocationClient newClient(ServiceConfig config);

  Future<Optional<Location>> reverseSearch({
    required double lon,
    required double lat,
    Duration? ttl,
  }) async {
    final key = 'reverse:$lat:$lon';
    return _cache.getOrFetch<Optional<Location>>(key, () async {
      final config = await _getConfig();
      if (config.isPresent) {
        final client = newClient(config.value);
        final location = await client.reverseSearch(
          lat: lat,
          lon: lon,
        );
        if (location.isPresent) {
          _updates.add(location.value);
        }
        return location;
      }
      return const Optional.empty();
    }, ttl: ttl);
  }

  Future<List<Location>> searchByName({
    required String query,
    Duration? ttl,
  }) async {
    final key = 'search:$query';
    return _cache.getOrFetch<List<Location>>(key, () async {
      final locations = <Location>[];
      final config = await _getConfig();
      if (config.isPresent) {
        final client = newClient(config.value);
        locations.addAll(
          await client.searchByName(query: query),
        );
        for (final it in locations) {
          _updates.add(it);
        }
      }
      return locations;
    }, ttl: ttl);
  }

  Future<Optional<ServiceConfig>> _getConfig(
      {Duration ttl = const Duration(seconds: 4)}) async {
    return _cache.getOrFetch('config', () async {
      final home = await ref.read(accountServiceProvider).getCurrentHome();
      if (!home.isPresent) return const Optional.empty();
      return home.value.firstServiceWhere(key);
    }, ttl: ttl);
  }

  static Location toLocation(String service, JsonObject data) {
    return Location.fromJson({
      'service': service,
      ...data,
    });
  }
}
