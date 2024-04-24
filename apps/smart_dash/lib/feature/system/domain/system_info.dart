import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_info.freezed.dart';

@freezed
class SystemInfo with _$SystemInfo {
  const SystemInfo._();

  const factory SystemInfo({
    required double? cpuApp,
    required double cpuTotal,
    required int memApp,
    required int memFree,
    required int memTotal,
    required bool memIsLow,
    required double batteryLevel,
  }) = _SystemInfo;

  int get memUsed => memTotal - memFree;
  int get memPressure =>
      memTotal > 0 ? ((memTotal - memFree) / memTotal * 100).round() : 0;
  bool get isAppUsage => cpuApp == cpuTotal;
  bool get cpuIsHigh => cpuTotal > 80;
  double get cpuAppPercentOfTotal =>
      cpuTotal > 0 ? (cpuApp ?? 0) / cpuTotal * 100 : 0;
}
