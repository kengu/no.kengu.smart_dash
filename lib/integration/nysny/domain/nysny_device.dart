import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/feature/snow/domain/snow_state.dart';
import 'package:smart_dash/integration/nysny/nysny.dart';

part 'nysny_device.freezed.dart';
part 'nysny_device.g.dart';

@freezed
class NySnyDevice with _$NySnyDevice, DeviceMapper {
  const NySnyDevice._();
  const factory NySnyDevice({
    @JsonKey(name: 'state') required SnowState state,
  }) = _NySnyDevice;

  int get snowDepth => state.depth;
  int get snowWeight => state.equivalent;
  String get location => state.location;
  DateTime get nextUpdate => state.nextUpdate;
  DateTime get lastUpdated => state.lastUpdated;

  factory NySnyDevice.fromJson(Map<String, Object?> json) =>
      _$NySnyDeviceFromJson(json);

  @override
  Device toDevice() => Device(
        name: location,
        data: toJson(),
        id: location.toLowerCase(),
        service: NySny.key,
        type: DeviceType.sensor,
        capabilities: [
          DeviceCapability.snowDepth,
          DeviceCapability.snowWeight,
        ],
        snowDepth: snowDepth,
        snowWeight: snowWeight,
        lastUpdated: lastUpdated,
      );

  DeviceDefinition toDeviceDefinition() {
    const type = DeviceType.sensor;
    return DeviceDefinition(
      type: type,
      name: NySny.readableModelName[type] ?? type.name,
    );
  }
}
