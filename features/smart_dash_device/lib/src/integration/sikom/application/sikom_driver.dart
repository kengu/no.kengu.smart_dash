import 'dart:async';

import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_device/src/integration/sikom/data/sikom_client.dart';
import 'package:smart_dash_device/src/integration/sikom/domain/sikom_device.dart';
import 'package:smart_dash_device/src/integration/sikom/domain/sikom_gateway.dart';
import 'package:smart_dash_device/src/integration/sikom/domain/sikom_property.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:universal_io/io.dart';

class SikomDriver extends ThrottledDeviceDriver {
  SikomDriver(Ref ref, ServiceConfig config)
      : super(
          ref: ref,
          key: Sikom.key,
          trailing: true,
          config: config,
          throttle: Duration(
            // TODO Make throttle configurable
            seconds: _isDesktop ? 5 : 30,
          ),
        );

  static get _isDesktop =>
      Platform.isLinux || Platform.isMacOS || Platform.isWindows;

  @override
  SikomClient newClient() {
    return SikomClient(config);
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
    return Sikom.supportedTypes.map((e) => e.toDefinition()).toList();
  }

  Future<Optional<List<SikomGateway>>> getGateways() async {
    final client = newClient();
    return guard(
      () async {
        return client.getGateways();
      },
      done: client.close,
      name: '$SikomDriver',
      task: 'getGateways',
    );
  }

  @override
  Future<List<Device>> getAllDevices({
    DeviceType type = DeviceType.any,
    Iterable<String> ids = const [],
  }) async {
    final client = newClient();
    return guard(
      () async {
        final devices = <Device>[];
        final gateways = await client.getGateways();
        if (gateways.isPresent) {
          for (SikomGateway gateway in gateways.value) {
            final result = await client.getDevices(
              gateway,
              ids: ids,
              type: SikomDeviceType.fromDeviceType(type),
            );
            if (result.isPresent) {
              devices.addAll(result.value.map(
                (e) => e.toDevice(),
              ));
            }
          }
        }
        return devices;
      },
      done: client.close,
      name: '$SikomDriver',
      task: 'getAllDevices',
    );
  }

  @override
  Future<bool> updateDevice(Device device) async {
    final client = newClient();
    return guard(
      () async {
        final applied = <SikomProperty>{};
        final devices = await client.getAllDevices(ids: [device.id]);
        if (devices.isPresent) {
          final current = devices.value.first;
          final diff = current.diff(device);
          for (final it in diff) {
            final result = await client.setDeviceProperty(device.id, it);
            if (result.isPresent) applied.add(it);
          }
          return applied.length == diff.length;
        }
        return false;
      },
      done: client.close,
      name: '$SikomDriver',
      task: 'updateDevice',
    );
  }
}
