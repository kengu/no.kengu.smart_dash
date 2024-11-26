import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:optional/optional_internal.dart';
import 'package:smart_dash_app/core/presentation/screens.dart';
import 'package:smart_dash_app/core/presentation/widget/list/multi_selector.dart';
import 'package:smart_dash_app/core/presentation/widget/load/async_load_screen.dart';
import 'package:smart_dash_app/feature/pairing/presentation/pair/new_devices_controller.dart';
import 'package:smart_dash_device/smart_dash_device.dart';

class NewDevicesScreen extends ConsumerStatefulWidget {
  const NewDevicesScreen({
    super.key,
    required this.type,
    required this.serviceKey,
  });

  final DeviceType type;
  final String serviceKey;

  @override
  ConsumerState<NewDevicesScreen> createState() => _NewDevicesScreenState();
}

class _NewDevicesScreenState extends ConsumerState<NewDevicesScreen> {
  final List<bool> _selected = [];
  final List<Device> _devices = [];

  bool _isLoading = true;

  late NewDevicesQuery query = NewDevicesQuery(
    type: widget.type,
    serviceKey: widget.serviceKey,
  );

  void _set(Optional<List<Device>> data) {
    if (data.isPresent && _selected.isEmpty) {
      if (data.value.isNotEmpty) {
        _devices.addAll(data.value);
        _selected.addAll(List.generate(
          data.value.length,
          (_) => false,
        ));
      }
      if (_isLoading) {
        _isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AsyncLoadScreen<NewDevicesQuery, List<Device>,
        NewDevicesScreenController>(
      title: _buildTitle(),
      query: query,
      actions: [
        ElevatedButton(
          onPressed: _selected.where((value) => value).isNotEmpty
              ? () => _onAddDevices(context)
              : null,
          child: const Icon(Icons.check),
        )
      ],
      onClose: () => context.pop(),
      provider: newDevicesScreenControllerProvider.call,
      builder: (context, ref, data, child) {
        _set(data);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(_buildDescription()),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 1,
              child: MultiSelectorList<Device>(
                selected: _selected,
                entries: data.isPresent ? data.value : [],
                titleBuilder: (_, device, __) => Text(
                  '${device.name} (id: ${device.id})',
                ),
                onChanged: (index, value) {
                  _selected[index] = value;
                  setState(() {});
                },
              ),
            ),
          ],
        );
      },
    );
  }

  String _buildDescription() {
    if (_isLoading) {
      return 'SmartDash is looking for new devices not paired already.';
    }
    return _devices.isEmpty
        ? 'SmartDash did not find any new devices to pair with.'
        : 'SmartDash found ${_devices.length} devices '
            'available for pairing.';
  }

  String _buildTitle() {
    if (_isLoading) {
      return 'Searching';
    }
    return _devices.isEmpty ? 'No devices found' : 'New devices found';
  }

  void _onAddDevices(BuildContext context) {
    final service = ref.read(deviceManagerProvider).getDriver(
          widget.serviceKey,
        );

    service.pairAll(_devices
        .where((device) => _selected[_devices.indexOf(device)])
        .toList());

    context.push(Screens.pairing);
  }
}
