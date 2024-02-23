import 'package:flutter/material.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/feature/weather/presentation/weather.dart';
import 'package:smart_dash/util/widget.dart';

class WeatherForecastWidget extends StatelessWidget {
  const WeatherForecastWidget(
    this.weather, {
    super.key,
    required this.now,
    required this.hours,
  });

  final DateTime now;
  final int hours;
  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    final when = now.add(Duration(hours: hours));
    final forecast = _select(weather, when, false);
    final actual = forecast?.time.difference(now).inHours ?? hours;
    final symbol =
        forecast == null ? const Text('-') : toWeatherSymbol(forecast, 32);
    return Column(
      children: [
        symbol,
        Text(
          '${actual}h',
          style: getLegendTextStyle(context),
        ),
      ],
    );
  }
}

WeatherTimeStep? _select(Weather? weather,
    [DateTime? now, bool closest = true]) {
  WeatherTimeStep? step;
  if (weather != null) {
    final it = weather.props.timeseries.iterator;
    if (it.moveNext()) {
      step = it.current;
      var looking = true;
      now ??= DateTime.now().toUtc();
      var delta = step.time.difference(now);
      while (looking && it.moveNext()) {
        if (closest) {
          final next = it.current.time.difference(now).abs();
          delta = delta.abs();
          if (next < delta) {
            step = it.current;
            delta = next;
          }
          looking = delta.inMinutes >= 60;
        } else {
          if (looking = now.difference(step!.time).inMinutes > 0) {
            step = it.current;
          }
        }
      }
    }
  }
  return step;
}
