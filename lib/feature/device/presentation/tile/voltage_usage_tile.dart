import 'dart:math';

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
      lineStep: duration.nice(4).steps(),
      leading: const Icon(
        CupertinoIcons.gauge,
        color: Colors.lightGreen,
      ),
      valueBuilder: (data) => data.toVoltage(),
      lineLabeler: (index) => usage.tsAgo(begin + index.toInt()),
    );
  }
}
