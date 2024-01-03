import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/system/application/system_info_service.dart';
import 'package:smart_dash/feature/system/model/system_info.dart';
import 'package:smart_dash/widget/tile/smart_dash_tile.dart';
import 'package:timeago/timeago.dart';

import 'cpu_pie_chart.dart';
import 'mem_pie_chart.dart';

class SystemNowTile extends ConsumerStatefulWidget {
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
  ConsumerState<SystemNowTile> createState() => _SystemNowTileState();
}

class _SystemNowTileState extends ConsumerState<SystemNowTile> {
  @override
  Widget build(BuildContext context) {
    final service = ref.watch(systemInfoServiceProvider);
    return StreamBuilder<String>(
      stream: service.getChargingEvents(),
      builder: (context, event) {
        return FutureBuilder<SystemInfo>(
            initialData: service.lastInfo.orElseNull,
            future: service.getSystemInfo(widget.period),
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
                subTitle: service.lastUpdated.isPresent
                    ? 'Last updated ${format(service.lastUpdated.value)}'
                    : '',
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
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: usage != null
                      ? [
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 160,
                              maxHeight: 160,
                            ),
                            child: CpuPieChart(
                              key: const GlobalObjectKey('cpu_pie'),
                              info: usage,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 160,
                              maxHeight: 160,
                            ),
                            child: MemPieChart(
                              key: const GlobalObjectKey('mem_pie'),
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
