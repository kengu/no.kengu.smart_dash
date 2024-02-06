import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/widget/smart_knob.dart';
import 'package:smart_dash/feature/device/application/device_service.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/switch_state.dart';
import 'package:smart_dash/util/data/units.dart';

class ThermostatKnob extends ConsumerStatefulWidget {
  const ThermostatKnob({
    super.key,
    this.updating,
    this.enabled = true,
    this.device = const Optional.empty(),
  });

  final bool enabled;
  final SwitchMode? updating;
  final Optional<Device> device;

  @override
  ConsumerState<ThermostatKnob> createState() => _ThermostatKnobState();
}

class _ThermostatKnobState extends ConsumerState<ThermostatKnob> {
  bool _updating = false;
  bool _errorState = false;

  @override
  Widget build(BuildContext context) {
    const eco = 5.0;
    const max = 25.0;
    const comfort = 21.0;
    return StreamBuilder<DeviceEvent>(
        stream: ref.watch(deviceServiceProvider).stream.where(
            (e) => widget.device.isPresent && e.isDevice(widget.device.value)),
        builder: (context, snapshot) {
          final device = snapshot.data?.device ?? widget.device.orElseNull;
          final enabled = widget.enabled || device != null;
          final actual = device?.temperature ?? 0;
          final thermostat = device?.thermostat;
          final mode = device?.onOff?.mode ?? SwitchMode.off;
          final target = switch (mode) {
            SwitchMode.on => actual,
            SwitchMode.antiFreeze => actual,
            SwitchMode.off => thermostat?.temperatureEco ?? 0.0,
            SwitchMode.eco => thermostat?.temperatureEco ?? eco,
            SwitchMode.comfort => thermostat?.temperatureComfort ?? comfort,
          };
          final values = [actual];
          return SmartKnob(
            value: target,
            minValue: eco,
            maxValue: max,
            onValueChanged: enabled ? _onUpdate : null,
            sections: [
              SmartKnobSectionData(
                value: actual,
                color: Colors.red,
              )
            ],
            tickLabelBuilder: (index, count, value) =>
                values.contains(index + eco)
                    ? (index + eco).toTemperature()
                    : '',
            valueBuilder: (value) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox.square(dimension: 24),
                  Text(
                    value.toTemperature(),
                    style: const TextStyle(color: Colors.white),
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
                            device?.electric?.getEstimatedPower()?.toPower() ??
                                '-',
                            textScaler: const TextScaler.linear(0.8),
                          ),
                        ],
                      ),
                    )
                  else
                    const SizedBox.square(dimension: 24)
                ],
              );
            },
          );
        });
  }

  Future<void> _onUpdate(value) async {
    debugPrint('target: $value');
  }
}
