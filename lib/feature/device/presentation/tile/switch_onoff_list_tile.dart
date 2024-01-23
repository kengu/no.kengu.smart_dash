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
        devices.sort((a, b) => a.name.compareTo(b.name));
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
              : ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: devices
                      .map(
                        (device) => SwitchOnOffTile(
                          device: device,
                          enabled: true,
                          onSelected: (newMode) => _apply(device, newMode),
                        ),
                      )
                      .toList(),
                ),
        );
      },
    );
  }

  Future<bool> _apply(Device device, SwitchMode newMode) async {
    final result = await ref
        .read(deviceServiceProvider)
        .set(device.copyWith(onOff: device.onOff!.copyWith(mode: newMode)));
    return result.isPresent;
  }
}

class SwitchOnOffTile extends StatefulWidget {
  const SwitchOnOffTile({
    super.key,
    required this.device,
    required this.onSelected,
    this.enabled = true,
  });

  final Device device;

  final bool enabled;

  final Future<bool> Function(SwitchMode newMode) onSelected;

  @override
  State<SwitchOnOffTile> createState() => _SwitchOnOffTileState();
}

class _SwitchOnOffTileState extends State<SwitchOnOffTile> {
  bool _enabled = true;
  bool _errorState = false;
  Set<SwitchMode> _segmentedButtonSelection = {};

  @override
  void initState() {
    _setMode();
    _enabled = widget.enabled;
    super.initState();
  }

  Set<SwitchMode> _setMode() {
    return _segmentedButtonSelection = {widget.device.onOff!.mode};
  }

  @override
  void didUpdateWidget(covariant SwitchOnOffTile oldWidget) {
    if (oldWidget.device != widget.device) {
      _setMode();
    }
    if (oldWidget.enabled != widget.enabled) {
      _enabled = widget.enabled;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final legendTextStyle = getLegendTextStyle(context);
    final titleTextStyle = Theme.of(context).textTheme.labelSmall;

    return ListTile(
      leading: Icon(toIconData(widget.device)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.device.name,
            style: titleTextStyle,
          ),
          if (widget.device.onOff!.state)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.device.hasPower)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      (widget.device.electric
                              ?.getEstimatedPower(false)
                              ?.toPower() ??
                          '-'),
                      style: legendTextStyle,
                    ),
                  ),
                const Icon(Icons.electric_bolt, size: 16),
              ],
            ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 170,
            child: SegmentedButton<SwitchMode>(
              showSelectedIcon: false,
              emptySelectionAllowed: false,
              multiSelectionEnabled: false,
              selected: _segmentedButtonSelection,
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
              segments: _modes().map((SwitchMode mode) {
                return ButtonSegment<SwitchMode>(
                  value: mode,
                  enabled: _enabled,
                  tooltip:
                      _errorState && _segmentedButtonSelection.contains(mode)
                          ? 'Unable to apply ${mode.name} mode'
                          : null,
                  label: Text(
                    mode.name,
                    textScaler: const TextScaler.linear(0.8),
                  ),
                );
              }).toList(),
            ),
          ),
          if (!_enabled && widget.enabled)
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
      ),
    );
  }

  void _onSelectionChanged(Set<SwitchMode> newSelection) {
    setState(() {
      _enabled = false;
      _segmentedButtonSelection = _setMode();
    });
    update() async {
      final success = await widget.onSelected(newSelection.first);
      if (mounted) {
        setState(() {
          _enabled = true;
          _errorState = !success;
          _segmentedButtonSelection = success ? newSelection : _setMode();
        });
      }
    }

    update();
  }

  List<SwitchMode> _modes() {
    return [
      widget.device.onOff!.offMode,
      widget.device.onOff!.onMode,
    ];
  }
}
