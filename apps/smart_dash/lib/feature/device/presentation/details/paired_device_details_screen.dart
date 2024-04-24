import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_screen.dart';
import 'package:smart_dash/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash/feature/device/data/device_repository.dart';
import 'package:smart_dash/feature/device/domain/device.dart';

import 'paired_device_details_controller.dart';

class PairedDeviceDetailsScreen extends ConsumerStatefulWidget {
  const PairedDeviceDetailsScreen({
    super.key,
    required this.identity,
  });

  final Identity identity;

  @override
  ConsumerState<PairedDeviceDetailsScreen> createState() =>
      _PairedDeviceDetailsScreenState();
}

class _PairedDeviceDetailsScreenState
    extends ConsumerState<PairedDeviceDetailsScreen> {
  bool _undeleteable = false;

  @override
  Widget build(BuildContext context) {
    return AsyncLoadScreen<PairedDeviceDetailsQuery, Device,
        PairedDeviceDetailsScreenController>(
      title: 'Paired device',
      onClose: () => context.pop(),
      query: PairedDeviceDetailsQuery(widget.identity),
      provider: pairedDeviceDetailsScreenControllerProvider.call,
      actions: [
        if (_undeleteable)
          const ElevatedButton(
            onPressed: null,
            child: Tooltip(
              message: 'Unable to unpair',
              child: Icon(Icons.delete),
            ),
          )
        else
          ElevatedButton(
            onPressed: () async {
              final unpaired = await _unpair(context);
              if (unpaired) {
                setState(() {
                  context.pop();
                });
              }
            },
            child: const Tooltip(
              message: 'Unpair device',
              child: Icon(Icons.delete),
            ),
          )
      ],
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
                          device.value.data,
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

  Future<bool> _unpair(BuildContext context) async {
    final unpair = await showDialog(
      context: context,
      useRootNavigator: true,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: const Text('Unpair Device'),
        content: const Text(
          'This will unpair the device. Do you want to proceed?',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('NO'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('YES'),
          ),
        ],
      ),
    );
    if (unpair) {
      final result = await ref.read(deviceRepositoryProvider).get(
            widget.identity,
          );
      if (result.isPresent) {
        final device = result.value;
        final driver = ref.read(deviceDriverManagerProvider).getDriver(
              device.service,
            );
        final unpaired = await driver.unpairAll([device]);
        return unpaired.contains(device);
      }
      _undeleteable = true;
    }
    return false;
  }
}
