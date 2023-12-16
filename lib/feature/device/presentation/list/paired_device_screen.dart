import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/presentation/device_routes.dart';
import 'package:smart_dash/widget/load/async_load_screen.dart';
import 'package:smart_dash/widget/list/route_selector.dart';

import 'paired_device_controller.dart';

class PairedDeviceScreen extends ConsumerWidget {
  const PairedDeviceScreen({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncLoadScreen<PairedDeviceQuery, List<Device>>(
      title: 'Paired devices',
      onClose: () => context.go(location),
      query: PairedDeviceQuery(),
      provider: pairedDeviceScreenControllerProvider,
      builder: (context, ref, data, child) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('These devices are paired with SmartDash.'),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 1,
              child: RouteSelectorList<Device>(
                titleBuilder: (_, data, __) => Text(data.name),
                iconBuilder: (_, data, __) => const Icon(Icons.device_hub),
                entries: data.isPresent ? data.value : [],
                pathBuilder: (data) => DeviceScreens.toDevicesDetailsPath(
                  data,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
