import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:optional/optional_internal.dart';
import 'package:smart_dash/constant/screens.dart';
import 'package:smart_dash/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/pairing/presentation/pair/new_devices_controller.dart';
import 'package:smart_dash/widget/list/multi_selector.dart';
import 'package:smart_dash/widget/load/async_load_screen.dart';

class NewDevicesScreen extends ConsumerStatefulWidget {
  const NewDevicesScreen({
    super.key,
    required this.location,
    required this.deviceType,
    required this.serviceKey,
  });

  final String location;
  final String deviceType;
  final String serviceKey;

  @override
  ConsumerState<NewDevicesScreen> createState() => _NewDevicesScreenState();
}

class _NewDevicesScreenState extends ConsumerState<NewDevicesScreen> {
  final List<bool> _selected = [];
  final List<Device> _devices = [];

  bool _isLoading = true;

  void _init(Optional<List<Device>> data, StateSetter setState) {
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
        rebuild();
      }
    }
  }

  Future<bool> rebuild() async {
    if (!mounted) return false;

    // if there's a current frame,
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      // wait for the end of that frame.
      await SchedulerBinding.instance.endOfFrame;
      if (!mounted) return false;
    }

    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AsyncLoadScreen<NewDevicesQuery, List<Device>>(
          title: _buildTitle(),
          query: NewDevicesQuery(
            deviceType: widget.deviceType,
            serviceKey: widget.serviceKey,
          ),
          actions: [
            ElevatedButton(
              onPressed: _selected.where((value) => value).isNotEmpty
                  ? () => _onAddDevices(context)
                  : null,
              child: const Icon(Icons.check),
            )
          ],
          onClose: () => context.go(widget.location),
          provider: newDevicesScreenControllerProvider,
          builder: (context, ref, data, child) {
            _init(data, setState);
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
    final service = ref.read(deviceDriverManagerProvider).getDriver(
          widget.serviceKey,
        );

    service.pairAll(_devices
        .where((device) => _selected[_devices.indexOf(device)])
        .toList());

    context.go(Screens.pairing);
  }
}
