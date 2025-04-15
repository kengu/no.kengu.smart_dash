import 'dart:async';

import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:stream_transform/stream_transform.dart';

import 'snow_driver_manager.dart';

/// A [DriverService] for [SnowState] lookup from [SnowDriver]
/// instances that implements a [IntegrationType.snow] integration type.
final class SnowDriverService extends DriverService<List<SnowState>,
    SnowDataEvent, SnowDriver, SnowDriverManager> with SnowService {
  SnowDriverService(Ref ref)
      : super(
          ref,
          IntegrationType.snow,
          FutureCache(
            prefix: '$SnowDriverService',
          ),
        );

  /// Get [DriverManager] of [SnowDriver] instances
  @override
  SnowDriverManager get manager => ref.read(snowDriverManagerProvider);

  /// Get [SnowState] for given [location] from [Snow] integrations
  @override
  Future<Optional<SnowState>> getState(
    String location, [
    Duration? ttl = SnowService.min,
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
      ttl: ttl?.clamp(ttl, SnowService.max),
    );
  }

  /// Get cached [SnowState] for given [location]
  @override
  Optional<SnowState> getStateCached(String location, [String? cacheKey]) {
    return cache.get<SnowState>('state:${cacheKey ?? location}');
  }

  /// Get a stream of [SnowState]s periodically
  /// pulled from [getState] for given [location].
  @override
  Stream<SnowState> getStateAsStream(
    String location, {
    bool refresh = false,
    Duration max = SnowService.max,
    Duration period = SnowService.period,
  }) async* {
    if (refresh) {
      for (final snow in await getState(location)) {
        yield snow;
      }
    }

    yield* ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(SnowService.min, max))
        .asyncMap((e) => getState(location))
        .where((e) => e.isPresent)
        .map((e) => e.value);
  }

  /// Get all [SnowState]s
  @override
  Future<Optional<List<SnowState>>> getStates([
    Duration? ttl = SnowService.min,
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
    }, ttl: ttl?.clamp(SnowService.period, SnowService.max));
  }

  /// Get all [SnowState]s from [cache]
  @override
  Optional<List<SnowState>> getStatesCached([String? cacheKey = 'states']) {
    return cache.get<List<SnowState>>('states:$cacheKey');
  }

  /// Get a stream of all [SnowState]s periodically pulled from [getStates].
  @override
  Stream<List<SnowState>> getStatesAsStream({
    bool refresh = false,
    Duration max = SnowService.max,
    Duration period = SnowService.period,
  }) async* {
    if (refresh) {
      for (final states in await getStates(period)) {
        yield states;
      }
    }

    yield* ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(SnowService.min, max))
        .asyncMap((e) => getStates(SnowService.min))
        .where((e) => e.isPresent)
        .map((e) => e.value);
  }
}
