import 'dart:async';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:stream_transform/stream_transform.dart';

/// This class manages all Device instances, which represent all
/// paired [Device]s. Methods prefixed with "on" are only meant to be
/// overridden by subclassed and not part of any public api.
abstract class DeviceDriver extends Driver<DeviceDriver> {
  DeviceDriver({
    required super.ref,
    required super.key,
    required super.config,
  }) : super(type: IntegrationType.device) {
    ref.onDispose(onUnInit);
  }

  /// Set to true after [onInit] has completed
  bool _initializing = false;

  /// Completer tracking completion of [onInit]
  final Completer<void> _readyCompleter = Completer();

  /// Check if this driver is initializing
  /// ([DeviceDriver.onInit] is invoked but not completed yet).
  bool get isInitializing => _initializing;

  /// Check if this driver is ready ([DeviceDriver.onInit] has been run).
  bool get isReady => _readyCompleter.isCompleted;

  /// Returns a Future which is completed when this
  /// [DeviceDriver] is ready ([DeviceDriver.onInit] has been run).
  Future<void> awaitReady() => _readyCompleter.future;

  @protected
  DeviceClient newClient();

  /// This method is called when the driver is initiated.
  /// Overriding subclasses MUST class this method before
  /// initialization is preformed. When initialization is
  /// complete, subclass MUST call [Completer.complete].
  @protected
  @mustCallSuper
  Future<void> onInit(Completer<void> completer) async {
    assert(!isReady, 'Driver already initialized');
    _initializing = true;
    await completer.future;
    onRegisterFlows(ref.read(
      flowManagerProvider,
    ));
    _initializing = false;
    _readyCompleter.complete();
  }

  /// Called after [onInit]. Override to implement supported flows
  @visibleForOverriding
  void onRegisterFlows(FlowManager manager) {}

  /// This method is called after given devices was paired
  @protected
  Future<void> onPaired(List<Device> devices) async {}

  /// This method is called after given devices was unpaired
  @protected
  Future<void> onUnPaired(List<Device> devices) async {}

  /// This method is called when device states should be updated.
  /// The driver is responsible to determine which devices that
  /// should be updated.
  @protected
  Future<DriverEvent> onUpdate() async {
    return lastEvent;
  }

  /// This method is called when the driver is destroyed.
  @protected
  @mustCallSuper
  Future<void> onUnInit() {
    return dispose();
  }

  @override
  Future<void> dispose() async {
    if (!_readyCompleter.isCompleted) {
      _initializing = false;
      _readyCompleter.completeError(
        DriverDisposedEvent.now(key),
      );
    }
    return super.dispose();
  }

  /// Get list of all known [Device] definitions
  List<DeviceDefinition> getDeviceDefinitions();

  /// Get list of all available [Device]s.
  /// Use [DeviceDefinition.type] or
  /// [Device.id]s for a filtered response
  Future<List<Device>> getAllDevices({
    DeviceType type = DeviceType.any,
    Iterable<String> ids = const [],
  });

  /// Attempt to pair with list of devices.
  /// Only devices that belongs to this driver [key] is paired
  Future<List<Device>> pairAll(List<Device> devices) async {
    final supported = devices.where((e) => e.service == key);
    final repo = ref.read(deviceRepositoryProvider);
    final unique = await repo.updateAll(supported);
    await onPaired(unique.all);
    raise(DevicesPairedEvent.now(
      key,
      unique.all,
    ));
    return unique.all;
  }

  /// Attempt to unpair with list of devices.
  /// Only devices that belongs to this driver [key] is unpaired
  Future<List<Device>> unpairAll(List<Device> devices) async {
    final supported = devices.where((e) => e.service == key);
    final repo = ref.read(deviceRepositoryProvider);
    final unique = await repo.removeAll(supported);
    await onUnPaired(unique.all);
    raise(DevicesUnpairedEvent.now(
      key,
      unique.all,
    ));
    return unique.all;
  }

  /// Get list of all [Device]s paired with this driver [key]
  Future<List<Device>> getPairedDevices(
      [DeviceType type = DeviceType.any]) async {
    final repo = ref.read(deviceRepositoryProvider);
    final devices = await repo.getAll();
    return devices
        .where((e) => e.service == key && (type.isAny || e.type == type))
        .toList();
  }

  /// Get list of all new [Device]s (available but not paired)
  Future<List<Device>> getNewDevices([DeviceType type = DeviceType.any]) async {
    // TODO: Cache response
    final available = await getAllDevices(type: type);
    final devices = await ref.read(deviceRepositoryProvider).where(
          (e) => e.service == key && (type.isAny || e.type == type),
        );
    final paired = devices.map((e) => e.id);
    if (paired.isEmpty) return available;
    return available.where((device) => !paired.contains(device.id)).toList();
  }

  /// Set device properties of given device.
  /// Returns true if succeeded
  Future<bool> updateDevice(Device device) => Future.value(false);
}

abstract class DriverDevicesEvent extends DriverEvent {
  DriverDevicesEvent(
    this.devices, {
    required super.key,
    required super.when,
    required super.last,
  });

