import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/core/presentation/widget/tile/barchart_tile.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';
import 'package:smart_dash/util/data/num.dart';
import 'package:smart_dash/util/data/units.dart';

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
    final manager = ref.read(historyManagerProvider);
    return FutureBuilder<List<TimeSeries>>(
      future: manager.where((e) => e.isTemperature, ttl: Duration.zero),
      initialData: manager.whereCached((e) => e.isTemperature),
      builder: (context, snapshot) {
        final values = (snapshot.data?.isNotEmpty == true
                ? snapshot.data!
                : [TimeSeries.empty('temperature')])
            .map((e) => e.lastRow.firstOrNull ?? 0)
            .toList();
        final tokens = manager.tokens.where((e) => e.isTemperature).toList();
        return BarChartTile(
          title: 'Temperatures Now',
          icon: CupertinoIcons.thermometer,
          subtitle: 'Last updated ${DateTime.now().hour}h',
          items: values,
          hideZeroValues: false,
          chartMargin: BarChartTile.defaultChartMargin.copyWith(bottom: 8.0),
          total: 'max ${values.max().toTemperature()}',
          axisLabelBuilder: (axisIndex) => values[axisIndex] < 3
              ? tokens[axisIndex].label
              : '${axisIndex + 1}',
          itemValueBuilder: (itemIndex) => tokens[itemIndex].label,
          itemLabelBuilder: (index, item) => (item.max ?? 0).toTemperature(),
        );
      },
    );
  }
}
