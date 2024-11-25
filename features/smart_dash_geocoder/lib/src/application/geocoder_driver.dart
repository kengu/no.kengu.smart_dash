import 'dart:async';

import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_geocoder/smart_dash_geocoder.dart';
import 'package:smart_dash_geocoder/src/data/geocoder_client.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

abstract class GeocoderDriver extends Driver<GeocoderDriver> {
  GeocoderDriver(Ref ref, String key, ServiceConfig config)
      : super(
          ref: ref,
          key: key,
          config: config,
          type: IntegrationType.location,
        );

  static const ttl = Duration(hours: 1);
  static const max = Duration(hours: 24);

  GeocoderClient newClient();

  Future<Optional<Location>> reverseSearch(PointGeometry point) async {
    final client = newClient();
    try {
      final result = await client.reverseSearch(point);
      if (result.isPresent) {
        raise(LocationEvent.now(key, result.value));
      }
      return result;
    } finally {
      client.close();
    }
  }

  Future<List<Location>> searchByName(
    String query, [
    Duration? ttl = ttl,
  ]) async {
    final client = newClient();
    try {
      final result = await client.searchByName(query);
      if (result.isNotEmpty) {
        for (final it in result) {
          raise(LocationEvent.now(key, it));
        }
      }
      return result;
    } finally {
      client.close();
    }
  }
}

class LocationEvent extends DriverDataEvent<Location> {
  LocationEvent(
    super.data, {
    required super.key,
    required super.last,
    required super.when,
  });

  factory LocationEvent.now(String key, Location data) {
    final when = DateTime.now();
    return LocationEvent(
      data,
      key: key,
      when: when,
      last: when,
    );
  }
}
