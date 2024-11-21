import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

part 'snow_device.freezed.dart';
part 'snow_device.g.dart';

@freezed
class SnowDevice with _$SnowDevice, DeviceMapper {
  const SnowDevice._();
  const factory SnowDevice({
    @JsonKey(name: 'state') required SnowState state,
    @JsonKey(name: 'service') required String service,
  }) = _SnowDevice;

  int get snowDepth => state.depth;
  int get snowWeight => state.equivalent;
  String get location => state.location;
  DateTime get nextUpdate => state.nextUpdate;
  DateTime get lastUpdated => state.lastUpdated;

  factory SnowDevice.fromJson(Map<String, Object?> json) =>
      _$SnowDeviceFromJson(json);

  @override
  Device toDevice() => Device(
        name: location,
        data: toJson(),
        id: location.toLowerCase(),
        service: service,
        type: DeviceType.sensor,
        capabilities: [
          Capability.snowDepth,
          Capability.snowWeight,
        ],
        snowDepth: snowDepth,
        snowWeight: snowWeight,
        lastUpdated: lastUpdated,
      );
}
