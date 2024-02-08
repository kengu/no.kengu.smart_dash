import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/feature/device/application/device_service.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/switch_state.dart';
import 'package:smart_dash/feature/device/presentation/utils.dart';
import 'package:smart_dash/util/data/units.dart';
import 'package:smart_dash/util/widget.dart';
import 'package:strings/strings.dart';

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
  final List<Device> _devices = [];
  final Map<Identity, SwitchMode> _updating = {};

  @override
  Widget build(BuildContext context) {
    final service = ref.read(deviceServiceProvider);
    return FutureBuilder<List<Device>>(
      future: service.where((e) => e.hasOnOff),
      initialData: service.whereCached((e) => e.hasOnOff).orElseNull,
      builder: (context, snapshot) {
        final devices = _set(snapshot);
        return SmartDashTile(
          title: widget.title,
          subTitle: widget.subtitle,
          constraints: BoxConstraints(
            minWidth: 270,
            minHeight: 180,
            maxWidth: (72.0 + 6) * devices.length,
          ).normalize(),
          leading: const Icon(
            CupertinoIcons.arrow_swap,
            color: Colors.lightGreen,
          ),
          trailing: Text(
            '${devices.length} switches',
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
              : ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    final device = devices[index];
                    return SwitchOnOffTile(
                      device: device,
                      enabled: true,
                      updating: _updating[Identity.of(device)],
                      onSelected: (newMode) => _apply(device, newMode),
                    );
                  },
                ),
        );
      },
    );
  }

  List<Device> _set(AsyncSnapshot<List<Device>> snapshot) {
    final devices =
        (snapshot.data?.isNotEmpty == true ? snapshot.data! : <Device>[]);
    devices.sort((a, b) => a.name.compareTo(b.name));
    _devices
      ..clear()
      ..addAll(devices);
    return _devices;
  }

  Future<(bool, SwitchMode)> _apply(Device device, SwitchMode newMode) async {
    final id = Identity.of(device);
    _updating[id] = newMode;
    final result = await ref
        .read(deviceServiceProvider)
        .update(device.setSwitchNode(newMode));
    _updating.remove(id);
    if (result.isPresent) {
      final id = Identity.of(device);
      final index = _devices.indexWhere((e) => Identity.of(e) == id);
      if (index > -1) {
        _devices[index] = result.value;
      }
      return (true, result.value.onOff!.mode);
    }
    return (false, device.onOff!.mode);
  }
}

class SwitchOnOffTile extends ConsumerStatefulWidget {
  const SwitchOnOffTile({
    super.key,
    required this.device,
    required this.onSelected,
    this.enabled = true,
    this.updating,
  });

  final bool enabled;
  final Device device;
  final SwitchMode? updating;

  final Future<(bool, SwitchMode)> Function(SwitchMode newMode) onSelected;

  @override
  ConsumerState<SwitchOnOffTile> createState() => _SwitchOnOffTileState();
}

class _SwitchOnOffTileState extends ConsumerState<SwitchOnOffTile> {
  @override
  Widget build(BuildContext context) {
    final legendTextStyle = getLegendTextStyle(context);
    final titleTextStyle = Theme.of(context).textTheme.labelSmall;

    return StreamBuilder<DeviceEvent>(
        stream: ref
            .watch(deviceServiceProvider)
            .stream
            .where((e) => e.isDevice(widget.device)),
        builder: (context, snapshot) {
          final device = snapshot.data?.device ?? widget.device;
          return ListTile(
            leading: Icon(toIconData(device)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  device.name,
                  style: titleTextStyle,
                ),
                if (device.onOff!.state)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (device.hasPower)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            device.electric?.getEstimatedPower()?.toPower() ??
                                '-',
                            style: legendTextStyle,
                          ),
                        ),
                      const Icon(Icons.electric_bolt, size: 16),
                    ],
                  ),
              ],
            ),
            trailing: SwitchOnOffButton(
              device: device,
              enabled: widget.enabled,
              updating: widget.updating,
              onSelected: widget.onSelected,
            ),
          );
        });
  }
}

class SwitchOnOffButton extends ConsumerStatefulWidget {
  const SwitchOnOffButton({
    super.key,
    required this.device,
    required this.onSelected,
    this.updating,
    this.enabled = true,
    this.showSelectedIcon = false,
  });

  final bool enabled;
  final Device device;
  final SwitchMode? updating;
  final bool showSelectedIcon;

  final Future<(bool, SwitchMode)> Function(SwitchMode newMode) onSelected;

  @override
  ConsumerState<SwitchOnOffButton> createState() => _SwitchOnOffButtonState();
}

class _SwitchOnOffButtonState extends ConsumerState<SwitchOnOffButton> {
  bool _updating = false;
  bool _errorState = false;
  Set<SwitchMode> _segmentedButtonSelection = {};

  @override
  void initState() {
    _setMode();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SwitchOnOffButton oldWidget) {
    if (!_updating &&
        oldWidget.device.getSwitchMode() != widget.device.getSwitchMode()) {
      _setMode();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: widget.showSelectedIcon ? 200 : 170,
          child: SegmentedButton<SwitchMode>(
            emptySelectionAllowed: false,
            multiSelectionEnabled: false,
            selected: _segmentedButtonSelection,
            showSelectedIcon: widget.showSelectedIcon,
            onSelectionChanged: _onSelectionChanged,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return null;
                }
                if (states.contains(MaterialState.selected)) {
                  return _errorState
                      ? Colors.red.withOpacity(0.6)
                      : Theme.of(context).colorScheme.secondaryContainer;
                }
                return null;
              }),
            ),
            segments: _modes(widget.device).map((SwitchMode mode) {
              return ButtonSegment<SwitchMode>(
                value: mode,
                enabled: widget.enabled && !_updating,
                tooltip: _errorState && _segmentedButtonSelection.contains(mode)
                    ? 'Unable to apply ${mode.name} mode'
                    : null,
                label: Text(
                  mode.name.toCapitalised(),
                  textScaler: const TextScaler.linear(0.8),
                ),
              );
            }).toList(),
          ),
        ),
        if (_updating && widget.enabled)
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: SizedBox(
              width: 120,
              child: LinearProgressIndicator(
                minHeight: 1,
                color: Colors.lightGreen.withOpacity(0.6),
              ),
            ),
          ),
      ],
    );
  }

  Set<SwitchMode> _setMode() {
    return _segmentedButtonSelection = {
      widget.updating ?? widget.device.onOff!.mode
    };
  }

  void _onSelectionChanged(Set<SwitchMode> newSelection) {
    setState(() {
      _updating = true;
    });
    update() async {
      final current = _segmentedButtonSelection.first;
      final (success, mode) = await widget.onSelected(newSelection.first);
      if (mounted) {
        setState(() {
          _updating = false;
          _errorState = !success;
          _segmentedButtonSelection = {success ? mode : current};
        });
      }
    }

    update();
  }

  List<SwitchMode> _modes(Device device) {
    return [
      device.onOff!.offMode,
      device.onOff!.onMode,
    ];
  }
}
