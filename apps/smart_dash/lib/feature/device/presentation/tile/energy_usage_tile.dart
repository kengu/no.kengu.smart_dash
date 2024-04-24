import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/core/presentation/widget/tile/sparkline_tile.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

class EnergyUsageTile<T extends num> extends ConsumerWidget {
  EnergyUsageTile({
    super.key,
    required this.size,
    required this.energy,
    required this.duration,
  }) {
    assert(
      energy.orElseNull?.isEnergy == true,
      'Only token with '
      'unit [${ValueUnit.energy.name}] expected, found'
      'unit [${energy.orElseNull?.unit.name}]',
    );
  }

  final int size;

  final Duration duration;

  final Optional<Token> energy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(historyProvider(energy.orElseNull)).when(
          data: _build,
          loading: _build,
          error: SmartDashErrorWidget.from,
        );
  }

  Widget _build([HistoryEvent? event]) {
    //debugPrint('energy_usage_tile[${energy.orElseNull?.name}][$event]');
    final usage = energy.orElseNull?.toTs(event, size) ??
        TimeSeries.empty('energy_usage');

    final from = usage.end.subtract(duration);
    final begin = max(0, usage.indexAt(from));

    return SparklineTile<int>(
      key: ValueKey(usage.name),
      title: 'Energy Usage',
      subTitle: 'Last ${duration.inMinutes} minutes',
      begin: begin,
      history: usage,
      lineMin: 1,
      leading: const Icon(
        Icons.electric_bolt,
        color: Colors.lightGreen,
      ),
      lineStep: duration.nice(4).steps(),
      valueBuilder: (data) => data.toEnergy(),
      lineLabeler: (index) => usage.tsAgo(begin + index.toInt()),
    );
  }
}
