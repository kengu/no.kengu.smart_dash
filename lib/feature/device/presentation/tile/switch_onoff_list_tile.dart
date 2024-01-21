import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/feature/device/application/device_service.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/presentation/utils.dart';
import 'package:smart_dash/util/widget.dart';

class SwitchOnOffListTile extends ConsumerStatefulWidget {
  const SwitchOnOffListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.duration,
  });

  final String title;
  final String subtitle;
  final Duration duration;

  @override
  ConsumerState<SwitchOnOffListTile> createState() =>
      _SwitchOnOffListTileListTileState();
}

class _SwitchOnOffListTileListTileState
    extends ConsumerState<SwitchOnOffListTile> {
  @override
  Widget build(BuildContext context) {
    final service = ref.read(deviceServiceProvider);
    return FutureBuilder<List<Device>>(
      future: service.where((e) => e.hasOnOff),
      initialData: service.whereCached((e) => e.hasOnOff).orElseNull,
      builder: (context, snapshot) {
        final devices =
            (snapshot.data?.isNotEmpty == true ? snapshot.data! : <Device>[]);
        final values = devices.map((e) => (e.onOff!.state ? 1 : 0)).toList();

        return SmartDashTile(
          title: widget.title,
          subTitle: widget.subtitle,
          constraints: BoxConstraints(
            minWidth: 270,
            minHeight: 180,
            maxWidth: (72.0 + 6) * values.length,
          ).normalize(),
          leading: const Icon(
            CupertinoIcons.arrow_swap,
            color: Colors.lightGreen,
          ),
          trailing: Text(
            '${values.length} switches',
            style: const TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
          body: devices.isEmpty
              ? Stack(
                  children: [
                    Center(
                      child: Text(
                        'No data',
                        style: getLegendTextStyle(context),
                      ),
                    ),
                  ],
                )
              : ListView(
                  children: devices
                      .map((e) => ListTile(
                            leading: Icon(toIconData(e)),
                            title: Text(e.name),
                            trailing: Text('State is ${e.onOff!.mode.name}'),
                          ))
                      .toList(),
                ),
        );
      },
    );
  }
}
