import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/feature/device/application/device_service.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/presentation/knob/thermostat_knob.dart';
import 'package:smart_dash/feature/device/presentation/tile/switch_onoff_list_tile.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';
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
  @override
  Widget build(BuildContext context) {
    final service = ref.read(deviceServiceProvider);
    final id = Identity.fromToken(widget.thermostat.value);
    return FutureBuilder<Optional<Device>>(
      future: service.get(id),
      initialData: service.getCached(id),
      builder: (context, snapshot) {
        final device = snapshot.data;
        return SmartDashTile(
          title: device?.orElseNull?.name ?? 'Thermostat',
          subTitle: widget.subTitle,
          constraints: const BoxConstraints(
            maxWidth: 270,
            minWidth: 270,
            minHeight: 180,
          ).normalize(),
          leading: const Icon(
            CupertinoIcons.thermometer,
            color: Colors.lightGreen,
          ),
          trailing: Text(
            device?.orElseNull?.temperature?.toTemperature() ?? '0',
            style: const TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
          body: device != null
              ? Column(
                  children: [
                    ThermostatKnob(
                      device: device,
                    ),
                    SwitchOnOffButton(
                      device: device.value,
                      onSelected: (mode) async => (false, mode),
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
}
