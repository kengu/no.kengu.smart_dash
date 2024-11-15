import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash_app/core/presentation/widget/tile/barchart_tile.dart';
import 'package:smart_dash_app/feature/device/application/device_driver.dart';
import 'package:smart_dash_app/feature/device/application/device_service.dart';
import 'package:smart_dash_app/feature/device/domain/device.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:stream_transform/stream_transform.dart';

class TemperatureListTile extends ConsumerStatefulWidget {
  const TemperatureListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.duration,
  });

  final String title;
  final String subtitle;
  final Duration duration;

  @override
  ConsumerState<TemperatureListTile> createState() =>
      _TemperatureListTileState();
}

class _TemperatureListTileState extends ConsumerState<TemperatureListTile> {
  @override
  Widget build(BuildContext context) {
    //return Placeholder();
    final service = ref.read(deviceServiceProvider);
    return StreamBuilder<DriverDevicesEvent>(
      stream: service.drivers
          .whereType<DriverDevicesEvent>()
          .where((e) => e.devices.any((e) => e.hasTemperature)),
      builder: (context, snapshot) {
        final devices = _set(snapshot);
        final values = devices.map((e) => (e.temperature ?? 0)).toList();
        return BarChartTile<double>(
          title: widget.title,
          subtitle: widget.subtitle,
          icon: CupertinoIcons.thermometer,
          items: values,
          hideZeroValues: false,
          chartMargin: BarChartTile.defaultChartMargin.copyWith(bottom: 8.0),
          total: 'max ${values.max().toTemperature()}',
          axisLabelBuilder: (axisIndex) => values[axisIndex] < 3
              ? devices[axisIndex].name
              : '${axisIndex + 1}',
          itemValueBuilder: (itemIndex) => devices[itemIndex].name,
          itemLabelBuilder: (index, item) {
            return devices[index].temperature == null
                ? devices[index].onOff?.mode.name ?? 'Off'
                : (item.max ?? 0).toTemperature();
          },
        );
      },
    );
  }

  List<Device> _set(AsyncSnapshot<DriverDevicesEvent> snapshot) {
    final result =
        ref.read(deviceServiceProvider).whereCached((e) => e.hasTemperature);
    if (result.isPresent) {
      final devices = result.value;
      devices.sort((a, b) => a.temperature?.compareTo(b.temperature ?? 0) ?? 0);
      return devices;
    }
    return [];
  }
}
