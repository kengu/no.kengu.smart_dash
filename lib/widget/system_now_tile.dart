import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optional/optional.dart';
import 'package:pretty_bytes/pretty_bytes.dart';
import 'package:smart_dash/scaffold/presentation/app/smart_dash_app_theme_data.dart';
import 'package:smart_dash/util/widget.dart';
import 'package:smart_dash/widget/tile/smart_dash_tile.dart';
import 'package:timeago/timeago.dart';

class SystemNowTile extends StatefulWidget {
  const SystemNowTile({
    super.key,
    this.period = const Duration(seconds: 10),
  });

  final Duration period;

  static const constraints = BoxConstraints(
    minWidth: 270,
    minHeight: 180,
  );

  @override
  State<SystemNowTile> createState() => _SystemNowTileState();
}

class _SystemNowTileState extends State<SystemNowTile> {
  static const load = MethodChannel('no.kengu.smart_dash/load');
  static const battery = MethodChannel('no.kengu.smart_dash/battery');
  static const charging = EventChannel('no.kengu.smart_dash/charging');

  Optional<(DateTime, Future<SystemInfo>)> _request = const Optional.empty();

  Future<SystemInfo> _getSystemInfo() async {
    if (_request.isEmpty ||
        DateTime.now().difference(_request.value.$1) > widget.period) {
      info() async {
        final mem = await _getMemUsage();
        final cpu = await _getCpuUsage();
        return SystemInfo(
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
      final usage = await load.invokeMethod('getCpuUsage');
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
      final usage = await load.invokeMethod('getMemoryUsage');
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
      final level = await battery.invokeMethod('getBatteryLevel');
      return (level as int).toDouble();
    } on Exception catch (e) {
      debugPrint(e.toString());
      return 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: charging.receiveBroadcastStream(),
      builder: (context, event) {
        final isCharging = (event.data == 'charging');
        return FutureBuilder<SystemInfo>(
            future: _getSystemInfo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const SmartDashTile(
                  title: 'System Now',
                  subTitle: 'Loading...',
                  constraints: SystemNowTile.constraints,
                  leading: Icon(
                    Icons.computer_outlined,
                    color: Colors.lightGreen,
                  ),
                  trailing: Text(
                    '- %',
                    style: TextStyle(
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaler: TextScaler.linear(1.2),
                  ),
                  body: Center(
                    child: CircularProgressIndicator(
                      color: Colors.lightGreen,
                    ),
                  ),
                );
              }
              final usage = snapshot.data;
              final memIsLow = usage?.memIsLow == true;
              return SmartDashTile(
                title: 'System Now',
                subTitle: 'Last updated ${format(_request.value.$1)}',
                constraints: SystemNowTile.constraints,
                leading: const Icon(
                  Icons.computer_outlined,
                  color: Colors.lightGreen,
                ),
                trailing: Text(
                  memIsLow ? 'Unhealthy' : 'Healthy',
                  style: TextStyle(
                    color: memIsLow ? Colors.deepOrange : Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaler: const TextScaler.linear(1.2),
                ),
                body: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: usage != null
                      ? [
                          /*
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Text(
                            'CPU load total: ${usage.cpuTotal.round()} %',
                          ),
                          if (!usage.isAppUsage)
                            Text(
                              'CPU load app: ${usage.cpuApp?.round()} %',
                            ),
                              Text(
                                'Memory pressure: '
                                '${usage.memPressure} % ('
                                '${prettyBytes(usage.memFree.toDouble(), binary: false)} / '
                                '${prettyBytes(usage.memTotal.toDouble(), binary: false)})',
                              ),
                              if (usage.memApp > 0)
                                Text(
                                  'App memory: '
                                  '${prettyBytes(usage.memApp.toDouble(), binary: false)}',
                                ),
                              Text(
                                'Memory is ${usage.memIsLow ? 'low' : 'healthy'}',
                              ),
                              Text(
                                'Battery is '
                                '${isCharging ? 'charging' : 'discharging'} '
                                '(${usage.batteryLevel.round()} %)',
                              ),
                            ],
                          ),
                           */
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 200,
                              maxHeight: 180,
                            ),
                            child: _CpuPieChart(
                              info: usage,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 200,
                              maxHeight: 180,
                            ),
                            child: _MemoryPieChart(
                              info: usage,
                            ),
                          ),
                        ]
                      : [const Text('No data')],
                ),
              );
            });
      },
    );
  }
}

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

class _MemoryPieChart extends StatelessWidget {
  const _MemoryPieChart({
    super.key,
    required this.info,
    this.scale = 0.5,
    this.radius = 120,
  });

  final SystemInfo info;

  final double scale;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final circleColor = surfaceColor.lighten().withAlpha(120);
    final legendStyle = getLegendTextStyle(context);

    return Stack(
      children: [
        Center(
          child: Transform.scale(
            scale: scale,
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0, // No space between sections
                startDegreeOffset: -90,
                centerSpaceRadius: radius,
                centerSpaceColor: circleColor,
                // No space in the center
                sections: [
                  PieChartSectionData(
                    value: info.memUsed.toDouble(), // Used memory
                    showTitle: false,
                    radius: 50,
                    color: Colors.lightGreen.withOpacity(0.6),
                  ),
                  PieChartSectionData(
                    value: info.memFree.toDouble(), // Available memory
                    showTitle: false,
                    color: circleColor,
                  )
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                prettyBytes(info.memFree.toDouble(), binary: false),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                textScaler: const TextScaler.linear(
                  1.3,
                ),
              ),
              Text(
                'of ${prettyBytes(info.memTotal.toDouble(), binary: false)} available',
                style: legendStyle,
                textScaler: const TextScaler.linear(
                  0.90,
                ),
              ),
              Text(
                'Memory is ${info.memIsLow ? 'low' : 'healthy'}',
                style: legendStyle,
                textScaler: const TextScaler.linear(
                  0.90,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CpuPieChart extends StatelessWidget {
  const _CpuPieChart({
    super.key,
    required this.info,
    this.scale = 0.5,
    this.radius = 120,
  });

  final SystemInfo info;

  final double scale;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final circleColor = surfaceColor.lighten().withAlpha(120);
    final legendStyle = getLegendTextStyle(context);

    return Stack(
      children: [
        Center(
          child: Transform.scale(
            scale: scale,
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0, // No space between sections
                startDegreeOffset: -90,
                centerSpaceRadius: radius,
                centerSpaceColor: circleColor,
                // No space in the center
                sections: [
                  PieChartSectionData(
                    value: info.cpuTotal, // Total load
                    showTitle: false,
                    radius: 50,
                    color: Colors.lightGreen.withOpacity(0.6),
                  ),
                  PieChartSectionData(
                    value: 100 - info.cpuTotal, // Available memory
                    showTitle: false,
                    color: circleColor,
                  )
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${info.cpuTotal.toStringAsFixed(1) ?? 0} %',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                textScaler: const TextScaler.linear(
                  1.3,
                ),
              ),
              Text(
                'total CPU load',
                style: legendStyle,
                textScaler: const TextScaler.linear(
                  0.90,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
