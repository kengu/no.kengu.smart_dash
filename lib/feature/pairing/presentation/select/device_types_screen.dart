import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/feature/pairing/presentation/paring_routes.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_screen.dart';
import 'package:smart_dash/core/presentation/widget/list/route_selector.dart';

import 'device_types_controller.dart';

class DeviceTypesScreen extends ConsumerWidget {
  const DeviceTypesScreen({
    super.key,
    required this.location,
    required this.serviceKey,
  });

  final String location;
  final String serviceKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncLoadScreen<DeviceTypesQuery, List<DeviceDefinition>>(
      title: 'Device types',
      onClose: () => context.go(location),
      query: DeviceTypesQuery(serviceKey),
      provider: deviceTypesScreenControllerProvider,
      builder: (context, ref, data, child) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Choose type of device to pair with. '
                    'Devices that have already been paired with Smart Dash '
                    'will automatically be filtered out.'),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 1,
              child: RouteSelectorList<DeviceDefinition>(
                titleBuilder: (_, data, __) => Text(data.name),
                entries: data.isPresent ? data.value : [],
                pathBuilder: (data) => PairingScreens.toListNewDevicesPath(
                  serviceKey,
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
