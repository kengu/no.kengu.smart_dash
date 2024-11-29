import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:strings/strings.dart';

part 'network_info.freezed.dart';
part 'network_info.g.dart';

@freezed
class NetworkInfo with _$NetworkInfo {
  const factory NetworkInfo({
    required NetworkDeviceInfo local,
    required List<NetworkDeviceInfo> devices,
  }) = _NetworkInfo;
}

@freezed
class NetworkDeviceInfo with _$NetworkDeviceInfo {
  const NetworkDeviceInfo._();

  const factory NetworkDeviceInfo({
    required String hostId,
    required String ipAddress,
    required String deviceName,
    required bool isAvailable,
    String? hostName,
    String? macAddress,
    String? vendorName,
    DateTime? aliveWhen,
  }) = _NetworkDeviceInfo;

  String get readableName {
    final parts = deviceName.split('.lan');
    return (parts.isNotEmpty ? parts[0].split('-').join(' ') : deviceName)
        .toProperCase();
  }

  factory NetworkDeviceInfo.fromJson(Map<String, Object?> json) =>
      _$NetworkDeviceInfoFromJson(json);
}
