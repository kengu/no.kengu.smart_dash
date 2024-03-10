import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/data/device_repository.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/system/application/timing_service.dart';
import 'package:smart_dash/integration/domain/integration.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:stream_transform/stream_transform.dart';

import 'device_driver.dart';
import 'device_flow.dart';

part 'device_driver_manager.g.dart';

class DeviceDriverManager {
  DeviceDriverManager(this.ref);

  final Ref ref;
  final Map<String, DeviceDriver> _drivers = {};
  final Map<String, StreamSubscription> _subscriptions = {};

  final StreamController<DriverEvent> _controller =
      StreamController.broadcast();

  StreamSubscription<DateTime>? _timing;

  /// Get stream of [DevicesPairedEvent]s.
  Stream<DriverEvent> get events => _controller.stream;

  /// Get stream of [DevicesPairedEvent]s.
  Stream<DevicesPairedEvent> get paired =>
      _controller.stream.whereType<DevicesPairedEvent>();

  /// Get stream of [DevicesUpdatedEvent]s.
  Stream<DevicesUpdatedEvent> get updated =>
      _controller.stream.whereType<DevicesUpdatedEvent>();

  /// Get stream of [DevicesUnpairedEvent]s.
  Stream<DevicesUnpairedEvent> get unpaired =>
      _controller.stream.whereType<DevicesUnpairedEvent>();

  /// Check if [DeviceDriver] for given [definition] exists
  bool exists(String key) => _drivers.containsKey(key);

  /// [DeviceDriver] should call this to register
  void register(DeviceDriver driver) {
    _drivers[driver.key] = driver;
    debugPrint('DeviceDriverManager: '
        '${driver.runtimeType}[key:${driver.key}] registered');
  }

  /// Initialize manager
  Future<void> init() async {
    assert(
      _drivers.isNotEmpty,
      'Remember to register drivers before starting DeviceDriverManager',
    );
    assert(
      _ready(false).where((e) => e.isInitializing).isEmpty,
      'Concurrent init detected, you need to wait for the first to complete',
    );

    await Future.wait(_ready(false).map(
      // ignore: invalid_use_of_protected_member
      (e) => _onInit(e),
    ));
  }

  Future<void> _onInit(DeviceDriver driver) async {
    // ignore: invalid_use_of_protected_member
    final stream = await driver.onInit(Completer());
    _subscriptions[driver.key] = stream.listen(_controller.add);
  }

  /// Start pumping update events to registered
  /// device drivers by binding it to the global timing event pump.
  void bind() {
    assert(
      _drivers.isNotEmpty,
      'Remember to register drivers before starting the manager',
    );
    assert(
      _timing == null,
      'DeviceDriverManager is already bound to timing service',
    );

    // Register device flow with manager
    ref.read(flowManagerProvider)
      ..register(DeviceTokensFlow())
      ..bind(events);

    _timing = ref
        .read(timingServiceProvider)
        .events
        .listen((_) => Future.wait(_ready(true).map(_onUpdate)));
  }

  /// Stop pumping update events by unbinding from global
  /// event pump. Any ongoing operations will continue
  /// until it completes. No new operations will
  /// be performed until [bind] is called again.
  void unbind() {
    _timing?.cancel();
    _timing = null;
  }

  Future<void> dispose() async {
    await _controller.close();
    for (var e in _subscriptions.values) {
      e.cancel();
    }
  }

  /// Get [DeviceDriver] for given [IntegrationFields.key]
  DeviceDriver getDriver(String key) {
    assert(
      exists(key),
      'DeviceDriver $key not found. '
      'Have you remembered to register it with the DeviceDriverManager?',
    );
    return _drivers[key] as DeviceDriver;
  }

  Future<void> _onUpdate(DeviceDriver driver) {
    return guard<void>(
      () async {
        // ignore: invalid_use_of_protected_member
        final event = await driver.onUpdate();
        if (_shouldProcess(event)) {
          debugPrint(
            '$DeviceDriverManager: fetched [${event.devices.length}] devices from ${driver.key} '
            'after ${event.duration.inSeconds} sec.',
          );
          _controller.add(event);
          // Update devices
          await ref.read(deviceRepositoryProvider).updateAll(event.devices);
        }
      },
      task: '_onUpdate',
      name: 'DeviceDriverManager',
    );
  }

  bool _shouldProcess(DriverDevicesEvent event) =>
      event is! ThrottledDriverUpdatedEvent || !event.wasThrottled;

  Iterable<DeviceDriver> _ready(bool isReady) =>
      _drivers.values.where((e) => e.isReady == isReady);
}

@Riverpod(keepAlive: true)
DeviceDriverManager deviceDriverManager(DeviceDriverManagerRef ref) =>
    DeviceDriverManager(ref);

@riverpod
Stream<DevicesUpdatedEvent> driverUpdated(DriverUpdatedRef ref) =>
    ref.watch(deviceDriverManagerProvider).updated;
