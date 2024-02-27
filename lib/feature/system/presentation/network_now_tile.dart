import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/system/application/network_info_service.dart';
import 'package:smart_dash/feature/system/domain/network_info.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:strings/strings.dart';
import 'package:timeago/timeago.dart';

class NetworkNowTile extends ConsumerStatefulWidget {
  const NetworkNowTile({
    super.key,
    this.isOnline = true,
    this.isOffline = false,
    this.sortByField = 'hostId',
  });

  final bool isOnline;
  final bool isOffline;
  final String sortByField;

  static const constraints = BoxConstraints(
    minWidth: 270,
    minHeight: 180,
  );

  @override
  ConsumerState<NetworkNowTile> createState() => _NetworkNowTileState();
}

class _NetworkNowTileState extends ConsumerState<NetworkNowTile> {
  @override
  Widget build(BuildContext context) {
    final network = ref.watch(networkInfoServiceProvider);
    return StreamBuilder<List<NetworkDeviceInfo>>(
        stream: network.states,
        initialData: network.devices,
        builder: (_, snapshot) {
          final devices = _where(snapshot);
          final lastUpdated = network.lastUpdated;
          final child = ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: devices.length,
            itemBuilder: (context, index) {
              final e = devices[index];
              return ListTile(
                  dense: true,
                  horizontalTitleGap: 24,
                  title: Text(e.readableName),
                  leading: Icon(
                    e.isAvailable ? Icons.devices_other : Icons.device_unknown,
                  ),
                  subtitle: Text(
                    '${e.ipAddress} (${e.macAddress})',
                  ));
            },
          );
          return SmartDashTile(
            title: 'Network Now',
            subtitle: network.isEnabled
                ? (lastUpdated.isPresent
                    ? 'Last updated ${format(lastUpdated.value)}'
                    : 'Last update unknown')
                : 'Presence is disabled',
            constraints: NetworkNowTile.constraints,
            leading: const Icon(
              Icons.network_check,
              color: Colors.lightGreen,
            ),
            trailing: Text(
              '${devices.length} devices',
              style: const TextStyle(
                color: Colors.lightGreen,
                fontWeight: FontWeight.bold,
              ),
              textScaler: const TextScaler.linear(1.2),
            ),
            body: StreamBuilder<NetworkScanProgress>(
              stream: network.progress,
              initialData: network.getProgress(),
              builder: (context, snapshot) {
                final e = snapshot.data!;
                return e.inProgress
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LinearProgressIndicator(
                            minHeight: 1,
                            value: e.value / 100,
                            color: Colors.lightGreen.withOpacity(0.6),
                          ),
                          Expanded(
                            flex: 30,
                            child: child,
                          ),
                        ],
                      )
                    : child;
              },
            ),
          );
        });
  }

  List<NetworkDeviceInfo> _where(
      AsyncSnapshot<List<NetworkDeviceInfo>> snapshot) {
    final devices = snapshot.data!;
    devices.sort((a, b) {
      switch (widget.sortByField) {
        case 'readableName':
          return a.readableName.compareTo(b.readableName);
        default:
          if (a.hostId.isNumeric() && b.hostId.isNumeric()) {
            return int.parse(a.hostId) - int.parse(b.hostId);
          }
          return a.hostId.compareTo(b.hostId);
      }
    });
    return devices
        .where((e) =>
            widget.isOnline && e.isAvailable ||
            widget.isOffline && !e.isAvailable)
        .toList();
  }
}
