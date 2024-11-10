import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_app/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash_app/core/presentation/widget/tile/sparkline_tile.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

class VoltageTile<T extends num> extends ConsumerWidget {
  VoltageTile({
    super.key,
    required this.size,
    required this.voltage,
    required this.duration,
  }) {
    assert(
      voltage.orElseNull?.isVoltage == true,
      'Only token with '
      'unit [${ValueUnit.voltage.name}] expected, found'
      'unit [${voltage.orElseNull?.unit.name}]',
    );
  }

  final int size;

  final Duration duration;

  final Optional<Token> voltage;

  @override
  build(BuildContext context, WidgetRef ref) {
    return ref.watch(historyProvider(voltage.orElseNull)).when(
          data: _build,
          loading: _build,
          error: SmartDashErrorWidget.from,
        );
  }

  Widget _build([HistoryEvent? event]) {
//    debugPrint('voltage_usage_tile[${voltage.orElseNull?.name}][$event]');
    final usage = voltage.orElseNull?.toTs(event, size) ??
        TimeSeries.empty('voltage_usage');

    final from = usage.end.subtract(duration);
    final begin = max(0, usage.indexAt(from));

    return SparklineTile<int>(
      key: ValueKey(usage.name),
      title: 'Voltage',
      subTitle: 'Last ${duration.inMinutes} minutes',
      begin: begin,
      history: usage,
      lineMin: 1,
      kLine: const [Sparkline.kMin, Sparkline.kMax],
      lineStep: duration.nice(4).steps(),
      leading: const Icon(
        CupertinoIcons.gauge,
        color: Colors.lightGreen,
      ),
      pointLabeler: (data) => data.toVoltage(0),
      valueBuilder: (data) => data.toVoltage(orderDigits: 0),
      lineLabeler: (index) => usage.tsAgo(begin + index.toInt()),
    );
  }
}
