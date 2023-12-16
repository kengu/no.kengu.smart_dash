import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/widget/load/async_load_screen.dart';
import 'package:flutter_json_view/flutter_json_view.dart';

import 'paired_device_details_controller.dart';

class PairedDeviceDetailsScreen extends ConsumerWidget {
  const PairedDeviceDetailsScreen({
    super.key,
    required this.deviceId,
    required this.location,
  });

  final String deviceId;
  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncLoadScreen<PairedDeviceDetailsQuery, Device>(
      title: 'Paired device',
      onClose: () => context.go(location),
      query: PairedDeviceDetailsQuery(deviceId),
      provider: pairedDeviceDetailsScreenControllerProvider,
      builder: (context, ref, device, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('This devices have the following properties.'),
                ),
              ),
              const Divider(),
              Column(
                children: [
                  Text(device.isPresent ? 'Id: ${device.value.id}' : 'Loading'),
                  Text(device.isPresent
                      ? 'Name: ${device.value.name}'
                      : 'Loading'),
                  Text(device.isPresent
                      ? 'Type: ${device.value.type}'
                      : 'Loading'),
                  Text(device.isPresent
                      ? 'Energy: ${device.value.hasEnergy}'
                      : 'Loading'),
                  device.isPresent
                      ? JsonView.map(
                          device.value.data['Properties'] as JsonObject,
                        )
                      : const Center(
                          child: Text('Loading'),
                        ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
