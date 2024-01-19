import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/widget/tile/sparkline_tile.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';
import 'package:smart_dash/util/data/units.dart';
import 'package:smart_dash/util/time/duration.dart';
import 'package:smart_dash/util/time/time_series.dart';

class TemperatureTile extends StatelessWidget {
  const TemperatureTile({
    super.key,
    required this.history,
    required this.duration,
  });

  final Duration duration;
  final TimeSeries history;

  @override
  Widget build(BuildContext context) {
    final from = history.end.subtract(duration);
    final begin = max(0, history.indexAt(from));
    return SparklineTile<int>(
      key: const ValueKey(Tokens.temperature),
      title: 'Temperature',
      subTitle: 'Last hour',
      begin: begin,
      history: history,
      lineMin: 1,
      lineStep: duration.nice(4).steps(),
      leading: const Icon(
        Icons.electric_bolt,
        color: Colors.lightGreen,
      ),
      valueBuilder: (data) => data.toTemperature(),
      lineLabeler: (index) => history.tsAgo(begin + index.toInt()),
    );
  }
}