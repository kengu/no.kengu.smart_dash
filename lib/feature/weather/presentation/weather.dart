import 'package:flutter/material.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';

WeatherTimeStep? selectWeatherTimeStep(Weather? weather,
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

Widget toWeatherSymbol(WeatherTimeStep step, double size) {
  final code = step.data.next1h?.summary.symbolCode ?? '';
  if (code.isEmpty) {
    return Icon(
      Icons.cloud_download_outlined,
      size: size,
    );
  }
  return Image.asset(
    'assets/images/weather/$code.png',
    width: size,
    cacheWidth: size.toInt(),
  );
}
