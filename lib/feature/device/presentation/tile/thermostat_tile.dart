import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/feature/device/application/device_service.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/switch_state.dart';
import 'package:smart_dash/feature/device/presentation/knob/thermostat_knob.dart';
import 'package:smart_dash/feature/device/presentation/tile/switch_onoff_list_tile.dart';
import 'package:smart_dash/util/data/units.dart';
import 'package:smart_dash/util/widget.dart';

class ThermostatTile extends ConsumerStatefulWidget {
  const ThermostatTile({
    super.key,
    required this.subTitle,
    required this.thermostat,
  });

  final String subTitle;
  final Optional<Token> thermostat;

  @override
  ConsumerState<ThermostatTile> createState() => _ThermostatTileState();
}

class _ThermostatTileState extends ConsumerState<ThermostatTile> {
  Optional<Device> _device = const Optional.empty();
  Optional<Device> _updating = const Optional.empty();

  @override
  Widget build(BuildContext context) {
    final service = ref.read(deviceServiceProvider);
    final id = Identity.fromToken(widget.thermostat.value);
    return FutureBuilder<Optional<Device>>(
      future: service.get(id),
      initialData: service.getCached(id),
      builder: (context, snapshot) {
        final device = _set(snapshot);
        return SmartDashTile(
          title: device.orElseNull?.name ?? 'Thermostat',
          subtitle: widget.subTitle,
          constraints: const BoxConstraints(
            maxWidth: 330,
            minWidth: 330,
          ).normalize(),
          leading: const Icon(
            CupertinoIcons.thermometer,
            color: Colors.lightGreen,
          ),
          trailing: Text(
            device.orElseNull?.temperature?.toTemperature() ?? '0',
            style: const TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
          body: device.isPresent
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ThermostatKnob(
                      device: device,
                      enabled: device.isPresent,
                      updating: _updating.orElseNull?.getTargetTemperature(),
                      onValueChanged: (newValue) => _applyTarget(
                        device.value,
                        newValue,
                      ),
                    ),
                    const SizedBox.square(
                      dimension: 24,
                    ),
                    SwitchOnOffButton(
                      device: device.value,
                      showSelectedIcon: true,
                      enabled: device.isPresent && !_updating.isPresent,
                      updating: _updating.orElseNull?.onOff?.mode,
                      onSelected: (newMode) => _applyMode(
                        device.value,
                        newMode,
                      ),
                    )
                  ],
                )
              : Stack(
                  children: [
                    Center(
                      child: Text(
                        'No data',
                        style: getLegendTextStyle(context),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Optional<Device> _set(AsyncSnapshot<Optional<Device>> snapshot) {
    return _device = snapshot.hasData ? snapshot.data! : const Optional.empty();
  }

  Future<(bool, SwitchMode)> _applyMode(
      Device device, SwitchMode newMode) async {
    final next = (_updating.orElseNull ?? device).setSwitchNode(
      newMode,
    );
    setState(() {
      _updating = Optional.of(next);
    });
    _device = await ref.read(deviceServiceProvider).update(next);
    if (mounted) {
      setState(() {
        _updating = const Optional.empty();
      });
    }
    return (
      _device.isPresent,
      _device.isPresent ? _device.value.onOff!.mode : device.onOff!.mode,
    );
  }

  Future<(bool, double)> _applyTarget(Device device, double newValue) async {
    final next = (_updating.orElseNull ?? device).setTargetTemperature(
      newValue,
    );
    setState(() {
      _updating = Optional.of(next);
    });
    _device = await ref.read(deviceServiceProvider).update(next);
    if (mounted) {
      setState(() {
        _updating = const Optional.empty();
      });
    }
    return (
      _device.isPresent,
      (_device.orElseNull ?? device).getTargetTemperature()!,
    );
  }
}
