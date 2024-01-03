class SystemInfo {
  SystemInfo({
    required this.cpuApp,
    required this.cpuTotal,
    required this.memApp,
    required this.memFree,
    required this.memTotal,
    required this.memIsLow,
    required this.batteryLevel,
  });
  final int memApp;
  final int memFree;
  final int memTotal;
  final bool memIsLow;
  final double? cpuApp;
  final double cpuTotal;
  final double batteryLevel;

  int get memUsed => memTotal - memFree;
  int get memPressure =>
      memTotal > 0 ? ((memTotal - memFree) / memTotal * 100).round() : 0;
  bool get isAppUsage => cpuApp == cpuTotal;
}
