import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/system/model/system_info.dart';

part 'system_info_service.g.dart';

class SystemInfoService {
  SystemInfoService(this.ref);

  final Ref ref;

  static const _loadChanel = MethodChannel('no.kengu.smart_dash/load');
  static const _batteryChannel = MethodChannel('no.kengu.smart_dash/battery');
  static const _chargingChannel = EventChannel('no.kengu.smart_dash/charging');

  Optional<DateTime> get lastUpdated => Optional.ofNullable(
        _request.orElseNull?.$1,
      );

  Optional<SystemInfo> get lastInfo => Optional.ofNullable(_lastInfo);
  SystemInfo? _lastInfo;

  Optional<(DateTime, Future<SystemInfo>)> _request = const Optional.empty();
  Stream<String> getChargingEvents() =>
      _chargingChannel.receiveBroadcastStream().map((e) => e.toString());

  Future<SystemInfo> getSystemInfo(Duration period) {
    if (_request.isEmpty ||
        DateTime.now().difference(_request.value.$1) > period) {
      info() async {
        final mem = await _getMemUsage();
        final cpu = await _getCpuUsage();
        return _lastInfo = SystemInfo(
          memApp: mem.$1,
          memFree: mem.$2,
          memTotal: mem.$3,
          memIsLow: mem.$4,
          cpuApp: cpu.$1,
          cpuTotal: cpu.$2,
          batteryLevel: await _getBatteryLevel(),
        );
      }

      _request = Optional.of(
        (
          DateTime.now(),
          info(),
        ),
      );
    }
    return _request.value.$2;
  }

  Future<(double?, double)> _getCpuUsage() async {
    try {
      final usage = await _loadChanel.invokeMethod('getCpuUsage');
      return (
        usage['app'] as double?,
        usage['total'] as double,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
      return (0.0, 0.0);
    }
  }

  Future<(int, int, int, bool)> _getMemUsage() async {
    try {
      final usage = await _loadChanel.invokeMethod('getMemoryUsage');
      return (
        (usage['app'] ?? 0) as int,
        usage['free'] as int,
        usage['total'] as int,
        (usage['lowMemory'] ?? false) as bool,
      );
    } catch (e) {
      debugPrint(e.toString());
      return (0, 0, 0, false);
    }
  }

  Future<double> _getBatteryLevel() async {
    try {
      final level = await _batteryChannel.invokeMethod('getBatteryLevel');
      return (level as int).toDouble();
    } on Exception catch (e) {
      debugPrint(e.toString());
      return 100;
    }
  }
}

class SystemInfoResult {
  SystemInfoResult(this.updated, this.info);
  final DateTime updated;
  final SystemInfo info;
}

@Riverpod(keepAlive: true)
SystemInfoService systemInfoService(SystemInfoServiceRef ref) =>
    SystemInfoService(ref);
