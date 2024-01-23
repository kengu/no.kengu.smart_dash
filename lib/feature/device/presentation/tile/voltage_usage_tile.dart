import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/util/time/duration.dart';
import 'package:smart_dash/util/time/time_series.dart';
import 'package:smart_dash/core/presentation/widget/tile/sparkline_tile.dart';
import 'package:smart_dash/util/data/units.dart';

class VoltageTile<T extends num> extends StatelessWidget {
  const VoltageTile({
    super.key,
    required this.history,
    required this.duration,
  });

  final Duration duration;
  final Optional<TimeSeries> history;

  @override
  Widget build(BuildContext context) {
    final usage = history.orElseNull ?? TimeSeries.empty('voltage');
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
      valueBuilder: (data) => data.toVoltage(fractionDigits: 0),
      lineLabeler: (index) => usage.tsAgo(begin + index.toInt()),
    );
  }
}
