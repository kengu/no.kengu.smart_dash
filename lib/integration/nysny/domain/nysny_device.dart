import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/feature/snow/domain/snow_state.dart';
import 'package:smart_dash/integration/nysny/nysny.dart';

part 'nysny_device.freezed.dart';
part 'nysny_device.g.dart';

/// See https://triq.org/rtl_433/DATA_FORMAT.html
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
        data: toJson(),
        name: '$NySny',
        id: location.toLowerCase(),
        service: NySny.key,
        capabilities: [
          DeviceCapability.snowDepth,
          DeviceCapability.snowWeight,
        ],
        snowDepth: snowDepth,
        snowWeight: snowWeight,
        type: DeviceType.sensor,
        lastUpdated: lastUpdated,
      );

  DeviceDefinition toDeviceDefinition() {
    return DeviceDefinition(
      type: DeviceType.sensor,
      name: DeviceType.sensor.name,
    );
  }
}
