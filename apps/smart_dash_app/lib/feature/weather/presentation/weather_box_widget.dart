import 'package:flutter/material.dart';
import 'package:smart_dash_app/core/presentation/widget.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';

import 'weather.dart';

class WeatherBoxWidget extends StatelessWidget {
  const WeatherBoxWidget({
    super.key,
    this.step,
    required this.hours,
  });

  final int hours;
  final WeatherTimeStep? step;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (step == null) const Text('-') else toWeatherSymbol(step!, 32),
        Text(
          '${hours}h',
          style: getLegendTextStyle(context),
        ),
      ],
    );
  }
}
