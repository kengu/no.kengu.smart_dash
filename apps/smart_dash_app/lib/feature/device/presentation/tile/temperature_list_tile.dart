import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash_app/core/presentation/widget/tile/barchart_tile.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
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
  final Map<String, Map<Identity, Device>> _cache = {};

  @override
  Widget build(BuildContext context) {
    final service = ref.read(deviceServiceProvider);
    return StreamBuilder<DriverDevicesEvent>(
      stream: service.driverEvents
          .whereType<DriverDevicesEvent>()
          .where(DeviceDriverManager.shouldProcess)
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
    if (snapshot.hasData) {
      final event = snapshot.data!;
      var devices = event.devices.where((e) => e.hasTemperature).toList();
      _cache.update(
        event.key,
        (existing) => _toMap(
          // Replace old with new devices, keep unchanged
          <Device>{...devices, ...existing.values}.toList(),
        ),
        ifAbsent: () => _toMap(devices),
      );
      devices = _cache.values.fold(
        <Device>[],
        (devices, map) => devices..addAll(map.values),
      ).toList();
      devices.sort((a, b) => a.temperature?.compareTo(b.temperature ?? 0) ?? 0);
      return devices;
    }
    return [];
  }

  Map<Identity, Device> _toMap(List<Device> devices) {
    return Map.fromEntries(devices.map(
      (e) => MapEntry(Identity.of(e), e),
    ));
  }
}
