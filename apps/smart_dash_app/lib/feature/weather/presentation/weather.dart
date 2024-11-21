import 'package:flutter/material.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';

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
    height: size,
    fit: BoxFit.fill,
    cacheWidth: size.toInt(),
    cacheHeight: size.toInt(),
  );
}
