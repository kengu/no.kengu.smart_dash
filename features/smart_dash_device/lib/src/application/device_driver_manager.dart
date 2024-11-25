import 'dart:async';

import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:stream_transform/stream_transform.dart';

part 'device_driver_manager.g.dart';

class DeviceDriverManager extends DriverManager<DeviceDriver> {
  DeviceDriverManager(super.ref) {
    ref.onDispose(dispose);
  }

  void dispose() {
    ref.read(flowManagerProvider).unbind();
    _deviceController.close();
    for (final e in _subscriptions) {
      e.cancel();
    }
  }

  // TODO Make delay configurable
  final Duration delay = const Duration(milliseconds: 50);
  final Logger _log = Logger('$DeviceDriverManager');
  final List<StreamSubscription> _subscriptions = [];
  final _deviceController = StreamController<DeviceEvent>.broadcast();

  /// Get stream of [DevicesPairedEvent]s.
  Stream<DevicesPairedEvent> get paired =>
      events.whereType<DevicesPairedEvent>();

  /// Get stream of [DevicesUpdatedEvent]s.
  Stream<DevicesUpdatedEvent> get updated =>
      events.whereType<DevicesUpdatedEvent>();

  /// Get stream of [DevicesUnpairedEvent]s.
  Stream<DevicesUnpairedEvent> get unpaired =>
      events.whereType<DevicesUnpairedEvent>();

  /// Get stream of device events
  Stream<DeviceEvent> get devices => _deviceController.stream.distinct();

  /// Get [ServiceConfig] for given [Integration.key]
  Optional<ServiceConfig> find(String service) {
    return configs.where((e) => e.key == service).firstOptional;
  }

  /// Get [DeviceDriver] for given [Integration.key]
  DeviceDriver getDriver(String service) {
    final config = find(service);
    assert(
      config.isPresent,
      '$DeviceDriver[key:$service] not found. '
      'Have you remembered to register it with the DeviceDriverManager?',
    );
    return get(config.value);
  }

  /// Start pumping update events to registered
  /// device drivers by binding it to the global timing event pump.
  @override
  Future<void> build(ServiceConfigGetter where) async {
    super.build(where);

    final isInit = _subscriptions.isEmpty;
    final pending = _ready(false).where((e) => !e.isInitializing).toList();

    final flows = ref.read(flowManagerProvider);
    final blocks = ref.read(blockManagerProvider);
    final timing = ref.read(timingServiceProvider);

    if (isInit) {
      flows.register(DeviceTokensFlow());
      blocks.register<DeviceBlockFlow>(DeviceBlockFlow.new);
    } else {
      flows.unbind();
      _subscriptions.clear();
    }

    final devicesEvents = events
        .whereType<DriverDevicesEvent>()
        .where(shouldProcess)
        .asBroadcastStream();

    // Listen for all incoming driver events
    _subscriptions.add(
      devicesEvents.listen(
        _handle,
        cancelOnError: false,
      ),
    );

    _subscriptions.add(
      timing.events.listen(
        (e) => Future.wait(
          _ready(true).map(_onUpdate),
        ),
        cancelOnError: false,
      ),
    );

    // Bind driver events to flows
    flows.bind<DriverDevicesEvent>(
      devicesEvents,
    );

    // Initialize pending drivers
    final result = await Future.wait(pending.map(
      // ignore: invalid_use_of_protected_member
      (driver) => driver.onInit(Completer()),
    ));

    _log.fine(
      'Initialized ${result.length} drivers (total: ${drivers.length})',
    );
  }

  // Processes incoming events from drivers
  void _handle(DriverDevicesEvent event) async {
    final stream = Stream.fromIterable(event.devices);
    // NOTE: We should not add events too fast to stream for
    // overall performance reasons. And StreamProviders only
    // sees last event when events are added more frequently
    // than 60 fps (less than 17 milliseconds between each event).
    await for (final device in stream.delayed(delay)) {
      // Process list of flow events in order of completion
      final emit = switch (event.runtimeType) {
        const (DevicesPairedEvent) => DevicePaired(device),
        const (DevicesUpdatedEvent) => DeviceUpdated(device),
        const (DevicesUnpairedEvent) => DeviceUnpaired(device),
        const (ThrottledDriverUpdatedEvent) => DeviceUpdated(device),
        Type() => throw UnimplementedError('Event $event not handled'),
      };
      _deviceController.add(emit);
    }
  }

  // Driver update triggered by each timing event
  Future<void> _onUpdate(DeviceDriver driver) {
    return guard<void>(
      () async {
        // ignore: invalid_use_of_protected_member
        final event = await driver.onUpdate();
        if (shouldProcess(event)) {
          switch (event) {
            case DriverDevicesEvent _:
              _log.fine(
                'Fetched [${event.devices.length}] devices '
                'from [${driver.key}] after ${event.duration.inSeconds} sec.',
              );
              if (event.isNotEmpty) {
                // Update devices
                await ref
                    .read(deviceRepositoryProvider)
                    .updateAll(event.devices);
              }
            case DriverFailureEvent _:
              _log.fine(
                'Failed to fetch devices '
                'from [${driver.key}] after ${event.duration.inSeconds} sec '
                'with error [${event.error.toString()}]',
              );
          }
        }
      },
      task: '_onUpdate',
      name: '$DeviceDriverManager',
    );
  }

  static bool shouldProcess(DriverEvent event) =>
      event is! ThrottledDriverUpdatedEvent || !event.wasThrottled;

  Iterable<DeviceDriver> _ready(bool isReady) =>
      drivers.where((e) => e.isReady == isReady);
}

@Riverpod(keepAlive: true)
DeviceDriverManager deviceDriverManager(DeviceDriverManagerRef ref) =>
    DeviceDriverManager(ref);

@riverpod
Stream<DevicesUpdatedEvent> driverUpdated(DriverUpdatedRef ref) =>
    ref.watch(deviceDriverManagerProvider).updated;
