import 'package:flutter/material.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/feature/weather/presentation/weather.dart';
import 'package:smart_dash/core/presentation/widget.dart';

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
