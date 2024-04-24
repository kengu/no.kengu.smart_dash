// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/snow/application/snow_service.dart';
import 'package:smart_dash/feature/snow/domain/snow_state.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:async/async.dart';

part 'snow_manager.g.dart';

class SnowManager {
  SnowManager(this.ref);

  final Ref ref;

  final _log = Logger('$SnowManager');

  final Map<String, SnowService> _services = {};

  /// Check if [SnowService] for given [ServiceConfig.key] exists
  bool exists(String key) => _services.containsKey(key);

  /// [Snow] should call this to register
  void register(SnowService service) {
    assert(
      _services[service.key] == null,
      'Snow service integration [${service.key}] exists already',
    );

    _services[service.key] = service;

    _log.info(
      '${service.runtimeType}[key:${service.key}] registered',
    );
  }

  /// Get [Snow] for given [IntegrationFields.key]
  T getService<T extends SnowService>(String key) {
    assert(
      exists(key),
      'SnowService $key not found. '
      'Have you remembered to register it with the SnowManager?',
    );
    return _services[key] as T;
  }

  /// Get first cached [SnowState] with given [location]
  Optional<SnowState> getCachedState(String location) {
    for (final service in _services.values) {
      final cached = service.getStatesCached();
      if (cached.isPresent) {
        final state =
            cached.value.firstWhereOptional((e) => e.location == location);
        if (state.isPresent) return state;
      }
    }
    return const Optional.empty();
  }

  /// Get first [SnowState] with given [location]
  Future<Optional<SnowState>> getState(String location, {Duration? ttl}) async {
    for (final key in _services.keys) {
      final state = await getService(key).getState(
        location,
        ttl: ttl,
      );
      if (state.isPresent) return state;
    }
    return const Optional.empty();
  }

  Optional<List<SnowState>> getCachedStates() {
    final states = <SnowState>[];
    for (final service in _services.values) {
      final cached = service.getStatesCached();
      if (cached.isPresent) {
        states.addAll(cached.value);
      }
    }
    return Optional.of(states);
  }

  Future<List<SnowState>> getStates({
    Duration? ttl = const Duration(minutes: 5),
  }) async {
    final states = <SnowState>[];
    for (final service in _services.values) {
      final result = await service.getStates(ttl: ttl);
      if (result.isPresent) {
        states.addAll(result.value);
      }
    }
    return states;
  }

  Stream<SnowState> getStateAsStream(String location,
      [Duration period = const Duration(minutes: 5)]) {
    return StreamGroup.merge(_services.values.map((e) => e.updates
        .map((e) => e.firstWhereOptional((e) => e.location == location))
        .where((e) => e.isPresent)
        .map((e) => e.value))).throttle(period);
  }

  Stream<List<SnowState>> getStatesAsStream(
      [Duration period = const Duration(minutes: 5)]) {
    return StreamGroup.merge(_services.values.map((e) => e.updates))
        .throttle(period);
  }
}

@Riverpod(keepAlive: true)
SnowManager snowManager(SnowManagerRef ref) => SnowManager(ref);
