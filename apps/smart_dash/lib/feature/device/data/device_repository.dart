import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

part 'device_repository.g.dart';

class DeviceRepository extends HiveRepository<Identity, Device> {
  DeviceRepository()
      : super(
          key: 'devices',
          box: 'paired',
          adapter: DeviceAdapter(),
        );

  @override
  String toKey(Identity id) => id.id;

  @override
  Identity toId(Device item) => Identity.of(item);
}

@Riverpod(keepAlive: true)
DeviceRepository deviceRepository(DeviceRepositoryRef ref) {
  return DeviceRepository();
}

class DeviceAdapter extends TypedAdapter<Device> {
  DeviceAdapter() : super(HiveTypeId.device);

  @override
  Device read(BinaryReader reader) {
    return Device.fromJson(jsonDecode(
      reader.read(),
    ));
  }

  @override
  void write(BinaryWriter writer, Device obj) {
    writer.write(jsonEncode(
      obj.toJson(),
    ));
  }
}
