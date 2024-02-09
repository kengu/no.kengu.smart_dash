import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/system/application/network_info_service.dart';
import 'package:smart_dash/feature/system/domain/network_info.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:timeago/timeago.dart';

class NetworkNowTile extends ConsumerStatefulWidget {
  const NetworkNowTile({
    super.key,
  });

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
        initialData: network.devicesCached,
        builder: (_, snapshot) {
          final devices = snapshot.data!;
          final lastUpdated = network.lastUpdated;
          return SmartDashTile(
            title: 'Network Now',
            subTitle: lastUpdated.isPresent
                ? 'Last updated ${format(lastUpdated.value)}'
                : '',
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
            body: ListView(
              children: devices
                  .map((e) => ListTile(
                      title: Text(e.readableName),
                      subtitle: Text(
                        '${e.ipAddress} (${e.macAddress})',
                      )))
                  .toList(),
            ),
          );
        });
  }
}
