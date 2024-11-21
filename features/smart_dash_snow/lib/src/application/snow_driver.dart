import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:smart_dash_snow/src/data/snow_client.dart';

abstract class SnowDriver extends Driver<SnowDriver> {
  SnowDriver({
    required super.ref,
    required super.key,
    required super.config,
  })  : _cache = FutureCache(prefix: '$SnowDriver[$key]'),
        super(
          type: IntegrationType.snow,
          last: DriverInitializedEvent.now(key),
        );

  static const ttl = Duration(hours: 1);
  static const max = Duration(hours: 24);

  final FutureCache _cache;

  @protected
  SnowClient newClient();

  Optional<SnowState> getCachedState(String location) {
    return _cache.get('state:$location');
  }

  Future<Optional<SnowState>> getState(
    String location, [
    Duration? ttl = ttl,
  ]) {
    final client = newClient();
    return _cache.getOrFetch(
      'state:$location',
      () async {
        try {
          return await client.getState(location);
        } finally {
          client.close();
        }
      },
      ttl: ttl?.clamp(ttl, max),
    );
  }

  Optional<List<SnowState>> getCachedStates() {
    return _cache.get('states');
  }

  Future<Optional<List<SnowState>>> getStates([
    Duration? ttl = ttl,
  ]) async {
    final client = newClient();

    return _cache.getOrFetch(
      'states',
      () async {
        try {
          final states = await client.getStates();
          if (states.isPresent) {
            raise(
              SnowDataEvent.now(key, states.value),
            );
            return states;
          }
          return const Optional.empty();
        } finally {
          client.close();
        }
      },
      ttl: ttl?.clamp(ttl, max),
    );
  }
}

class SnowEvent extends DriverEvent {
  SnowEvent({
    required super.key,
    required super.last,
    required super.when,
  });
}

class SnowDataEvent extends DriverEvent {
  SnowDataEvent(
    this.data, {
    required super.key,
    required super.last,
    required super.when,
  });
  final List<SnowState> data;

  factory SnowDataEvent.now(String key, List<SnowState> data) {
    final when = DateTime.now();
    return SnowDataEvent(
      data,
      key: key,
      when: when,
      last: when,
    );
  }
}
