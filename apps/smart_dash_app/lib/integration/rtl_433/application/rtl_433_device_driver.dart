import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash_app/integration/rtl_433/data/rtl_433_device_client.dart';
import 'package:smart_dash_app/integration/rtl_433/domain/rtl_433_device.dart';
import 'package:smart_dash_app/integration/rtl_433/rtl_433.dart';
import 'package:smart_dash_app/util/platform.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

class Rtl433DeviceDriver extends ThrottledDeviceDriver {
  Rtl433DeviceDriver(Ref ref, ServiceConfig config)
      : super(
          ref: ref,
          key: Rtl433.key,
          trailing: true,
          config: config,
          throttle: Duration(
            // TODO Make throttle configurable
            seconds: Platform.isDesktop ? 5 : 30,
          ),
        );

  final Map<Identity, Device> _devices = {};

  final List<StreamSubscription> _subscriptions = [];

  @override
  Rtl433DeviceClient newClient() {
    return Rtl433DeviceClient(ref, config);
  }

  @override
  Future<void> onInit(Completer<void> completer) async {
    return guard(
      () async {
        for (final device in await getPairedDevices()) {
          _devices[Identity.of(device)] = device;
        }

        final client = newClient();
        _subscriptions.add(
          client.updates.listen(
            _onUpdate,
            cancelOnError: false,
          ),
        );
        return super.onInit(completer);
      },
      task: 'onInit',
      name: '$Rtl433DeviceDriver',
    );
  }

  @override
  Future<void> onUnInit() async {
    for (final it in _subscriptions) {
      await it.cancel();
    }
    return super.onUnInit();
  }

  @override
  Future<List<Device>> onThrottledUpdate(DateTime event) async {
    final paired = await getPairedDevices();

    final updated = paired.isNotEmpty
        ? await getAllDevices(ids: paired.map((e) => e.id))
        : <Device>[];
    return updated;
  }

  @override
  List<DeviceDefinition> getDeviceDefinitions() {
    return Rtl433.supportedTypes.map((e) => e.toDefinition()).toList();
  }

  @override
  Future<List<Device>> getAllDevices({
    DeviceType type = DeviceType.any,
    Iterable<String> ids = const [],
  }) {
    final found = _devices.values
        .where((e) => ids.isEmpty || ids.contains(e.id))
        .where((e) => type.isAny || e.type == type)
        .toList();
    return Future.value(found);
  }

  void _onUpdate(Rtl433Device event) {
    final device = event.toDevice();
    _devices[Identity.of(device)] = device;
  }
}
