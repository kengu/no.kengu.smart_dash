import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_app/core/presentation/widget/smart_knob.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:strings/strings.dart';

class ThermostatKnob extends ConsumerStatefulWidget {
  const ThermostatKnob({
    super.key,
    this.updating,
    this.enabled = true,
    this.minValue = 5.0,
    this.maxValue = 25.0,
    required this.onValueChanged,
    this.device = const Optional.empty(),
  });

  final bool enabled;
  final double minValue;
  final double maxValue;
  final double? updating;
  final Optional<Device> device;
  final Future<(bool, double)> Function(double newValue) onValueChanged;

  @override
  ConsumerState<ThermostatKnob> createState() => _ThermostatKnobState();
}

class _ThermostatKnobState extends ConsumerState<ThermostatKnob> {
  double _target = 0.0;
  bool _updating = false;
  bool _errorState = false;

  @override
  void initState() {
    _updating = widget.updating != null;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ThermostatKnob oldWidget) {
    if (widget.updating != oldWidget.updating) {
      _updating = widget.updating != null;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DeviceEvent>(
        stream: ref.watch(deviceServiceProvider).deviceEvents.where(
            (e) => widget.device.isPresent && e.isDevice(widget.device.value)),
        builder: (context, snapshot) {
          final device = _set(snapshot);
          final mode = device?.onOff?.mode;
          final enabled = widget.enabled && mode != SwitchMode.off;
          final actual = device?.temperature ?? 0;
          final thermostat = device?.thermostat;
          final values = [if (enabled) actual];
          return SmartKnob(
            value: _target,
            enabled: enabled,
            minValue: thermostat?.temperatureMin ?? widget.minValue,
            maxValue: thermostat?.temperatureMax ?? widget.maxValue,
            updating: _updating,
            onValueChanged: _onValueUpdated,
            knobColor: _errorState ? Colors.red : null,
            sections: [
              if (enabled)
                SmartKnobSectionData(
                  value: actual,
                  color: Colors.red,
                )
            ],
            tickLabelBuilder: (index, count, value) =>
                values.contains(index + widget.minValue)
                    ? (index + widget.minValue).toTemperature()
                    : '',
            valueBuilder: (value) {
              return Tooltip(
                message:
                    _errorState ? 'Unable to apply target temperature' : '',
                child: enabled
                    ? _buildValue(value, device)
                    : Center(
                        child: Text(SwitchMode.off.name.toCapitalised()),
                      ),
              );
            },
          );
        });
  }

  Column _buildValue(double value, Device? device) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox.square(dimension: 24),
        Text(
          value.toTemperature(),
          style: TextStyle(
            color: _errorState ? Colors.red : Colors.white70,
          ),
          textScaler: const TextScaler.linear(1.4),
        ),
        if (device?.onOff?.state == true)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.electric_bolt,
                  size: 16,
                  color: Colors.white38,
                ),
                const SizedBox.square(dimension: 4),
                Text(
                  device?.electric?.getEstimatedPower()?.toPower() ?? '-',
                  textScaler: const TextScaler.linear(0.8),
                ),
              ],
            ),
          )
        else
          const SizedBox.square(dimension: 24)
      ],
    );
  }

  Device? _set(AsyncSnapshot<DeviceEvent> snapshot) {
    final device = snapshot.data?.device ?? widget.device.orElseNull;
    if (!_updating) {
      _target = device?.getTargetTemperature() ?? 0.0;
    }
    return device;
  }

  Future<void> _onValueUpdated(value) async {
    setState(() {
      _target = value;
      _updating = true;
    });
    update() async {
      final (success, target) = await widget.onValueChanged(value);
      if (mounted) {
        setState(() {
          _target = target;
          _updating = false;
          _errorState = !success;
        });
      }
    }

    update();
  }
}
