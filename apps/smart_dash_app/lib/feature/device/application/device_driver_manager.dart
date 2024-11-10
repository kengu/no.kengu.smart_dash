// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/feature/device/application/device_block_flow.dart';
import 'package:smart_dash_app/feature/device/data/device_repository.dart';
import 'package:smart_dash_app/feature/system/application/connectivity_service.dart';
import 'package:smart_dash_app/feature/system/application/timing_service.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';
import 'package:stream_transform/stream_transform.dart';

import 'device_driver.dart';
import 'device_tokens_flow.dart';

part 'device_driver_manager.g.dart';

class DeviceDriverManager {
  DeviceDriverManager(this.ref);

  final Ref ref;
  final Map<String, DeviceDriver> _drivers = {};
  final Map<String, StreamSubscription> _subscriptions = {};

  final StreamController<DriverEvent> _controller =
      StreamController.broadcast();

  final _log = Logger('$DeviceDriverManager');

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
    _log.info(
      '${driver.runtimeType}[key:${driver.key}] registered',
    );
  }

  /// Start pumping update events to registered
  /// device drivers by binding it to the global timing event pump.
  Future<void> bind() async {
    assert(
      _timing == null,
      'DeviceDriverManager is already bound to timing service',
    );
    assert(
      _drivers.isNotEmpty,
      'Remember to register drivers before starting the manager',
    );
    assert(
      _ready(false).where((e) => e.isInitializing).isEmpty,
      'Concurrent init detected, you need to wait for the first to complete',
    );

    await Future.wait(_ready(false).map(
      // ignore: invalid_use_of_protected_member
      (e) => _onInit(e),
    ));

    // Register device token flow
    ref.read(flowManagerProvider)
      ..register(DeviceTokensFlow())
      ..bind(events);

    // Register device block flow builder
    ref.read(blockManagerProvider).register<DeviceBlockFlow>(_builder);

    _timing = ref.read(timingServiceProvider).events.listen(
        (_) => Future.wait(_ready(true).map(_onUpdate)),
        cancelOnError: false);
  }

  Future<void> _onInit(DeviceDriver driver) async {
    // ignore: invalid_use_of_protected_member
    final stream = await driver.onInit(Completer());
    _subscriptions[driver.key] =
        stream.listen(_controller.add, cancelOnError: false);
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
          final connectivity = ref.read(connectivityServiceProvider);
          switch (event) {
            case DriverDevicesEvent _:
              _log.fine(
                'Fetched [${event.devices.length}] devices '
                'from [${driver.key}] after ${event.duration.inSeconds} sec.',
              );
              if (event.isNotEmpty) {
                _controller.add(event);
                // Update devices
                await ref
                    .read(deviceRepositoryProvider)
                    .updateAll(event.devices);
              }
              connectivity.setOK(driver.key);
            case DriverIOErrorEvent _:
              _log.fine(
                'Failed to fetch devices '
                'from [${driver.key}] after ${event.duration.inSeconds} sec '
                'with IO error [${event.error.toString()}]',
              );
              connectivity.setFailed(
                driver.key,
                event.error,
              );
          }
        }
      },
      task: '_onUpdate',
      name: 'DeviceDriverManager',
    );
  }

  bool _shouldProcess(DriverEvent event) =>
      event is! ThrottledDriverUpdatedEvent || !event.wasThrottled;

  Iterable<DeviceDriver> _ready(bool isReady) =>
      _drivers.values.where((e) => e.isReady == isReady);

  DeviceBlockFlow _builder(Ref ref, String id) {
    return DeviceBlockFlow(ref: ref, id: id);
  }
}

@Riverpod(keepAlive: true)
DeviceDriverManager deviceDriverManager(DeviceDriverManagerRef ref) =>
    DeviceDriverManager(ref);

@riverpod
Stream<DevicesUpdatedEvent> driverUpdated(DriverUpdatedRef ref) =>
    ref.watch(deviceDriverManagerProvider).updated;
