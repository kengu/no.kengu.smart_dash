import 'dart:async';

import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:smart_dash_snow/src/integration/nysny/application/nysny_driver.dart';
import 'package:stream_transform/stream_transform.dart';

part 'snow_service.g.dart';

@Riverpod(keepAlive: true)
class SnowService extends _$SnowService {
  @override
  Future<SnowService> build() async {
    final home = await ref.read(getCurrentHomeProvider().future);

    // Register SnowState integrations
    _snowManager.register(
      NySny.key,
      (config) => NySnyDriver(ref, config),
    );
    await _snowManager.build(home.value.serviceWhere);

    // Register snow device driver for each integration
    _deviceManager.register(
      NySny.key,
      (config) => SnowDeviceDriver(
        key: NySny.key,
        ref: ref,
        config: config,
      ),
    );
    await _deviceManager.build(home.value.serviceWhere);

    return this;
  }

  static const Duration ttl = SnowDriver.ttl;
  static const Duration max = SnowDriver.max;
  static const Duration period = Duration(seconds: 5);

  SnowManager get _snowManager => ref.read(snowManagerProvider);
  DeviceDriverManager get _deviceManager =>
      ref.read(deviceDriverManagerProvider);

  Stream<List<SnowState>> get updates {
    return _snowManager.events.whereType<SnowDataEvent>().map((e) => e.data);
  }

  Optional<SnowState> getCachedState(String location) {
    for (final config in _snowManager.configs) {
      final found = _snowManager.get(config).getCachedState(location);
      if (found.isPresent) {
        return found;
      }
    }
    return const Optional.empty();
  }

  Future<Optional<SnowState>> getState(
    String location, [
    Duration? ttl = ttl,
  ]) async {
    for (final config in _snowManager.configs) {
      final found = await _snowManager.get(config).getState(location, ttl);
      if (found.isPresent) {
        return found;
      }
    }
    return const Optional.empty();
  }

  Optional<List<SnowState>> getCachedStates() {
    final states = <SnowState>[];
    for (final config in _snowManager.configs) {
      final found = _snowManager.get(config).getCachedStates();
      if (found.isPresent) {
        states.addAll(found.value);
      }
      return Optional.of(states);
    }
    return const Optional.empty();
  }

  Future<Optional<List<SnowState>>> getStates([
    Duration? ttl = ttl,
  ]) async {
    final states = <SnowState>[];
    for (final config in _snowManager.configs) {
      final found = await _snowManager.get(config).getStates(ttl);
      if (found.isPresent) {
        states.addAll(found.value);
      }
      return Optional.of(states);
    }
    return const Optional.empty();
  }

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

    final stream = ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(ttl, max))
        .asyncMap((e) => getState(location))
        .where((e) => e.isPresent)
        .map((e) => e.value);

    await for (final it in stream) {
      yield it;
    }
  }

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

    final stream = ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(ttl, max))
        .asyncMap((e) => getStates(ttl))
        .where((e) => e.isPresent)
        .map((e) => e.value);

    await for (final it in stream) {
      yield it;
    }
  }
}
