import 'dart:async';

import 'package:async/async.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:stream_transform/stream_transform.dart';

part 'snow_service.g.dart';

class SnowService {
  SnowService(this.ref);

  static const ttl = Duration(hours: 1);

  final Ref ref;

  final _cache = FutureCache(prefix: '$SnowService');

  final StreamController<List<SnowState>> _updates =
      StreamController.broadcast();

  Stream<List<SnowState>> get updates => _updates.stream;

  SnowManager get _manager => ref.read(snowManagerProvider);

  Future<Optional<SnowState>> getState(
    String location, {
    Duration? ttl = ttl,
  }) async {
    final states = await getStates(ttl: ttl);
    if (states.isPresent) {
      return states.value.firstWhereOptional((e) => e.location == location);
    }
    return const Optional.empty();
  }

  Optional<SnowState> getCachedState(String location) {
    final states = _cache.get<List<SnowState>>('states');
    if (states.isPresent) {
      return states.value.firstWhereOptional((e) => e.location == location);
    }
    return const Optional.empty();
  }

  Optional<List<SnowState>> getCachedStates() {
    return _cache.get('states');
  }

  Future<Optional<List<SnowState>>> getStates({
    Duration? ttl = ttl,
  }) async {
    return _cache.getOrFetch(
      'states',
      () async {
        final states = <SnowState>[];
        for (final config in _manager.configs) {
          final found = await _manager.get(config).getStates();
          if (found.isPresent) {
            states.addAll(found.value);
          }
        }
        if (states.isNotEmpty) {
          _updates.add(states);
          return Optional.of(states);
        }
        return const Optional<List<SnowState>>.empty();
      },
      ttl: ttl?.clamp(
        ttl,
        const Duration(days: 1),
      ),
    );
  }

  Stream<SnowState> getStateAsStream(String location,
      [Duration period = const Duration(minutes: 5)]) {
    return StreamGroup.merge(_manager.drivers.map((e) => e.events
        .throttle(period)
        .map((e) => e.firstWhereOptional((e) => e.location == location))
        .where((e) => e.isPresent)
        .map((e) => e.value)));
  }

  Stream<List<SnowState>> getStatesAsStream(
      [Duration period = const Duration(minutes: 5)]) {
    return StreamGroup.merge(
      _manager.drivers.map((e) => e.events.throttle(period)),
    );
  }
}

@Riverpod(keepAlive: true)
SnowService snowService(SnowServiceRef ref) => SnowService(ref);
