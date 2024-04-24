import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/core/presentation/widget/tile/sparkline_tile.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

class PowerUsageTile<T extends num> extends ConsumerWidget {
  PowerUsageTile({
    super.key,
    required this.size,
    required this.power,
    required this.duration,
  }) {
    assert(
      power.orElseNull?.isPower == true,
      'Only token with '
      'unit [${ValueUnit.power.name}] expected, found'
      'unit [${power.orElseNull?.unit.name}]',
    );
  }

  final int size;

  final Duration duration;

  final Optional<Token> power;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(historyProvider(power.orElseNull)).when(
          data: _build,
          loading: _build,
          error: SmartDashErrorWidget.from,
        );
  }

  Widget _build([HistoryEvent? event]) {
    //debugPrint('power_usage_tile[${power.orElseNull?.name}][$event]');
    final usage =
        power.orElseNull?.toTs(event, size) ?? TimeSeries.empty('power_usage');

    final from = usage.end.subtract(duration);
    final begin = max(0, usage.indexAt(from));

    return SparklineTile<int>(
      key: ValueKey(usage.name),
      title: 'Power Usage',
      subTitle: 'Last ${duration.inMinutes} minutes',
      leading: const Icon(
        Icons.electric_bolt,
        color: Colors.lightGreen,
      ),
      begin: begin,
      history: usage,
      lineMin: 1,
      lineStep: duration.nice(4).steps(),
      kLine: const [Sparkline.kMin, Sparkline.kMax],
      valueBuilder: (data) => data.toPower(),
      pointLabeler: (data) => data.toPower(0),
      lineLabeler: (index) => usage.tsAgo(begin + index.toInt()),
    );
  }
}
