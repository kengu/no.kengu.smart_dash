import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

class SnowDeviceClient extends DeviceClient {
  SnowDeviceClient(this.driver) : super(driver.config);

  final SnowDriver driver;

  Future<List<SnowDevice>> getDevices({
    Iterable<String> ids = const [],
  }) async {
    final devices = <SnowDevice>[];
    for (final states in await driver.getStates()) {
      for (final state in states) {
        devices.add(SnowDevice(
          service: driver.key,
          state: state,
        ));
      }
    }
    final tests = ids.toList();
    final found = devices
        .where((e) =>
            tests.isEmpty ||
            tests.contains(
              e.toDevice().id,
            ))
        .toList();
    return found;
  }

  @override
  void close() {
    // Not needed
  }
}