  final List<Device> devices;

  /// Convenience getter for first device in [devices]
  Optional<Device> get first =>
      devices.isEmpty ? const Optional.empty() : Optional.of(devices.first);

  bool get isEmpty => devices.isEmpty;
  bool get isNotEmpty => devices.isNotEmpty;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverDevicesEvent &&
          runtimeType == other.runtimeType &&
          when == other.when &&
          devices == other.devices;

  @override
  int get hashCode => when.hashCode ^ devices.hashCode;
}

/// This class stores facts about each
/// [DeviceDriver.onPaired] outcome. You can use
/// [DriverEvent.last] (updated) and
/// [DriverEvent.when] (this event was emitted)
/// to reason about the device state freshness. The duration
/// since last update and when this event was emitted is calculated
/// by the convenience getter [DriverDevicesEvent.duration]
class DevicesPairedEvent extends DriverDevicesEvent {
  DevicesPairedEvent(
    super.devices, {
    required super.key,
    required super.when,
    required super.last,
  });

  factory DevicesPairedEvent.now(String key,
      [List<Device> devices = const []]) {
    final when = DateTime.now();
    return DevicesPairedEvent(
      devices,
      key: key,
      when: when,
      last: when,
    );
  }
}

/// This class stores facts about each
/// [DeviceDriver.onUpdate] outcome. You can use
/// [DriverEvent.last] (updated) and
/// [DriverEvent.when] (this event was emitted)
/// to reason about the device state freshness. The duration
/// since last update and when this event was emitted is calculated
/// by the convenience getter [DriverDevicesEvent.duration]
class DevicesUpdatedEvent extends DriverDevicesEvent {
  DevicesUpdatedEvent(
    super.devices, {
    required super.key,
    required super.when,
    required super.last,
  });
  factory DevicesUpdatedEvent.now(String key,
      [List<Device> devices = const []]) {
    final when = DateTime.now();
    return DevicesUpdatedEvent(
      devices,
      key: key,
      when: when,
      last: when,
    );
  }

  factory DevicesUpdatedEvent.from(DevicesUpdatedEvent event) {
    return DevicesUpdatedEvent(
      event.devices,
      key: event.key,
      last: event.when,
      when: DateTime.now(),
    );
  }
}

/// This class stores facts about each
/// [DeviceDriver.onUnPaired] outcome. You can use
/// [DriverEvent.last] (updated) and
/// [DriverEvent.when] (this event was emitted)
/// to reason about the device state freshness. The duration
/// since last update and when this event was emitted is calculated
/// by the convenience getter [DriverDevicesEvent.duration]
class DevicesUnpairedEvent extends DriverDevicesEvent {
  DevicesUnpairedEvent(
    super.devices, {
    required super.key,
    required super.when,
    required super.last,
  });

  factory DevicesUnpairedEvent.now(String key,
      [List<Device> devices = const []]) {
    final when = DateTime.now();
    return DevicesUnpairedEvent(
      devices,
      key: key,
      when: when,
      last: when,
    );
  }
}

/// This class adds throttled updates to [DeviceDriver].
/// Use [ThrottledDeviceDriver.throttle] to define the
/// minimum duration between calls to
/// [ThrottledDeviceDriver.onThrottledUpdate], and
/// [ThrottledDeviceDriver.trailing] to control when
/// each update is executed at the end of each throttled
/// period. See [RateLimit.throttle] for more information
/// about throttle configuration.
abstract class ThrottledDeviceDriver extends DeviceDriver {
  ThrottledDeviceDriver({
    required super.key,
    required super.ref,
    required super.config,
    required this.throttle,
    required this.trailing,
  });

  @protected
  final bool trailing;
  final Duration throttle;

  final List<StreamSubscription> _subscriptions = [];
  final StreamController<DateTime> _updateController =
      StreamController.broadcast();

  Completer<DriverEvent> _updateCompleter = Completer();

  /// This method is called when the driver is initiated.
  /// Overriding subclasses MUST class this method before
  /// initialization is preformed. When initialization is
  /// complete, subclass MUST call [Completer.complete].
  @override
  @protected
  @mustCallSuper
  Future<void> onInit(Completer<void> completer) {
    final future = super.onInit(completer);
    _subscriptions.add(
      _updateController.stream
          .throttle(throttle, trailing: trailing)
          .listen(_tryThrottledUpdate, cancelOnError: false),
    );
    completer.complete();
    return future;
  }

  void _tryThrottledUpdate(DateTime event) async {
    try {
      Logger('$runtimeType').fine(
        '[${key.toUpperCase()}]@$hashCode throttled updates for '
        '${event.difference(lastEvent.last).inSeconds} sec.',
      );

      final devices = await onThrottledUpdate(event);
      _complete(
        ThrottledDriverUpdatedEvent.now(lastEvent, devices),
      );
    } on DioException catch (error) {
      _complete(DriverFailureEvent(
        error,
        key: key,
        last: lastEvent.last,
        when: DateTime.now(),
      ));
    }
  }

