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
                  children: devices.map((e) => _buildListTile(e)).toList(),
                ),
        );
      },
    );
  }

  Widget _buildListTile(Device device) {
    return SwitchOnOffTile(
      device: device,
      enabled: true,
      onSelected: (newMode) => Future.value(false),
    );
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
    return ListTile(
      leading: Icon(toIconData(widget.device)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.device.name),
          if (widget.device.onOff!.state)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.device.hasPower)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      (widget.device.electric?.estimatedPower ?? 0).toPower(),
                      style: legendTextStyle,
                      textScaler: const TextScaler.linear(1.2),
                    ),
                  ),
                const Icon(Icons.electric_bolt),
              ],
            ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 220,
            child: SegmentedButton<SwitchMode>(
              showSelectedIcon: true,
              emptySelectionAllowed: false,
              multiSelectionEnabled: false,
              selected: _segmentedButtonSelection,
              // Disable segments when selection is ongoing
              onSelectionChanged: _enabled ? _onSelectionChanged : null,
              segments: _modes().map((SwitchMode mode) {
                return ButtonSegment<SwitchMode>(
                  value: mode,
                  label: Text(mode.name),
                );
              }).toList(),
            ),
          ),
          if (!_enabled && widget.enabled)
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: SizedBox(
                width: 190,
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
      _enabled = await widget.onSelected(newSelection.first);
      if (_enabled && mounted) {
        setState(() {
          _segmentedButtonSelection = newSelection;
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
