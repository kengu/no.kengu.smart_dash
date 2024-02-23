import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/util/data/num.dart';
import 'package:smart_dash/util/widget.dart';

import 'weather.dart';

class WeatherInstantWidget extends StatelessWidget {
  const WeatherInstantWidget({
    super.key,
    required this.index,
    required this.weather,
  });

  final int index;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final step = weather.props.timeseries[index];
    final instant = step.data.instant;
    final airTemp = (instant.details.airTemperature ?? 0);
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final legendColor = surfaceColor.lighten(0.2);
    final textStyle = getLegendTextStyle(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        toWeatherSymbol(step, 120),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.air, color: legendColor),
                const SizedBox(width: 8),
                Text(
                  '${instant.details.windSpeed!.floor()}',
                ),
                if (instant.details.windSpeedOfGust != null)
                  Text(
                    ' (${instant.details.windSpeedOfGust!.floor()})',
                    style: textStyle,
                  ),
                Text(
                  ' ${weather.props.meta.units.windSpeed}',
                  style: textStyle,
                ),
                const SizedBox(width: 4),
                Transform.rotate(
                  angle: pi / 180 * (instant.details.windFromDirection ?? 0.0),
                  child: const Icon(Icons.arrow_downward, size: 16),
                ),
                Text(
                  ' ${Weather.toCompassDirection(
                    instant.details.windFromDirection,
                  )}',
                  style: textStyle,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  airTemp > 0 ? CupertinoIcons.drop : Icons.snowing,
                  color: legendColor,
                ),
                const SizedBox(width: 8),
                Text(
                  _toPrecipitationAmount(),
                ),
                Text(
                  '${airTemp > 0 ? ' mm rain' : ' cm snow'} next ${index > 1 ? index : 24}h',
                  style: textStyle,
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.deblur,
                    color: legendColor,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${instant.details.cloudAreaFraction?.round()}',
                ),
                Text(
                  ' ${weather.props.meta.units.cloudAreaFraction} clouds',
                  style: textStyle,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  String _toPrecipitationAmount() {
    final hours = index <= 1 ? 24 : index;
    final steps = weather.props.timeseries
        .take(hours)
        .map((e) => e.data.next1h?.details)
        .whereType<WeatherForecastDetails>()
        .where((e) => (e.precipitationAmount ?? 0) > 0)
        .map(
      (e) {
        final amountInMm = e.precipitationAmount ?? 0.0;
        final hasMinTemp = e.airTemperatureMin != null;
        final hasMaxTemp = e.airTemperatureMax != null;
        final minTemp = hasMinTemp ? e.airTemperatureMin! : 0.0;
        final maxTemp = hasMaxTemp ? e.airTemperatureMax! : 0.0;
        final temp = hasMinTemp && hasMinTemp
            ? min(minTemp, maxTemp)
            : min(minTemp, maxTemp);
        return amountInMm *
            (temp > 0 ? 1 : _calcSnowRatioInInches(temp) * 0.254);
      },
    );

    // Sum over next 24 from index
    return steps.sum().toStringAsFixed(1);
  }

  // From https://goodcalculators.com/rain-to-snow-calculator/
  double _calcSnowRatioInInches(double temp) {
    // 1 to -2
    if (temp <= 1 && temp > -3) {
      return 10;
    }
    // -3 to -7
    else if (temp <= -3 && temp > -8) {
      return 15;
    }
    // -7 to -9
    else if (temp <= -7 && temp > -10) {
      return 20;
    }
    // -10 to -12
    else if (temp <= -10 && temp > -13) {
      return 30;
    }
    // -13 to -18
    else if (temp <= -13 && temp > -19) {
      return 40;
    }
    // -18 to -29
    else if (temp <= -18 && temp > -30) {
      return 50;
    }
    // <-29
    return 100;
  }
}
