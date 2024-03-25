import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/presentation/device_routes.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_screen.dart';
import 'package:smart_dash/core/presentation/widget/list/route_selector.dart';
import 'package:smart_dash/feature/device/presentation/utils.dart';

import 'paired_devices_controller.dart';

class PairedDevicesScreen extends ConsumerWidget {
  const PairedDevicesScreen({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncLoadScreen<PairedDeviceQuery, List<Device>,
        PairedDevicesScreenController>(
      title: 'Paired devices',
      onClose: () => context.go(location),
      query: PairedDeviceQuery(),
      provider: pairedDevicesScreenControllerProvider.call,
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
                titleBuilder: (_, data, __) => Text(
                  '${data.name} (${data.service})',
                ),
                iconBuilder: (_, device, __) => Icon(
                  toIconData(device),
                ),
                entries: data.isPresent ? data.value : [],
                pathBuilder: (data) => DeviceScreens.toDeviceDetailsPath(
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