  void _complete(DriverEvent event) {
    if (!_updateCompleter.isCompleted) {
      raise(event);
      _updateCompleter.complete(lastEvent);
    }
  }

  /// This method is called when device states should be updated.
  /// The driver is responsible to determine which devices that
  /// should be updated. Overriding subclasses MUST call this method.
  @override
  @mustCallSuper
  Future<DriverEvent> onUpdate() async {
    if (isDisposed) {
      return lastEvent;
    }

    _updateController.add(DateTime.now());
    if (_shouldThrottle()) {
      return raise(ThrottledDriverUpdatedEvent.throttled(
        lastEvent,
      ));
    }
    _updateCompleter = Completer();
    return _updateCompleter.future;
  }

  bool _shouldThrottle() =>
      lastEvent is ThrottledDriverUpdatedEvent &&
          (lastEvent as ThrottledDriverUpdatedEvent).wasThrottled ||
      !_updateCompleter.isCompleted;

  /// This method is called in accordance with [throttle] and [trailing].
  @protected
  Future<List<Device>> onThrottledUpdate(DateTime event);

  /// This method is called when the driver is destroyed.
  /// Overriding subclasses MUST class this method.
  @override
  @protected
  @mustCallSuper
  Future<void> onUnInit() {
    _updateController.close();
    for (final it in _subscriptions) {
      it.cancel();
    }
    return super.onUnInit();
  }
}

/// This class stores facts about each
/// [ThrottledDeviceDriver.onThrottledUpdate] outcome.
/// If [ThrottledDriverUpdatedEvent.wasThrottled]
/// is true, last known state of each device is given in
/// [ThrottledDriverUpdatedEvent.devices]. You can use
/// [ThrottledDriverUpdatedEvent.last] (updated) and
/// [ThrottledDriverUpdatedEvent.when] (this event was emitted)
/// to reason about the device state freshness. The duration
/// since last update and when this event was emitted is calculated
/// by the convenience getter [DevicesUpdatedEvent.duration]
class ThrottledDriverUpdatedEvent extends DevicesUpdatedEvent {
  ThrottledDriverUpdatedEvent(
    super.devices, {
    required super.key,
    required super.when,
    required super.last,
    required this.wasThrottled,
  });
  final bool wasThrottled;

  factory ThrottledDriverUpdatedEvent.now(DriverEvent last,
      [List<Device> devices = const []]) {
    return ThrottledDriverUpdatedEvent(
      devices,
      key: last.key,
      last: last.last,
      when: DateTime.now(),
      wasThrottled: false,
    );
  }

  factory ThrottledDriverUpdatedEvent.throttled(DriverEvent event) {
    // Keep time of first throttled event
    final last = event is ThrottledDriverUpdatedEvent && event.wasThrottled
        ? event.last
        : event.when;
    return ThrottledDriverUpdatedEvent(
      event is DriverDevicesEvent ? event.devices : <Device>[],
      key: event.key,
      last: last,
      when: DateTime.now(),
      wasThrottled: true,
    );
  }

  @override
  String toString() {
    return '$ThrottledDriverUpdatedEvent{wasThrottled: $wasThrottled}';
  }
}

abstract class DeviceEvent extends DriverDataEvent<Device> {
  DeviceEvent(
    super.data, {
    required super.last,
    required super.when,
  }) : super(key: data.service);

  bool isDevice(Device device) => Identity.of(device) == Identity.of(data);
}

class DevicePaired extends DeviceEvent {
  DevicePaired(
    super.data, {
    required super.last,
    required super.when,
  });

  factory DevicePaired.now(Device data) {
    final when = DateTime.now();
    return DevicePaired(
      data,
      when: when,
      last: when,
    );
  }
}

class DeviceUpdated extends DeviceEvent {
  DeviceUpdated(
    super.data, {
    required super.last,
    required super.when,
  });
  factory DeviceUpdated.now(Device data) {
    final when = DateTime.now();
    return DeviceUpdated(
      data,
      when: when,
      last: when,
    );
  }
}

class DeviceUpdatePending extends DeviceEvent {
  DeviceUpdatePending(
    super.data, {
    required super.last,
    required super.when,
  });
  factory DeviceUpdatePending.now(Device data) {
    final when = DateTime.now();
    return DeviceUpdatePending(
      data,
      when: when,
      last: when,
    );
  }
}

class DeviceUpdateCompleted extends DeviceEvent {
  DeviceUpdateCompleted(
    super.device, {
    required super.last,
    required super.when,
  });
  factory DeviceUpdateCompleted.now(Device data) {
    final when = DateTime.now();
    return DeviceUpdateCompleted(
      data,
      when: when,
      last: when,
    );
  }
}

class DeviceUnpaired extends DeviceEvent {
  DeviceUnpaired(
    super.device, {
    required super.last,
    required super.when,
  });
  factory DeviceUnpaired.now(Device data) {
    final when = DateTime.now();
    return DeviceUnpaired(
      data,
      when: when,
      last: when,
    );
  }
}
