import 'dart:async';

import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:smart_dash_snow/src/application/snow_driver.dart';
import 'package:stream_transform/stream_transform.dart';

import 'snow_manager.dart';

part 'snow_service.g.dart';

/// A [DriverService] for [SnowState] lookup from [DeviceDriver]
/// that implements [IntegrationType.snow] integrations.
class SnowService extends DriverService<List<SnowState>, SnowDataEvent,
    SnowDriver, SnowManager> {
  SnowService(Ref ref) : super(ref, FutureCache(prefix: '$SnowService'));

  static const Duration ttl = SnowDriver.ttl;
  static const Duration max = SnowDriver.max;
  static const Duration period = Duration(seconds: 5);

  /// Get [DriverManager] of [SnowDriver] instances
  @override
  SnowManager get manager => ref.read(snowManagerProvider);

  /// Get [SnowState] for given [location] from [Snow] integrations
  Future<Optional<SnowState>> getState(
    String location, [
    Duration? ttl = ttl,
  ]) async {
    return cache.getOrFetch(
      'state:$location',
      () async {
        for (final config in manager.configs) {
          final found = await manager.get(config).getState(location);
          if (found.isPresent) {
            return found;
          }
        }
        return const Optional.empty();
      },
      ttl: ttl?.clamp(ttl, max),
    );
  }

  /// Get cached [SnowState] for given [location]
  Optional<SnowState> getStateCached(String location) {
    return cache.get('state:$location');
  }

  /// Get a stream of [SnowState]s periodically
  /// pulled from [getState] for given [location].
  Stream<SnowState> getStateAsStream(
    String location, {
    bool refresh = false,
    Duration max = max,
    Duration period = period,
  }) async* {
    if (refresh) {
      for (final snow in await getState(location)) {
        yield snow;
      }
    }

    yield* ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(ttl, max))
        .asyncMap((e) => getState(location))
        .where((e) => e.isPresent)
        .map((e) => e.value);
  }

  /// Get all [SnowState]s
  Future<Optional<List<SnowState>>> getStates([
    Duration? ttl = ttl,
  ]) async {
    return cache.getOrFetch('states', () async {
      final states = <SnowState>[];
      for (final config in manager.configs) {
        final found = await manager.get(config).getStates();
        if (found.isPresent) {
          states.addAll(found.value);
        }
        return Optional.of(states);
      }
      return const Optional.empty();
    }, ttl: ttl?.clamp(period, max));
  }

  /// Get all [SnowState]s from [cache]
  Optional<List<SnowState>> getStatesCached() {
    return cache.get('states');
  }

  /// Get a stream of all [SnowState]s periodically
  /// pulled from [getStates].
  Stream<List<SnowState>> getStatesAsStream({
    bool refresh = false,
    Duration max = max,
    Duration period = period,
  }) async* {
    if (refresh) {
      for (final states in await getStates(period)) {
        yield states;
      }
    }

    yield* ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(ttl, max))
        .asyncMap((e) => getStates(ttl))
        .where((e) => e.isPresent)
        .map((e) => e.value);
  }
}

/// Build a new [SnowService] instance.
@Riverpod(keepAlive: true)
SnowService snowService(SnowServiceRef ref) {
  return SnowService(ref);
}
