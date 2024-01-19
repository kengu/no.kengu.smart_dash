import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/widget/tile/sparkline_tile.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/util/data/units.dart';
import 'package:smart_dash/util/time/duration.dart';
import 'package:smart_dash/util/time/time_series.dart';

class TemperatureTile extends StatelessWidget {
  const TemperatureTile({
    super.key,
    required this.title,
    required this.history,
    required this.subtitle,
    required this.duration,
  });

  final String title;
  final String subtitle;
  final Duration duration;
  final Optional<TimeSeries> history;

  @override
  Widget build(BuildContext context) {
    final temperature = history.orElseNull ?? TimeSeries.empty('temperature');
    final from = temperature.end.subtract(duration);
    final begin = max(0, temperature.indexAt(from));
    return SparklineTile<int>(
      key: ValueKey(temperature.name),
      title: title,
      subTitle: subtitle,
      begin: begin,
      history: temperature,
      lineMin: 1,
      lineStep: duration.nice(4).steps(),
      leading: const Icon(
        CupertinoIcons.thermometer,
        color: Colors.lightGreen,
      ),
      valueBuilder: (data) => data.toTemperature(),
      lineLabeler: (index) => temperature.tsAgo(begin + index.toInt()),
    );
  }
}
